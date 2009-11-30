Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF23s-0000od-4H
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 08:56:52 +0000
Subject: Re: UBIFS: problems writing to the partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alemao <xcarandiru@gmail.com>
In-Reply-To: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
References: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 10:55:39 +0200
Message-Id: <1259571339.7518.58.camel@localhost>
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

How do you flash your UBI image then?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
