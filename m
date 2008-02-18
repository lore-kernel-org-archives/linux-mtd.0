Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JR8Sv-0000Q0-8d
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 16:03:37 +0000
Date: Mon, 18 Feb 2008 17:02:40 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: at91_nand question
In-Reply-To: <20080219.004337.74388852.anemo@mba.ocn.ne.jp>
Message-ID: <Pine.LNX.4.64.0802181701090.3508@lnxricardw.se.axis.com>
References: <20080219.004337.74388852.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: andrew@sanpeople.com, Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 19 Feb 2008, Atsushi Nemoto wrote:

> Hi.  Looking at at91_nand.c, I found that this driver does not
> controls NCE signal during normal operations.  The driver only enables
> NCE on at91_nand_probe() and disables NCE on at91_nand_remove().
>
> Is this normal behavior?  I thought a nand driver should control NCE
> signal on cmd_ctrl routine.  If the nand driver supported only one
> chip, it can omit NCE control?
>
> Though it seems work fine as is, I wonder keeping chipselect signal
> low all the time is normal.

I think it is necessary for some flash chips. E.g. to erase, one cannot=20
just issue an erase command and make NCE go inactive, as making NCE go=20
inactive stops the erase procedure until asserted again.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
