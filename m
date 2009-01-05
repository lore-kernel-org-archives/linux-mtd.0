Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJkS3-00022z-5k
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 08:04:43 +0000
Date: Mon, 5 Jan 2009 08:52:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: peter meng <mengsanshui@yahoo.com.cn>
Subject: Re: Question relates 2K page size flash chip
In-Reply-To: <448671.97417.qm@web15703.mail.cnb.yahoo.com>
Message-ID: <Pine.LNX.4.64.0901050852060.31730@lnxricardw.se.axis.com>
References: <448671.97417.qm@web15703.mail.cnb.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 3 Jan 2009, peter meng wrote:

> I met a problem that use K9F1G08 flash with 2K page size on Linux .
> I tried jffs2 and yaffs2 file system but occurs same error info as follow=
ing
>
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB=20
> 1,8V 8-bit)
> ...
> Seems this problem is caused since 2K page size with flash ,so how to=20
> resolve this problem ? Whether need do related work within u-boot=20
> because I suppose u-boot given wrong data format to flash that Linux mtd=
=20
> does not know it ?

Why do you think it is related to the 2k page size? This type of flash has=
=20
been supported by mtd for a very long time now.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
