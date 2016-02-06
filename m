Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSASJ-00076u-Uc
 for linux-mtd@lists.infradead.org; Sat, 06 Feb 2016 21:31:49 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: add support for partial chunks
References: <1453901520-4621-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160205230754.GB4329@laptop.cereza>
Date: Sat, 06 Feb 2016 22:31:17 +0100
In-Reply-To: <20160205230754.GB4329@laptop.cereza> (Ezequiel Garcia's message
 of "Fri, 5 Feb 2016 20:07:54 -0300")
Message-ID: <87bn7t4jbu.fsf@belgarion.home>
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

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Hi Thomas,
>
> Thanks for working on this. Looks mostly good, just a couple minor
> comments below.
>
> Robert: Do you think you can take a look and test on PXA?
I didn't review the patch, I'm a bit short of time.

But I did the test, and you can add:
Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
