Received: from mail-vn0-x236.google.com ([2607:f8b0:400c:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yzgwm-0003cd-HY
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 07:49:17 +0000
Received: by vnbg7 with SMTP id g7so19589094vnb.12
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2015 00:48:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiidZP8qhLHEf-e5_gHgt-9+SAhnbxEJB8h+r3HG7KJunPuGg@mail.gmail.com>
References: <CAOiidZP8qhLHEf-e5_gHgt-9+SAhnbxEJB8h+r3HG7KJunPuGg@mail.gmail.com>
Date: Tue, 2 Jun 2015 09:48:52 +0200
Message-ID: <CAFLxGvwk038FqK-r1ky8gZk+DGWqfg3DfyWdu6e_ic5szJvv0Q@mail.gmail.com>
Subject: Re: Kernel oops during untar
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Christian Litjes <flitjesdev@gmail.com>
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

On Tue, Jun 2, 2015 at 9:22 AM, Christian Litjes <flitjesdev@gmail.com> wrote:
> Hi there,
>
> The two kernel oopses below are happening in the following situation:
> A kernel with an init ramfs is mounting a mtd contains the rootfs.
> This kernel will then untar a tarball which is located in a ramdisk on the mtd.
>
> I've tried to untar with -v to figure out which file is causing it but
> this slows down the untar significantly so I'm unable to gather enough
> data. A oops will occur statistically once very 15 attempts. I hope
> this can be solved without knowing which file it is. If not I'll try
> to setup a test scenario to gather the data.
>
> Kernel version: 2.6.31.8

Please retry with a recent kernel. Maybe the issue got fixed already.

-- 
Thanks,
//richard
