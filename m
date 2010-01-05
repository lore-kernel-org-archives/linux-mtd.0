Received: from [193.13.178.8] (helo=miranda.se.axis.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NS4RD-00063i-E9
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 08:06:51 +0000
Date: Tue, 5 Jan 2010 09:06:08 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: linux newbie <linux.newbie79@gmail.com>
Subject: Re: JFFS2 - speed up while booting
In-Reply-To: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Jan 2010, linux newbie wrote:

> Hi,
>
> I am using linux version (linux.2.6.31) on my embedded ARM based target.
>
> We are using JFFS2 filesystem to read/write data to NAND flash
> (32MBytes) and our root file system resides in it.
>
> It takes long time during kernel booting, if we have root file system
> in NAND, but its very fast if we place our file system in SDRAM.
>
> Is there any way to speed up the booting process?
>
> Eagerly waiting for your valuable suggestion.

Is it slow during every boot or just the first after you've written your=20
file system image to the flash?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
