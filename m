Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KghMM-00047e-Fd
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 14:53:30 +0000
Date: Fri, 19 Sep 2008 16:53:23 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Karl Beldan <karl.beldan@gmail.com>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
In-Reply-To: <48D3BA2B.1030005@gmail.com>
Message-ID: <Pine.LNX.4.64.0809191651360.29177@lnxricardw.se.axis.com>
References: <48D3BA2B.1030005@gmail.com>
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


On Fri, 19 Sep 2008, Karl Beldan wrote:

>> ...
>> nand_get_flash_type: second ID read did not match 01,ec against ec,7a .
>> ...

> I had the same problem with Microns's.
> Their datasheet mentionned the need of resetting the chip after
> power-up though.
> My patch : http://patchwork.ozlabs.org/patch/279/
> cf http://lists.infradead.org/pipermail/linux-mtd/2008-September/023009.h=
tml.
>
> Hope it'll help.

Thanks for the patch. Applied it, but it didn't seem to make any=20
difference (except that the read bytes are 01,bf and 0b,0b respectively
instead of the values given above). Still, it's a lead to work on.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
