Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLjBG-0004GN-Rd
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:54:03 -0500
Message-ID: <442017B0.4010508@ru.mvista.com>
Date: Tue, 21 Mar 2006 18:11:44 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	<44200736.5010102@ru.mvista.com>
	<44201084.3000708@intel.com>
In-Reply-To: <44201084.3000708@intel.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Belyakov wrote:

> Vitaly,
>
> 1. No. Striping itself does not kill XIP. But it's true that using XIP 
> with striped volume will not give any performance increase.

I'm quite unsure that XIP will be working on any other platform that 
yours if your changes are applied, sorry.

> 2. Please note, that mtdstripe.c is a just another middle layer module 
> as mtdconcat.c or mtdpart.c, for example. It can be used on top of ANY 
> command set.

So why didn't you provide a comprehensive patch for all the command sets?

>
> As it was described in original message, we have to provide correct 
> thread switching process - it is NOT striping problem but more generic 
> one. We have fixed it in cfi_cmdset_0001.c. And it can be fixed (CPT) 
> or workarounded (Priority switching and udelay modification) for other 
> command sets. CPT (Common polling thread) has also been made as 
> turnable module so anyone in any command set implementation could use it.

What PREEMPT_ modes did you test it with?

>
> Another important thing to be mentioned. The patch below was validated 
> on 4 different Intel flash chips (including Sibley) on arm-based 
> platform. It works and gives up to 85% performance increase on two 
> independent chips in system.

...on Intel ARM-like platform, I need to add. No other ARM platforms, I 
guess :P

We had a somewhat heated discussion on your changes in IRC :)
My POV is -- the idea itself definitely has some added value but I'm not 
sure if incorporating it into the main MTD code is a good idea.
I still think that having a lot of NOR flash erase cases means either HW 
or SW design mistake. And striping might be not a really necessary thing 
if the number of erase cases is small.

The implementation itself seems to be quite inmature and leaves a lot of 
questions - starting from what command-line parameters do mean and 
ending up with how it's supposed to work in a workload environment, 
given the threads etc. etc. Maybe it slows down the performance of the 
whole system, even though it does speed up the block erase.

Vitaly
