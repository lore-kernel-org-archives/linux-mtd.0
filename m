Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1jsN-0004LW-TQ
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 02:02:33 +0000
Received: by mail-qt0-x22f.google.com with SMTP id q4so47132308qtq.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 19:02:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxs4fWDS8YiEO90s6HSuEHVgZJV0TSAGH2SPD0FHB-f+Q@mail.gmail.com>
References: <CAL-1w2vUkw05Lrhbd99RV+R0+Uxtphn_qjLAfWLMrQ6z4srqgg@mail.gmail.com>
 <CAFLxGvxs4fWDS8YiEO90s6HSuEHVgZJV0TSAGH2SPD0FHB-f+Q@mail.gmail.com>
From: Rock Lee <rockdotlee@gmail.com>
Date: Tue, 10 Oct 2017 10:02:09 +0800
Message-ID: <CAL-1w2vC4-fesPcjKHTtn3N9xNOA7Xa7PZ-O0Pu8VD5mg-t2NA@mail.gmail.com>
Subject: Re: Detach the ubi device of rootfs
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Why do you think you need to detach upon reboot?
> UBI and UBIFS are designed to face power-cuts at any time.
> Although, sane setups with initramfs/systemd unmount also the rootfs
> upon reboot.
>

When reboot, UBIFS will be remount as read-only, from the filesystem
part, it is safe, because there is no data write to it.  I see ubi
background thread will exit when ubi detach, and there would no
scrubing anymore, I am sure reboot after detach is safe enough in UBI
layer. I am just curious what will happen when reboot the system while
ubi is scrubing. Will it damage the flash if this situation happens a
lot?

Thanks
-- 
Cheers,
Rock
