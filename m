Received: from mail-pw0-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDgKk-0006Av-CR
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 15:32:42 +0000
Received: by pwi12 with SMTP id 12so583433pwi.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Nov 2009 07:32:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1259220777.29118.56.camel@localhost>
References: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
	<1259220777.29118.56.camel@localhost>
Date: Thu, 26 Nov 2009 13:32:36 -0200
Message-ID: <d970ff420911260732m400e7605u63fe597aa82d8bcc@mail.gmail.com>
Subject: Re: UBIFS: problems writing to the partition
From: Alemao <xcarandiru@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 26, 2009 at 5:32 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2009-11-25 at 10:03 -0200, Alemao wrote:
>> Hi all,
>>
>> I have de following scenario:
>>
>> - Freescale MPC8541
>> - U-Boot-2009.03
>> - Linux-2.6.26
>> - NAND flash 512Mbit (64MB), page: 512 bytes, erase block: 16KB
>>
>>
>> And Im creating UBI image with this parameters:
>>
>> mkfs.ubifs -r rootfs/ -m 512 -c 3897 -e 15872 -o ubi.temp
>> ubinize -o rootfs.ubifs -m 512 -p 16384 -s 256 ubinize.cfg
>
> Please, start with validating your NAND flash/driver using the mtd
> tests:
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests


Im using JFFS2 with no problem. My NAND driver is OK.
