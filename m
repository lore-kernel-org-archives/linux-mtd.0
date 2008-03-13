Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JZns8-0002y3-Gz
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 13:53:29 +0000
Date: Thu, 13 Mar 2008 14:53:12 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Manuel Sahm <Manuel.Sahm@feig.de>
Subject: Re: Binary Nandwrite/read to Flash
In-Reply-To: <47D92581.1030007@feig.de>
Message-ID: <Pine.LNX.4.64.0803131448330.6032@lnxricardw.se.axis.com>
References: <47D91B98.20001@feig.de>
	<Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
	<47D92581.1030007@feig.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 13 Mar 2008, Manuel Sahm wrote:

> Thank you,
>
> could you tell me the exact call:
>
> I have a NAND-Flash with PAGESSIZE =3D 0x800 and ERASEBLOCKSIZE=3D0x20000
>
> I want to write a file maybe called "test.txt" at adress 0x02000000 of th=
e=20
> NAND flash.

Something like

nandwrite -s 0x02000000 -p /dev/mtd0 test.txt

(mtd0 depending on which device your nandflash is)

(Note: you don't have to specify the padding size, nandwrite figures it=20
out by querying mtd).

> And read it back to a file "test2.txt" afterwards.

Something like

nanddump -o -b -s 0x02000000 -l <filesize> -f test2.txt /dev/mtd0

where <filesize> is the size of your file.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
