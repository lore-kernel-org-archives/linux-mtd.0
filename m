Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLzmA-0004F8-Gk
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 04:37:18 -0500
Message-ID: <44211AB7.9000707@intel.com>
Date: Wed, 22 Mar 2006 12:36:55 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	<44200736.5010102@ru.mvista.com>
	<44201084.3000708@intel.com> <442017B0.4010508@ru.mvista.com>
In-Reply-To: <442017B0.4010508@ru.mvista.com>
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

Vitaly,

>
> What PREEMPT_ modes did you test it with?

Why do you think enabling preemptible kernel option will help to switch 
two or more kernel threads with equal priority? And anyway preemptible 
kernel option is an experimental one and someone willing to use striping 
may not want to use it.

>
> The implementation itself seems to be quite inmature and leaves a lot 
> of questions - starting from what command-line parameters do mean and 
> ending up with how it's supposed to work in a workload environment, 
> given the threads etc. etc. Maybe it slows down the performance of the 
> whole system, even though it does speed up the block erase.
It is RFC and everything can be explained or changed.

Considering command line parameters. Suggested solution can be 
configured by two ways. First applies if mtdstripe.ko is a standalone 
module and user uses insmod to insert it - good for debug, etc. Second 
is for solid kernel where striping is configured from kernel 
configuration string. Please find some clarifications in reply to 
Artem's message.

In our experience striping does not affect much overall system performance.

And not only erase speed increases due to striping, but write speed too.

Thanks,
Alexander Belyakov
