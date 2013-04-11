Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQIsH-00037W-V4
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 14:53:18 +0000
Received: by mail-wi0-f179.google.com with SMTP id hn17so649144wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 07:53:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OF132C4FA1.3FE4C814-ON48257B4A.00337A2A-48257B4A.0033A6D2@zte.com.cn>
References: <OF132C4FA1.3FE4C814-ON48257B4A.00337A2A-48257B4A.0033A6D2@zte.com.cn>
Date: Thu, 11 Apr 2013 16:53:15 +0200
Message-ID: <CAFLxGvy_q+64W7SKUL3GtAt8dwdr1Hc_UigMk330CJanPvSJfw@mail.gmail.com>
Subject: Re: ubi fastmap memory leak
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: wang.bo116@zte.com.cn
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Thu, Apr 11, 2013 at 11:23 AM,  <wang.bo116@zte.com.cn> wrote:
> Hello=A3=AC
>         When use ubi fastmap,i think there is a memory leak in
> "ubi_attach" function.Think about this scene=A3=BA
>
>         1. In "ubi_attach" function, "alloc_ai" function called to alloc =
a
> slab cache named "ubi_aeb_slab_cache".
>         Then use "ai->aeb_slab_cache" to record the cache.
>
>         2. ubi_attach -> scan_fast -> ubi_scan_fastmap ->
> ubi_attach_fastmap,
>         in "ubi_attach_fastmap" function, slab cache named
> "ubi_ainf_peb_slab" will be alloced.
>         Because of this slab cache also recorded in "ai->aeb_slab_cache",
> so, in fact it overwrite the previously one.
>
>         3. When "destroy_ai" called , it only free "ubi_ainf_peb_slab".
>
>         I made a patch base on Linux 3.9-rc6, it fix this problem use a
> temporary ai for fastmap scan.
>         During my test, this patch like work good.

So, we call ubi_scan_fastmap() with an ai where ->aeb_slab_cache
points already to a
slab cache?
I think it would be best to remove the kmem_cache_create() from
ubi_scan_fastmap()
completely.

What do you think?

--
Thanks,
//richard
