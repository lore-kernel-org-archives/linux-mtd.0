Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePA73-00041c-EM
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 16:42:31 +0000
From: Richard Weinberger <richard@nod.at>
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Mounting issue with old uboot and new rootfs
Date: Wed, 13 Dec 2017 17:42:37 +0100
Message-ID: <1850520.5cNxzxR8i7@blindfold>
In-Reply-To: <548ecb18-722c-f919-b245-d1b1c15c1697@nedap.com>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <5001344.Umix9c0TK6@blindfold>
 <548ecb18-722c-f919-b245-d1b1c15c1697@nedap.com>
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

Am Mittwoch, 13. Dezember 2017, 11:18:02 CET schrieb Jaap de Jong:
> > Does everything work as expected if you don't set the resize flag in
> > ubinize? Maybe this is the culprit.
> 
> Yes, that was my last experiment and that works. It turns off the code
> in the old uboot that modifies the volume in such a way that the new
> kernel is not able to deal with it.
> The strange thing is, that an old kernel doesn't mind.

Can you please rule out U-Boot first?
IOW don't attach UBI from U-Boot and load the kernel via TFTP/NFS, etc...
I'm still not sure whether this is a regression in Linux or U-Boot.

Thanks,
//richard
