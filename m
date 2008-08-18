Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KUyTv-0001Bc-7I
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 06:44:47 +0000
Date: Mon, 18 Aug 2008 08:44:36 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Bily <hsssss1111@163.com>
Subject: Re: how could block device read OOB?
In-Reply-To: <200808180917288590868@163.com>
Message-ID: <Pine.LNX.4.64.0808180844230.24218@lnxricardw.se.axis.com>
References: <200808180917288590868@163.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 18 Aug 2008, Bily wrote:

>    Maybe this question is easy,but I just confused. I use my nand chip=20
> as a mtd block device.now I open mtdblock by using the "open()"=20
> function. and I want to read the OOB part by use the mtdblock device.now=
=20
> I want to know if I could read the OOB by operating an mtd block device=
=20
> or only I use the mtd char device could I solve this problem .Thanks!~

Use the char device to read and write the OOB.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
