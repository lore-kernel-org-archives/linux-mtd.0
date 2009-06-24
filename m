Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJTXn-0004ss-AJ
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 14:33:54 +0000
From: Stefan Roese <sr@denx.de>
To: "Steven A. Falco" <sfalco@harris.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
Date: Wed, 24 Jun 2009 16:33:35 +0200
References: <4A3FEE98.60700@harris.com>
	<200906231538.40125.david-b@pacbell.net>
	<4A423750.8080605@harris.com>
In-Reply-To: <4A423750.8080605@harris.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200906241633.35571.sr@denx.de>
Cc: David Brownell <david-b@pacbell.net>,
	"linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 24 June 2009 16:25:20 Steven A. Falco wrote:
> > Speaking of spi_ppc4xx issues ... I still have an oldish
> > copy in my review queue, it needs something like the
> > appended patch.  (Plus something to accept bpw == 0.)
> > Is there a newer version?
>
> That is a question for Stefan.  Perhaps when I post my patch
> to the PPC list, we can move this further along...

I have to admit that I didn't find the time to rework the driver after David's 
latest review. Frankly, this could take some time since I'm currently busy 
with other tasks. So it would be great if someone else (Steven?) might pick up 
here and resubmit this driver so that we can get it finally included.

Thanks.

Best regards,
Stefan
