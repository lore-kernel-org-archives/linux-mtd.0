Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1PCr-0003vp-Jz
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 00:44:43 +0000
Received: by mail-vc0-f171.google.com with SMTP id hy4so59443vcb.16
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 16:44:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt2dbK1EayqrvNWsZQxiCJ97YidHYGLs-DC8pv3Ggitz1w@mail.gmail.com>
References: <CAAK6Zt2dbK1EayqrvNWsZQxiCJ97YidHYGLs-DC8pv3Ggitz1w@mail.gmail.com>
Date: Thu, 18 Dec 2014 01:44:19 +0100
Message-ID: <CAFLxGvwXB5Vwu8iK0+HUYx8Df3_32ShGDJFcwhAp9L=7_BTPuQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Ehrenberg <dehrenberg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Cc: grundler@chromium.org, Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2014 at 12:16 AM, Daniel Ehrenberg
<dehrenberg@chromium.org> wrote:
> If one ubi volume is corrupted but another is not, it should be
> possible to initialize that ubiblock from a kernel commandline which
> includes both of them. This patch changes the error handling behavior
> in initializing ubiblock to ensure that all parameters are attempted
> even if one fails. If there is a failure, it returns one of the
> error status codes. It also makes error messages more descriptive
> by including the name of the UBI volume that failed.
>
> Tested: Formatted ubi volume /dev/ubi5_0 in a corrupt way and
> dev/ubi3_0 properly and included "ubi.block=5,0 ubi.block=3,0" on
> the kernel command line. At boot, I see the following in the console:
> [   21.082420] UBI error: ubiblock_create_from_param: block: can't
> open volume on ubi5_0, err=-19
> [   21.084268] UBI: ubiblock3_0 created from ubi3:0(rootfs)
>
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>

Makes sense to me.
Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
