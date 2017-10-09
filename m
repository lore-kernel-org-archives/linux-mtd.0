Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1WoN-0005VV-2D
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 12:05:36 +0000
Received: by mail-wm0-x22f.google.com with SMTP id i124so22753929wmf.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 05:05:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAL-1w2vUkw05Lrhbd99RV+R0+Uxtphn_qjLAfWLMrQ6z4srqgg@mail.gmail.com>
References: <CAL-1w2vUkw05Lrhbd99RV+R0+Uxtphn_qjLAfWLMrQ6z4srqgg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 9 Oct 2017 14:05:08 +0200
Message-ID: <CAFLxGvxs4fWDS8YiEO90s6HSuEHVgZJV0TSAGH2SPD0FHB-f+Q@mail.gmail.com>
Subject: Re: Detach the ubi device of rootfs
To: Rock Lee <rockdotlee@gmail.com>
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

Rock,

On Mon, Oct 9, 2017 at 1:11 PM, Rock Lee <rockdotlee@gmail.com> wrote:
> Hi,
> I am studying the process of reboot in linux, but did find any script
> in /etc to detach ubi device for rootfs. If I reboot the system when
> ubi device of rootfs is scrubing, is it a risk for flash ?

Why do you think you need to detach upon reboot?
UBI and UBIFS are designed to face power-cuts at any time.
Although, sane setups with initramfs/systemd unmount also the rootfs
upon reboot.

-- 
Thanks,
//richard
