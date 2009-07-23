Received: from smtpauth01.csee.onr.siteprotect.com ([64.26.60.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MU47c-0006r3-4e
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 19:38:36 +0000
Message-ID: <4A68BC2B.2030800@boundarydevices.com>
Date: Thu, 23 Jul 2009 12:38:19 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH V5 2/2] mtd: nand: Calculate better default ecc layout
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>	<1247789948-5764-2-git-send-email-troy.kisky@boundarydevices.com>	<4A68B683.5030503@boundarydevices.com>
	<200907231226.24436.david-b@pacbell.net>
In-Reply-To: <200907231226.24436.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dedekind@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Thursday 23 July 2009, Troy Kisky wrote:
>> What do you think of leaving nand_base totally alone
>> and add a file nand_probe.h which contain the new
>> routines marked as inline, or mark it __devinit or
>> __init ? I don't think anyone but probe calls these
>> functions.
> 
> You don't want those nand-core functions to be removed.
> Drivers can be modular, and they need to call them.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

You misunderstand. I'm suggesting that each driver
includes nand_probe.h

That way, the routines can be freed when initialization
is complete.
