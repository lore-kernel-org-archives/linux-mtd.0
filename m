Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB9f0-0006Zd-2p
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 06:56:59 -0500
Message-ID: <43F9AE68.4040206@intel.com>
Date: Mon, 20 Feb 2006 14:56:24 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
References: <1140433245.2480.699.camel@localhost.localdomain>
In-Reply-To: <1140433245.2480.699.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of
	misspring.(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

> I still do not get why you need all this magic instead of fixing up
> this->badblockpos in the first place.
>
Fixing this->badblockpos in low level driver will not help because, 
according to the code this->badblockpos updates in nand_base.c 
unconditionally.
Moreover it's rather hard to define the conditions, because by default 
structure "this" is filled by zeroes. (We can't distinguish advisedly 
setting of badblockpos from the default value).
