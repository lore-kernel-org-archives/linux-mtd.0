Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bxov1-0002K0-DZ
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 11:33:39 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1Bxouy-0003qi-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 17:33:32 +0200
Received: from a2125958202.net-htp.de ([212.59.58.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 17:33:32 +0200
Received: from sst by a2125958202.net-htp.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 17:33:32 +0200
To: linux-mtd@lists.infradead.org
From: =?ISO-8859-15?Q?Stefan_St=FCrke?= <sst@pandatel.com>
Date: Thu, 19 Aug 2004 17:33:28 +0200
Message-ID: <4124C848.7000808@pandatel.com>
References: <cg23u5$gd0$1@sea.gmane.org>
	<1092919733.23187.34.camel@linpc003.aimsys.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
In-Reply-To: <1092919733.23187.34.camel@linpc003.aimsys.nl>
Sender: news <news@sea.gmane.org>
Subject: Re: MTD and 28F128J3A
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jaap-Jan Boor wrote:
> Stefan,
> 
> what I did is force a checkstop the will result in a processor
> reset before executing 'm8260_gorom()' (this should also reset
> your flash devices) by adding the following code to
> m8260_machine_restart():
> 

[snip]

Thank you, nice idea. I just tested it but unfortunatly at
my hardware the reset pin of the flash is only triggered
by power on reset and not by processor reset. So the
checkstop just kills the processor but it still can not
read valid code from flash :-(

Of course as 'dirty' solution I could write a 0xFF to
the flash device before executing 'm8260_gorom()'.
In this way the problem should be solved.

But I am afraid that the code in cfi_cmset_0001 has a bug
leaving the chip in query mode after writing to it. And that
this bug has side effects which I can't see know but which will
be seen by our customers.
Has anybody ever heard of such behavior of cfi_cmset_0001?

Thanks again
Stefan

-- 
Stefan Stürke
