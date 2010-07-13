Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYdQ5-0006Wk-9I
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 11:13:02 +0000
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C346D5B.2000609@parrot.com>
References: <4C346D5B.2000609@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 14:07:54 +0300
Message-ID: <1279019274.31639.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2010-07-07 at 14:04 +0200, Matthieu CASTET wrote:
> PS : On another OS using the same flash (with a proprietary fs), we saw 
> that interrupted erase can do weird stuff. The eraseblock with 
> interrupted erase can become unstable. For example it acts like erased 
> block, can be written with data (and be can read again) but after some 
> times uncorrectable error happens.
>  From what I understood, ubi should be safe because in case of 
> interrupted erase, we will add it to erase or corr list, erase the block 
> again before writing EC.

Yes.

> BTW what's the difference between erase and corr list in scan ? We seem 
> to do the same thing for these lists (schedule_erase).

Probably we wanted to do something special with corrupted eraseblocks,
so introduced a separate list for this, in current implementation it is
not really needed. It is convenient because we then can walk the list
and print corrupted block numbers (we do this in ubi_scan()).

So, let's keep it this way.

> [1]
> UBIFS: mark VFS SB RO too
> UBI: init even if MTD device cannot be attached, if built into kernel
> UBI: remove reboot notifier
> random: Remove unused inode variable
> random: drop weird m_time/a_time manipulation
> UBI: add write checking
> UBI: simplify debugging return codes
> UBI: fix attaching error path
> UBI: support attaching by MTD character device name
> UBI: mark few variables as __initdata
> UBI: fix volume creation input checking
> UBI: fix memory leak in update path
> UBI: add more checks to chdev open
> UBI: initialise update marker
> UBIFS: support mounting of UBI volume character devices
> UBI: Add ubi_open_volume_path

You also wan this (new) patch I think:
http://git.infradead.org/ubifs-2.6.git/commit/6fb4374f6b1b3932f3acfe9d353568d3d8599cad

I'll add it to the back-port trees at some point as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
