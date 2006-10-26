Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gd0wz-0007B3-7C
	for linux-mtd@lists.infradead.org; Thu, 26 Oct 2006 09:50:57 +0100
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by krynn.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	k9Q8oWGm024343
	for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2006 10:50:32 +0200
Date: Thu, 26 Oct 2006 10:52:04 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work
	when flash-based bbt not enabled
In-Reply-To: <453DDE6C.2070304@ru.mvista.com>
Message-ID: <Pine.LNX.4.64.0610250851290.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>
	<1161597141.19446.276.camel@pmac.infradead.org>
	<453DDE6C.2070304@ru.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 24 Oct 2006, Vitaly Wool wrote:

>> Hm. That seems wrong to me. If we don't want to read or write the main
>> area, we should set ops.len to zero. And if that doesn't work, it should
>> probably be fixed.
>>
>> I'd rather see a patch which fixes that.
>>
>>
> We discussed that w/ tglx some time ago and we couldn't find a 5 minute
> solution :)

Was there a discussion on the mtd list? I scanned the archives back to=20
April and couldn't find anything.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
