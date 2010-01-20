Received: from ey-out-1920.google.com ([74.125.78.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXZ8d-0001ti-De
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 11:54:24 +0000
Received: by ey-out-1920.google.com with SMTP id 26so927340eyw.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 03:54:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100120102145.GV16182@darwin>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
	<20100119095024.GD16182@darwin>
	<cb9ecdfa1001190213u69469505k9c42142bdc17f750@mail.gmail.com>
	<20100119102026.GF16182@darwin>
	<cb9ecdfa1001190403v433d839dy6ba2bc018024ce15@mail.gmail.com>
	<Pine.LNX.4.64.1001191414090.32263@lnxricardw.se.axis.com>
	<20100119140600.GH16182@darwin>
	<cb9ecdfa1001191832k28961740qa825a8c8d5e631f2@mail.gmail.com>
	<2ea1731b1001192357r72d627e2gb36d71f23fd69b2e@mail.gmail.com>
	<20100120102145.GV16182@darwin>
Date: Wed, 20 Jan 2010 12:54:16 +0100
Message-ID: <2ea1731b1001200354t5ed29458h6fc98c49c1a555d5@mail.gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
From: Marco Stornelli <marco.stornelli@gmail.com>
To: Matthias Kaehlcke <matthias@kaehlcke.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	"linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
	kernelnewbies <kernelnewbies@nl.linux.org>,
	Johnny Hung <johnny.hacking@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/1/20 Matthias Kaehlcke <matthias@kaehlcke.net>:
> El Wed, Jan 20, 2010 at 08:57:44AM +0100 Marco Stornelli ha dit:
>
>> 2010/1/20 Johnny Hung <johnny.hacking@gmail.com>:
>> > 2010/1/19 Matthias Kaehlcke <matthias@kaehlcke.net>:
>> >> El Tue, Jan 19, 2010 at 02:17:22PM +0100 Ricard Wanderlof ha dit:
>> >>
>> > I consider to use ramdisk as rootfs because worry about wrong
>> > operation in rootfs (is use jffs2 rootfs) and it will cause system
>> > boot up failed.
>> > Another query, does the syslogd/klogd log files also store in jffs2
>> > rootfs? Write to jffs2 frequently will reduce flash life cycle.
>> >
>> > BRs, H. Johnny
>> >>
>> >> --
>>
>> In general a good splitting for rootfs could be: squashfs for rootfs,
>> tmpfs for volatile data (/tmp), ubifs (with a flash partition) for
>> "strong" permanent data (/etc, ....) and pramfs for "light" permanent
>> data (/var/log, .....).
>
> if ubifs is a good choice depends on the size of the partition, iirc
> it has a significant overhead for very small partitions.
>
> once using ubi it could be interesting to set up the read-only rootfs
> partition upon ubi in order to spread the wear out over a maximum of blocks.
>

I don't know the size constraints of Johnny, so it can be useful to use jffs2.

Marco
