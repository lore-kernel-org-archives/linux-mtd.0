From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <419CE1E8.F20DD890@st.com>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
Content-Type: text/plain
Message-Id: <1100870238.8191.7368.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 13:17:18 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-18 at 18:54 +0100, Estelle HAMMACHE wrote:
> David Woodhouse wrote:
> > >  - during wbuf flushing, if the previously written node filled
> > >    wbuf exactly, "buf" may be used instead of "wbuf"
> > >    in jffs2_wbuf_recover (access to null pointer)
> > 
> > Hmmm. But now with your change we can end up with a completely full wbuf
> > which we don't actually flush; we leave it in memory. We should write
> > that immediately, surely?
> 
> Not necessarily I think. If we write it immediately and the write fails,
> we have a fatal error. But if we leave it be, the next call to 
> jffs2_flash_writev will flush the buffer and we get 1 more try. 
> Unless there is something I don't understand, there is no harm in 
> leaving the wbuf full.

Generally we should flush the wbuf as soon as we can. And if there's
going to be an error when we retry, surely we want that to happen
_immediately_ so that the _current_ write() call returns an error,
rather than leaving it in the wbuf and then losing it later?
 
> > OK. Priorities on printk though please.
> 
> OK. (was actually a copy/paste so I'll check the wbuf recover too
> and maybe make a function for the refiling).

Hm. Those are all my fault then -- but do as I say, not as I do :)

> > >  - if a write error occurs, but part of the data was written,
> > >    an obsolete raw node ref is added but nextblock has changed.
> > 
> > Where? You mean in jffs2_wbuf_recover()? That's an obsolete raw node ref
> > in the _new_ nextblock, surely?
> 
> No, it is the "Mark the space as dirtied" case in jffs2_write_dirent and
> jffs2_write_dnode. I think this happens only if the write error occurs
> on mtd->writev_ecc and part of the data was successfully written by
> jffs2_flush_wbuf or writev_ecc previously so jffs2_flash_writev says 
> some data was written. In this case, when jffs2_write_dirent/dnode
> adds this obsolete raw node ref for the dirty space, nextblock was 
> modified during the refiling and / or recovery.

OK... you mean the case where there was already a node in the wbuf and
the wbuf flush failed, so we rewrote that node to a new block, along
with the start of the new node? Then the write of the _rest_ of the new
node failed, and we return with 'retlen' set to the amount of the new
node that fitted into the wbuf and we actually written?

I think that ought to be OK though because we only refiled enough
raw_node_refs to cover the _previous_ nodes?

> > Hmm, true. We should check f->highest_version after we reallocate space,
> > and update ri->version or rd->version accordingly.
> 
> This was my first idea too but I found it ugly to tamper with
> structures which are clearly the responsibility of the caller.
> However this is a recovery case so... maybe it is necessary.

Well we can always turn it around and make them always the
responsibility of the callee instead -- set them _always_ in
jffs2_write_{dirent,dnode}?

> If we use jffs2_reserve_space_gc both in jffs2_wbuf_recover and the
> dnode/dirent retry cases I believe we will write at most 2*4KB = 8KB 
> this way ? Then further API calls will do the GC. Is this unacceptable ?

I also want to increase the maximum size of data node... I really don't
like letting anything else eat into our reserved space unless we really
need to. Fixing up the version number isn't so hard.

> We have a firewall here so I don't think CVS will work. I will ask.

A firewall surely shouldn't prevent _outgoing_ connections to port 22?
A web proxy which supports CONNECT requests may also allow you to make
connections to port 22 -- ssh can use that if it's available.

-- 
dwmw2
