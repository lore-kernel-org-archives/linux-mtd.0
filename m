Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma0As-0001oZ-36
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 04:38:30 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1247055811.2208.25.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
	<1246973292.20721.313.camel@localhost.localdomain>
	<1246975692.2208.7.camel@tlvorens3lnx>
	<1246977486.20721.315.camel@localhost.localdomain>
	<1246978172.2208.13.camel@tlvorens3lnx>
	<1246978420.20721.317.camel@localhost.localdomain>
	<1246981097.2208.19.camel@tlvorens3lnx>
	<1246981542.20721.327.camel@localhost.localdomain>
	<1247055811.2208.25.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 07:36:41 +0300
Message-Id: <1249792601.9157.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-08 at 15:23 +0300, Oren wrote:
> Well...thanks...seems like my device was not work properly.
> After fixing it...i have progress in ubiattach:
> 
> 
> [ 1387.120000] UBI: volume 0 ("NAND-block1") re-sized from 133 to 1655
> LEBs
> [ 1387.130000] UBI: attached mtd2 to ubi0
> [ 1387.130000] UBI: MTD device name:            "NAND-block2"
> [ 1387.140000] UBI: MTD device size:            210 MiB
> [ 1387.140000] UBI: number of good PEBs:        1675
> [ 1387.150000] UBI: number of bad PEBs:         5
> [ 1387.150000] UBI: max. allowed volumes:       128
> [ 1387.160000] UBI: wear-leveling threshold:    4096
> [ 1387.160000] UBI: number of internal volumes: 1
> [ 1387.170000] UBI: number of user volumes:     1
> [ 1387.170000] UBI: available PEBs:             0
> [ 1387.170000] UBI: total number of reserved PEBs: 1675
> [ 1387.180000] UBI: number of PEBs reserved for bad PEB handling: 16
> [ 1387.190000] UBI: max/mean erase counter: 0/0
> [ 1387.190000] UBI: background thread "ubi_bgt0d" started, PID 141
> 
> but when trying to mount i get the following:
> 
>  mount -t ubifs ubi0:NAND-block1 /mnt/ubi 
> [ 1654.740000] UBIFS error (pid 149): validate_sb: LEB size mismatch:
> 129024 in superblock, 126976 real
> [ 1654.750000] UBIFS error (pid 149): validate_sb: bad superblock, error
> 1
> mount: mounting ubi0:NAND-block1 on /mnt/ubi failed: Invalid argument

I've just created this FAQ entry for you:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_lebsz_mismatch

Enjoy :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
