Received: from mail-in-09.arcor-online.net ([151.189.21.49])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Huv6f-0002UP-ET
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 14:49:27 -0400
In-Reply-To: <46630A32.7000403@ru.mvista.com>
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<1180769992.14025.1.camel@localhost.localdomain>
	<4662E7EA.70506@ru.mvista.com>
	<d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>
	<46630256.8050909@ru.mvista.com>
	<daa1b6f2e18f06f053d538d28d3c046a@kernel.crashing.org>
	<46630A32.7000403@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <e85b2d39481e426dcd4c19a3eaaf8238@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Sun, 3 Jun 2007 20:46:57 +0200
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: ppcdev <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>> Nobody's talking about the direct match but making the task of 
>>> selecting a proper driver more complex by specifying the details 
>>> that don't help (if not hinder) the correct selection is certainly 
>>> not a way to go.
>
>> Nonsense.  If the kernel doesn't care about certain details,
>> it can just ignore them.
>
>    That's OK, as long as it has the details it needs. Your suggestions 
> on the "compatible" devoided it of such.

Sigh.

[snip]

>>>    That's the way the cookie crumbles in Linux MTD for now. It's 
>>> *always* detecting this by probing -- you only can say what [not] to 
>>> probe.
>
>> So go fix that :-)
>
>    Wanna pay me for that? ;-)

You're the one complaining, you go pay yourself.

[snip, plunk]


Segher
