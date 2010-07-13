Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYeG6-0000cw-Vm
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 12:06:50 +0000
Message-ID: <4C3C56D1.7060201@parrot.com>
Date: Tue, 13 Jul 2010 14:06:41 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com> <1279019274.31639.39.camel@localhost>
In-Reply-To: <1279019274.31639.39.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy a écrit :
> Hi,
>> [1]
>> UBIFS: mark VFS SB RO too
>> UBI: init even if MTD device cannot be attached, if built into kernel
>> UBI: remove reboot notifier
>> random: Remove unused inode variable
>> random: drop weird m_time/a_time manipulation
>> UBI: add write checking
>> UBI: simplify debugging return codes
>> UBI: fix attaching error path
>> UBI: support attaching by MTD character device name
>> UBI: mark few variables as __initdata
>> UBI: fix volume creation input checking
>> UBI: fix memory leak in update path
>> UBI: add more checks to chdev open
>> UBI: initialise update marker
>> UBIFS: support mounting of UBI volume character devices
>> UBI: Add ubi_open_volume_path
> 
> You also wan this (new) patch I think:
> http://git.infradead.org/ubifs-2.6.git/commit/6fb4374f6b1b3932f3acfe9d353568d3d8599cad
> 
Yes I managed to trigger this case :)
I also taken 
http://git.infradead.org/ubifs-2.6.git/commitdiff/276de5d2a18bcdc69e6d48a4d96afc14cfef9dcb


Thanks,

Matthieu
