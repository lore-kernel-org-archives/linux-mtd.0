Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CVBXM-0002si-S3
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2004 11:23:07 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <419E1DE0.FDD5DEC0@st.com>
Date: Fri, 19 Nov 2004 17:22:56 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse wrote:
> 
> On Thu, 2004-11-18 at 18:54 +0100, Estelle HAMMACHE wrote:
> > David Woodhouse wrote:
> > > >  - during wbuf flushing, if the previously written node filled
> > > >    wbuf exactly, "buf" may be used instead of "wbuf"
> > > >    in jffs2_wbuf_recover (access to null pointer)
> > >
> > > Hmmm. But now with your change we can end up with a completely full wbuf
> > > which we don't actually flush; we leave it in memory. We should write
> > > that immediately, surely?
> >
> > Not necessarily I think. If we write it immediately and the write fails,
> > we have a fatal error. But if we leave it be, the next call to
> > jffs2_flash_writev will flush the buffer and we get 1 more try.
> > Unless there is something I don't understand, there is no harm in
> > leaving the wbuf full.
> 
> Generally we should flush the wbuf as soon as we can. And if there's
> going to be an error when we retry, surely we want that to happen
> _immediately_ so that the _current_ write() call returns an error,
> rather than leaving it in the wbuf and then losing it later?

Whether jffs2_wbuf_recover succeeds or not, __jffs2_flush_wbuf always
returns an error so that jffs2_flash_writev returns immediately, and
the caller knows it needs to reallocate space to try again. Then, 
since wbuf is full, it will be flushed before the new (retry) node 
can be written.
The node which was in wbuf was outstanding anyway. It is not part
of the data from the current call to jffs2_flash_writev.
What I meant is that if we write wbuf in jffs2_write_recover, like we
write buf, 1 write error means we never write the node, and we lose data.
Whereas if we leave the full wbuf, the node still has 2 regular write
attempts (flush and recover) before some data is lost. I can see
no difference between this "full wbuf" case and the usual 
jffs2_wbuf_recover where wbuf is left partly filled ?

I feel that writing wbuf immediately adds code without necessity
(or maybe I'm just too lazy to test it).
On the other hand, maybe jffs2_wbuf_recover should be tweaked to
resist to failure to write buf ? in this case writing a filled-up 
wbuf immediately too would be logical. How many blocks can we
afford to refile to the bad block lists in a single call to 
jffs2_flash_writev ?


> > > >  - if a write error occurs, but part of the data was written,
> > > >    an obsolete raw node ref is added but nextblock has changed.
> > >
> > > Where? You mean in jffs2_wbuf_recover()? That's an obsolete raw node ref
> > > in the _new_ nextblock, surely?
> >
> > No, it is the "Mark the space as dirtied" case in jffs2_write_dirent and
> > jffs2_write_dnode. I think this happens only if the write error occurs
> > on mtd->writev_ecc and part of the data was successfully written by
> > jffs2_flush_wbuf or writev_ecc previously so jffs2_flash_writev says
> > some data was written. In this case, when jffs2_write_dirent/dnode
> > adds this obsolete raw node ref for the dirty space, nextblock was
> > modified during the refiling and / or recovery.
> 
> OK... you mean the case where there was already a node in the wbuf and
> the wbuf flush failed, so we rewrote that node to a new block, along
> with the start of the new node? Then the write of the _rest_ of the new
> node failed, and we return with 'retlen' set to the amount of the new
> node that fitted into the wbuf and we actually written?

I should have mentionned that the problem in 
jffs2_add_physical_node_ref cannot happen with the original code - 
it only happens with the modification of jffs2_flash_writev 
to refile nextblock on mtd->writev_ecc failure.
With the original code, nextblock it not refiled so there is no
problem in jffs2_add_physical_node_ref, but the retry occurs on the
same page which already failed in mtd->writev_ecc.

Here is an example of the obsolete node/refiled nextblock pb:
- page size 512 bytes
- start condition: wbuf contains 500 bytes
jffs2_write_dnode call, total node size 700 bytes
-->jffs2_flash_writev
------>fill up wbuf
------>donelen = 12
------>jffs2_flush_wbuf (succeeds)
------>c->mtd->writev_ecc to write 1 page - fails
------>nextblock is refiled (new code!)
------>*retlen = donelen   (= 12)
-->add obsolete frag for dirtied space 
------> free raw node & return early because c->nextblock == 0
-->probable segfault on (redundant?) jffs2_mark_node_obsolete
-->retry.

Maybe I ought to test nextblock == 0 in addition to the
obsolete flag to make the exclusion case more precise in
jffs2_add_physical_node_ref ?
Or is the "dirty" node really necessary ? what happens if we
don't list it in the raw node refs ?


> > > Hmm, true. We should check f->highest_version after we reallocate space,
> > > and update ri->version or rd->version accordingly.
> >
> > This was my first idea too but I found it ugly to tamper with
> > structures which are clearly the responsibility of the caller.
> > However this is a recovery case so... maybe it is necessary.
> 
> Well we can always turn it around and make them always the
> responsibility of the callee instead -- set them _always_ in
> jffs2_write_{dirent,dnode}?

Ok, let's do that.

bye
Estelle
