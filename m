Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqSBL-0006GU-5z
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 16:28:16 +0000
In-Reply-To: <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
To: Paul Walmsley <paul@pwsan.com>
Message-ID: <OF645D734B.78418504-ONC1257991.005A101B-C1257991.005A7809@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 17:28:09 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Purdie <rpurdie@openedhand.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Orjan Friberg <of@flatfrog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Paul Walmsley <paul@pwsan.com>
> To: Orjan Friberg <of@flatfrog.com>
> Cc: David Woodhouse <dwmw2@infradead.org>, Richard Purdie <rpurdie@openedhand.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
> Date: 2012/01/26 17:14
> Subject: Re: CONFIG_PREEMPT and JFFS2 oops
> Sent by: linux-mtd-bounces@lists.infradead.org
>
> On Thu, 26 Jan 2012, Orjan Friberg wrote:
>
> > Ok, so comprbuf comes from jffs2_compress and becomes NULL for some reason
> > (hence the oops).
> >
> > Initially I had CMODE_FAVOUR_LZO.  With that, things only worked with
> > PREEMPT_NONE.  However, when changing to CMODE_PRIORITY or CMODE_NONE things
> > do seem to work *with* PREEMPT.
> >
> > For what it's worth (with PREEMPT on):
> >
> > CMODE_FAVOUR_LZO with LZO disabled oopses.
> > CMODE_FAVOUR_LZO with only ZLIB enabled oopses.
> > CMODE_FAVOUR_LZO with ZLIB/LZO/RTIME/RUBIN disabled does not oops.
> >
> > Thus, the bug seems to be in the *selection* of compression algorithm (when
> > there is at least one algoritm in the list), rather than in the specific
> > compression algorithms themselves.
>
> The locking in jffs2_compress() isn't right.  this->compr_buf could be
> freed or reassigned while the compressor is busy using it.  If I'm reading
> the code correctly, this problem could also cause data and metadata
> corruption.
>
> Want to give the following untested patch a try?  Of course, it could
> destroy everything.  So it shouldn't be used on anything important.  But
> it might fix the problem you're seeing.  The patch will need significant
> testing and review by JFFS2 experts before getting merged.
>
>
> - Paul
>
>
> From: Paul Walmsley <paul@pwsan.com>
> Date: Thu, 26 Jan 2012 08:12:09 -0700
> Subject: [PATCH] fs: jffs2: compression: fix some (but not all) races in
>  jffs2_compress()
>
> There is a nasty race in jffs2_compress() when JFFS2_COMPR_MODE_SIZE
> or JFFS2_COMPR_MODE_FAVOURLZO is selected and multiple jffs2
> filesystems are in use.  The compressor buffer is shared among all
> users of the compressor, and the buffer is freed and allocated without
> holding any lock.  This could result in NULL pointer dereferences, or,
> worse, corrupted data.
>
> There doesn't appear to be any point in having a compression buffer
> shared by all users of the compressor.  So remove this, and instead
> use a buffer that is local to the jffs2_compress() call.  This
> simplifies the locking in this function considerably.
>
> There's at least one race left in this function, between it and
> jffs2_unregister_compressor().  That's left for someone else to fix.
> Until then, it is suggested that compressors should not be registered
> or unregister while any JFFS2 filesystems are mounted.
>
> This patch is COMPLETELY UNTESTED.  It could easily DESTROY THE
> FILESYSTEM and CORRUPT DATA, so don't use it unless it's been tested
> thoroughly and the code has been reviewed by JFFS2 experts.

I think I found one bug by looking at the patch. You need 2 buffers, one
that holds the latest compressed data and one working buffer.

  Jocke
