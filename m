Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUqV8-0006iR-4D
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 12:55:24 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <419CE1E8.F20DD890@st.com>
Date: Thu, 18 Nov 2004 18:54:48 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
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
> >  - during wbuf flushing, if the previously written node filled
> >    wbuf exactly, "buf" may be used instead of "wbuf"
> >    in jffs2_wbuf_recover (access to null pointer)
> 
> Hmmm. But now with your change we can end up with a completely full wbuf
> which we don't actually flush; we leave it in memory. We should write
> that immediately, surely?

Not necessarily I think. If we write it immediately and the write fails,
we have a fatal error. But if we leave it be, the next call to 
jffs2_flash_writev will flush the buffer and we get 1 more try. 
Unless there is something I don't understand, there is no harm in 
leaving the wbuf full.

> >  - there is no refiling of nextblock if a write error occurs
> >    during writev_ecc (direct write, not using wbuf),
> >    so the next write may occur on the failed block
> 
> OK. Priorities on printk though please.

OK. (was actually a copy/paste so I'll check the wbuf recover too
and maybe make a function for the refiling).

> >  - if a write error occurs, but part of the data was written,
> >    an obsolete raw node ref is added but nextblock has changed.
> 
> Where? You mean in jffs2_wbuf_recover()? That's an obsolete raw node ref
> in the _new_ nextblock, surely?

No, it is the "Mark the space as dirtied" case in jffs2_write_dirent and
jffs2_write_dnode. I think this happens only if the write error occurs
on mtd->writev_ecc and part of the data was successfully written by
jffs2_flush_wbuf or writev_ecc previously so jffs2_flash_writev says 
some data was written. In this case, when jffs2_write_dirent/dnode
adds this obsolete raw node ref for the dirty space, nextblock was 
modified during the refiling and / or recovery.


> > Additionally I have a question about the retry cases in
> > jffs2_write_dnode and jffs2_write_dirent.
> > If the write error occurs during an API call (not GC),
> > jffs2_reserve_space is called again to find space to rewrite
> > the node. However since we refiled the bad block, the free space
> > was reduced. Is it not possible then that jffs2_reserve_space
> > will need to gc to find some space ?
> 
> It is possible, yes.
> 
> > In the case of a deletion dirent, the previous dirent may be
> > GCed so its version number is increased. When the deletion
> > dirent is finally written in the retry, its version number
> > is older than the GCed node, so it is (quietly) obsoleted.
> 
> Hmm, true. We should check f->highest_version after we reallocate space,
> and update ri->version or rd->version accordingly.

This was my first idea too but I found it ugly to tamper with
structures which are clearly the responsibility of the caller.
However this is a recovery case so... maybe it is necessary.

> > In the case of a dnode, I think there may be a deadlock
> > if a dnode belonging to the same file is GCed, since the
> > GC will attempt to lock f->sem.
> 
> No, because we unlock f->sem before calling jffs2_reserve_space.

Right, I got confused.

> > I actually saw the dirent case in my tests but since I wrote
> > some nodes manually I am not sure this is a valid problem in
> > ordinary JFFS2 processing ?
> 
> I think you're right -- the version number is indeed a real problem.
> 
> > Could the solution be to call jffs2_reserve_space_gc instead
> > of jffs2_reserve_space ?
> 
> No, because if the write fails and then we're short of space, we want to
> return -ENOSPC. We don't want to keep eating into the space qwhich is
> reserved for GC.

If we use jffs2_reserve_space_gc both in jffs2_wbuf_recover and the
dnode/dirent retry cases I believe we will write at most 2*4KB = 8KB 
this way ? Then further API calls will do the GC. Is this unacceptable ?

> Thanks for the report and the patches. Would you like to send me a SSH
> public key so that I can give you an account and you can commit
> directly?

We have a firewall here so I don't think CVS will work. I will ask.
Like many people I rely on snapshots. BTW if JFFS2 and JFFS3 are 
maintained in parallel do we get 2 sets of snapshots ? or is there
another way to get both versions ?
Anyway I'll send a corrected patch to the list when decision is made
about the node version problem - I guess the version check/update ?

Bye
Estelle
