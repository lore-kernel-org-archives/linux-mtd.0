Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=VA3EHSOBE007.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QlmxM-0002Oh-Nh
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 19:06:17 +0000
Date: Tue, 26 Jul 2011 14:05:54 -0500
From: Scott Wood <scottwood@freescale.com>
To: <MichaelHench@gmail.com>
Subject: Re: [PATCH v2] mtd: eLBC NAND: update ecc_stats.corrected when
	lteccr available
Message-ID: <20110726140554.2096b12d@schlenkerla.am.freescale.net>
In-Reply-To: <CAHyXW604AxBGO=AEAyOcba2VfsjVve+RV7_A8QXaUpJRfAsq3Q@mail.gmail.com>
References: <CAHyXW604AxBGO=AEAyOcba2VfsjVve+RV7_A8QXaUpJRfAsq3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, mlcreech@gmail.com,
	mhench@elutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Jul 2011 13:59:25 -0500
Michael Hench <michaelhench@gmail.com> wrote:

> update ecc_stats.corrected if LTECCR register is available.
> 
> v2: kernel standard C formatting

Missed a couple:

> +		if(lteccr & 0x000F000F)
> +			out_be32(&lbc->lteccr, 0x000F000F); /* clear lteccr */
> +		if(lteccr & 0x000F0000)
> +			mtd->ecc_stats.corrected++;

-Scott
