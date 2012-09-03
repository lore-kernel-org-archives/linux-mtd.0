Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Xsm-0006kr-Ii
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 14:44:09 +0000
Received: by lagu2 with SMTP id u2so3458177lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 07:44:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346682356-14997-1-git-send-email-dedekind1@gmail.com>
References: <1346682356-14997-1-git-send-email-dedekind1@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 3 Sep 2012 16:43:45 +0200
Message-ID: <CACQ1gAj4U1QfNuyOz_+AmSkNQw+1P8VtYeCsy7THSRrHcPWvJQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: fix a horrible memory deallocation bug
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/3 Artem Bityutskiy <dedekind1@gmail.com>:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> UBI was mistakingly using 'kfree()' instead of 'kmem_cache_free()' when
> freeing "attach eraseblock" structures in vtbl.c. Thankfully, this happened
> only when we were doing auto-format, so many systems were unaffected. However,
> there are still many users affected.
>
> It is strange, but the system did not crash and nothing bad happened when
> the SLUB memory allocator was used. However, in case of SLOB we observed an
> crash right away.
>
> This problem was introduced in 2.6.39 by commit
> "6c1e875 UBI: add slab cache for ubi_scan_leb objects"
>
> Reported-by: Richard Genoud <richard.genoud@gmail.com>
> Cc: stable@vger.kernel.org [v2.6.39+]
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/ubi/vtbl.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
Tested ok, works like a charm !
Thanks !
