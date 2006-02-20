Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB9py-0006pm-3o
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 07:08:22 -0500
Message-ID: <43F9B12B.7020903@ru.mvista.com>
Date: Mon, 20 Feb 2006 15:08:11 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <1140433245.2480.699.camel@localhost.localdomain>
	<43F9AE68.4040206@intel.com>
In-Reply-To: <43F9AE68.4040206@intel.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixup in NAND bad block management + fix
	of	misspring.(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexey,

Alexey, Korolev wrote:

> Thomas,
>
>> I still do not get why you need all this magic instead of fixing up
>> this->badblockpos in the first place.
>>
> Fixing this->badblockpos in low level driver will not help because, 
> according to the code this->badblockpos updates in nand_base.c 
> unconditionally.
> Moreover it's rather hard to define the conditions, because by default 
> structure "this" is filled by zeroes. (We can't distinguish advisedly 
> setting of badblockpos from the default value).

Well, maybe I'm missting something, but what prevents you from setting 
this->badblockpos to 0 *after* call to nand_scan??

Best regards,
   Vitaly
