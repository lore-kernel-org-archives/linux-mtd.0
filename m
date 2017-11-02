Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAJhs-0004bt-Jm
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 17:55:10 +0000
Received: by mail-wr0-x232.google.com with SMTP id j15so337411wre.8
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 10:54:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f46ce07819e74170a974bb7b0b5cddf1@itk-engineering.de>
References: <f46ce07819e74170a974bb7b0b5cddf1@itk-engineering.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 2 Nov 2017 18:54:45 +0100
Message-ID: <CAFLxGvz=3DP7BtB0=LWjGW2opMd1YuDn4A-ouQjbF9DDnMhMBw@mail.gmail.com>
Subject: Re: ubiupdatevol read input from stdin or similar
To: Martin Hollingsworth <Martin.Hollingsworth@itk-engineering.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

On Thu, Nov 2, 2017 at 6:09 PM, Martin Hollingsworth
<Martin.Hollingsworth@itk-engineering.de> wrote:
> Hello MTD Tools community,
> I am searching for help on the usage of ubiupdatevol.
> I am using ubiupdatevol version 1.5.2 and would like to pass input data from stdin or similar sources.
> I hope to achieve something like the following line, where dd can be replaced by various other tools:
>
> dd if=/dev/urandom | ubiupdatevol /dev/ubi10_1
>
> However the above example always fails with the following error:
>
> ubiupdatevol: error!: specify UBI device name and image file name as first 2 parameters (use -h for help)
>
> However the commit ab8c6fb93ce9db0f09401c4b819b0b277dc00340 gives me the impression, that it could be done.
> http://git.infradead.org/mtd-utils.git/commit/ab8c6fb93ce9db0f09401c4b819b0b277dc00340
>
> However I cannot figure out how to make this work. If anyone has a code example I would be very grateful for your support!

Did you try using "-" as filename?

-- 
Thanks,
//richard
