Received: from mail-fx0-f221.google.com ([209.85.220.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz8wy-0001IT-0h
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 13:36:16 +0000
Received: by fxm21 with SMTP id 21so2018097fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Apr 2010 06:36:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <804f0d21003300551h225f4bdfp66e9072115d0ad69@mail.gmail.com>
References: <804f0d21003300551h225f4bdfp66e9072115d0ad69@mail.gmail.com>
Date: Tue, 6 Apr 2010 14:36:12 +0100
Message-ID: <w2w804f0d21004060636zee222ad3j1c3f90afdc82e65d@mail.gmail.com>
Subject: Re: uncorrectable error : mtd->read(0x1fc bytes from 0x9e0e04)
	returned ECC error
From: Arno Steffen <arno.steffen@googlemail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does nobody has an idea what is the reason for this errors, that
occurs when I want to mount
(mount -t jffs2 /dev/mtdblock5 /tmp) a jffs2 partition?


2010/3/30 Arno Steffen <arno.steffen@googlemail.com>:
> I changed to a new kernel and did probably something wrong in setup
> the mtd partitions ord mtd driver.
> With the same flash file system I don't have trouble with my old
> kernel, with the new (2.6.33) I get tons of messages like above.
> But at the end (after some minutes) I =A0could access it.
> I can do a "touch test" and get back
> uncorrectable error :
> mtd->read(0x6ad bytes from 0x2226fc) returned ECC error
> but touch is now in filesystem.
> Does someone ones what I missed in configure/setup the kernel?
>
