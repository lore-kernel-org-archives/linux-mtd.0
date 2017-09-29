Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxr2i-0004dg-93
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 08:53:10 +0000
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,  Yehuda Yitschak
 <yehuday@marvell.com>,  Omri Itach <omrii@marvell.com>,  Marcin Wojtas
 <mw@semihalf.com>,  Richard Weinberger <richard@nod.at>,  Antoine Tenart
 <antoine.tenart@free-electrons.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@free-electrons.com>,  linux-kernel@vger.kernel.org,  Nadav
 Haklai <nadavh@marvell.com>,  Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org,  Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>,  Shadi Ammouri <shadi@marvell.com>,  Brian
 Norris <computersforpeace@gmail.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Hanna Hawa <hannah@marvell.com>,  Igal Liberman
 <igall@marvell.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: Update Kconfig information
References: <20170928143657.26728-1-gregory.clement@free-electrons.com>
 <20170929105112.20a84cf3@windsurf.lan>
Date: Fri, 29 Sep 2017 10:52:45 +0200
In-Reply-To: <20170929105112.20a84cf3@windsurf.lan> (Thomas Petazzoni's
 message of "Fri, 29 Sep 2017 10:51:12 +0200")
Message-ID: <87k20hhoo2.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,
 
 On ven., sept. 29 2017, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> Entering nitpick mode.

nitpick accpeted! :)

I am going to send a v2.

Gregory

>
> On Thu, 28 Sep 2017 16:36:57 +0200, Gregory CLEMENT wrote:
>
>>  	  This enables the driver for the NAND flash device found on
>> -	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
>> +	  PXA3xx processors (NFCv1) and also on Armada 32bits(XP, 370, 375,
>
> missing space before parenthesis.
>
>> +	  38x, 39x) and 64bits (7K, 8K) (NFCv2).
>
> Also "Armada 32bits" isn't very good IMO, what about:
>
> 	and also on 32-bit Armada platforms (XP, 370, 375, 38x, 39x)
> 	and 64-bit Armada platforms (7K, 8K) (NFCv2).
>
> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
