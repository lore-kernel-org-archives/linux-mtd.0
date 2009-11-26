Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDYqi-00085X-7G
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 07:33:15 +0000
Subject: Re: UBIFS: problems writing to the partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alemao <xcarandiru@gmail.com>
In-Reply-To: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
References: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Nov 2009 09:32:57 +0200
Message-Id: <1259220777.29118.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-11-25 at 10:03 -0200, Alemao wrote:
> Hi all,
> 
> I have de following scenario:
> 
> - Freescale MPC8541
> - U-Boot-2009.03
> - Linux-2.6.26
> - NAND flash 512Mbit (64MB), page: 512 bytes, erase block: 16KB
> 
> 
> And Im creating UBI image with this parameters:
> 
> mkfs.ubifs -r rootfs/ -m 512 -c 3897 -e 15872 -o ubi.temp
> ubinize -o rootfs.ubifs -m 512 -p 16384 -s 256 ubinize.cfg

Please, start with validating your NAND flash/driver using the mtd
tests:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
