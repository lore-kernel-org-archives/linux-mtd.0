From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <419B8715.4036BDBB@st.com>
References: <419B8715.4036BDBB@st.com>
Content-Type: text/plain
Message-Id: <1100795260.8191.7333.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Nov 2004 16:27:41 +0000
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

On Wed, 2004-11-17 at 18:15 +0100, Estelle HAMMACHE wrote:
> Hello,
> 
> here are a few corrections (I think) regarding the management
> of write or erase error with NAND flash.
>  - bad_count was not initialised

Ok.

>  - during wbuf flushing, if the previously written node filled
>    wbuf exactly, "buf" may be used instead of "wbuf"
>    in jffs2_wbuf_recover (access to null pointer)


Hmmm. But now with your change we can end up with a completely full wbuf
which we don't actually flush; we leave it in memory. We should write
that immediately, surely?

>  - there is no refiling of nextblock if a write error occurs
>    during writev_ecc (direct write, not using wbuf), 
>    so the next write may occur on the failed block

OK. Priorities on printk though please.

>  - if a write error occurs, but part of the data was written,
>    an obsolete raw node ref is added but nextblock has changed.

Where? You mean in jffs2_wbuf_recover()? That's an obsolete raw node ref
in the _new_ nextblock, surely?

> Additionally I have a question about the retry cases in
> jffs2_write_dnode and jffs2_write_dirent.
> If the write error occurs during an API call (not GC),
> jffs2_reserve_space is called again to find space to rewrite
> the node. However since we refiled the bad block, the free space
> was reduced. Is it not possible then that jffs2_reserve_space
> will need to gc to find some space ?

It is possible, yes.

> In the case of a deletion dirent, the previous dirent may be
> GCed so its version number is increased. When the deletion
> dirent is finally written in the retry, its version number
> is older than the GCed node, so it is (quietly) obsoleted.

Hmm, true. We should check f->highest_version after we reallocate space,
and update ri->version or rd->version accordingly.

> In the case of a dnode, I think there may be a deadlock
> if a dnode belonging to the same file is GCed, since the
> GC will attempt to lock f->sem.

No, because we unlock f->sem before calling jffs2_reserve_space.

> I actually saw the dirent case in my tests but since I wrote
> some nodes manually I am not sure this is a valid problem in
> ordinary JFFS2 processing ?

I think you're right -- the version number is indeed a real problem.

> Could the solution be to call jffs2_reserve_space_gc instead
> of jffs2_reserve_space ?

No, because if the write fails and then we're short of space, we want to
return -ENOSPC. We don't want to keep eating into the space qwhich is
reserved for GC.

Thanks for the report and the patches. Would you like to send me a SSH
public key so that I can give you an account and you can commit
directly?

-- 
dwmw2
