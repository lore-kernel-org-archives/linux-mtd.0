Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1p2R-0001sa-Do
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 07:33:17 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Rock Lee <rockdotlee@gmail.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Detach the ubi device of rootfs
Date: Tue, 10 Oct 2017 09:33:27 +0200
Message-ID: <2001363.51LN5LPS4v@blindfold>
In-Reply-To: <CAL-1w2vC4-fesPcjKHTtn3N9xNOA7Xa7PZ-O0Pu8VD5mg-t2NA@mail.gmail.com>
References: <CAL-1w2vUkw05Lrhbd99RV+R0+Uxtphn_qjLAfWLMrQ6z4srqgg@mail.gmail.com>
 <CAFLxGvxs4fWDS8YiEO90s6HSuEHVgZJV0TSAGH2SPD0FHB-f+Q@mail.gmail.com>
 <CAL-1w2vC4-fesPcjKHTtn3N9xNOA7Xa7PZ-O0Pu8VD5mg-t2NA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 10. Oktober 2017, 04:02:09 CEST schrieb Rock Lee:
> > Why do you think you need to detach upon reboot?
> > UBI and UBIFS are designed to face power-cuts at any time.
> > Although, sane setups with initramfs/systemd unmount also the rootfs
> > upon reboot.
> 
> When reboot, UBIFS will be remount as read-only, from the filesystem
> part, it is safe, because there is no data write to it.  I see ubi
> background thread will exit when ubi detach, and there would no
> scrubing anymore, I am sure reboot after detach is safe enough in UBI
> layer. I am just curious what will happen when reboot the system while
> ubi is scrubing. Will it damage the flash if this situation happens a
> lot?

Scrubbing is an atomic operation, just like copying a LEB.
What problem do you have in mind?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
