Received: from cassarossa.samfundet.no ([2001:67c:29f4::29])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arPoJ-0005YT-8o
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 12:58:52 +0000
Date: Sat, 16 Apr 2016 14:58:16 +0200
From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alan Stern <stern@rowland.harvard.edu>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/12] avr32: set Atmel NAND ECC algorithm explicitly
Message-ID: <20160416125816.GA21014@samfundet.no>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-4-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1460750052-16285-4-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Around Fri 15 Apr 2016 21:54:03 +0200 or thereabout, Rafał Miłecki wrote:
> This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
> enum nand_ecc_algo).
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

> ---
>  arch/avr32/boards/atngw100/setup.c      | 1 +
>  arch/avr32/boards/atstk1000/atstk1002.c | 1 +
>  include/linux/platform_data/atmel.h     | 1 +
>  3 files changed, 3 insertions(+)

<snipp diff>

-- 
Best regards, HcE.
