Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcaH3-000466-BC
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 08:07:45 +0000
Date: Wed, 3 Feb 2010 09:07:25 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: akpm@linux-foundation.org
Subject: Re: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
Message-ID: <20100203080725.GA11354@pengutronix.de>
References: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, peterhuewe@gmx.de, dwmw2@infradead.org,
	hsweeten@visionengravers.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Andrew,

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Fix a build failure introduced by the patch
> 
>     mtd: orion_nand.c: add error handling and use resource_size()
> 
> The patch assigns something to a undeclared variable 'err', whereas the
> rest of the code uses 'ret' for this task.
why did you add a ? to the subject?  IMHO it should go in 2.6.33 as it's
an obvious build fix.

Uwe

-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |
