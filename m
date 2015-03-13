Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWUXc-0007eU-7z
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 18:42:36 +0000
Received: by mail-vc0-f172.google.com with SMTP id kv19so8365110vcb.3
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2015 11:42:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5503285A.5090500@ge.com>
References: <5503285A.5090500@ge.com>
Date: Fri, 13 Mar 2015 19:42:13 +0100
Message-ID: <CAFLxGvxrpAcHN_F_yjgJP7VE1YanE9Hrga-GYW20Bjdp=zGEVA@mail.gmail.com>
Subject: Re: UBI/UBIFS: debugging help
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Renaud Barbier <renaud.barbier@ge.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 13, 2015 at 7:11 PM, Renaud Barbier <renaud.barbier@ge.com> wrote:
> My platform is based on a ARM Cortex-A9 and boots barebox from a spi-nor.
>
> I have tested UBI/UBIFS from Linux on this platform with no issue after
> disabling 4KB support for the spi nor I am using.
>
> However, I got problem on the boot loader side. UBI/UBIFS has been
> ported by the barebox community from Linux and I used it successfully
> on a previous project on a PPC platform.
>
> On the ARM platform I can ubiattach, mount the mtd partition and copy a
> small file (~65KB spanning two sectors). The issue comes when I copy out
> a larger file (512KB) out. It fails to copy the whole file.
>
> At the point of failure, ubifs_tnc_locate fails resulting in the
> function read_block to return -ENOENT.
>
> Debugging shows that in the function ubifs_search_zbranch no keys match
> is found prior to the failure.
>
> I know this list is called linux-mtd but I was hoping that somebody
> could give me a pointer on where to look next. I am currently going
> through git logs and mailing list.

In such situations I start with testing all layers bottom up.
1. Does the MTD driver work (I mean really work)
2. Does UBI work correctly? (ubi tests, etc...)
3. Same for UBIFS

HTH,
//richard

-- 
Thanks,
//richard
