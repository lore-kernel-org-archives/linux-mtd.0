Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QlnxW-0003NO-QR
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 20:10:31 +0000
Date: Tue, 26 Jul 2011 15:10:24 -0500
From: Scott Wood <scottwood@freescale.com>
To: <MichaelHench@gmail.com>
Subject: Re: [PATCH v3] mtd: eLBC NAND: update ecc_stats.corrected when
	lteccr available
Message-ID: <20110726151024.706ccda0@schlenkerla.am.freescale.net>
In-Reply-To: <CAHyXW61rWcoE0Wcd9K7BsP3+VKzmQo=RPMM9+1DTw+QdF9MVew@mail.gmail.com>
References: <CAHyXW61rWcoE0Wcd9K7BsP3+VKzmQo=RPMM9+1DTw+QdF9MVew@mail.gmail.com>
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

On Tue, 26 Jul 2011 15:07:42 -0500
Michael Hench <michaelhench@gmail.com> wrote:

> update ecc_stats.corrected if LTECCR register is available.
> 
> v2: kernel standard C formatting
> 
> v3: kernel standard C formatting again, changed a comment to get under 80 chars
> 
> Signed-off-by: Michael Hench <MichaelHench@gmail.com>

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
