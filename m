Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L8fCY-0003GQ-N2
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 18:14:55 +0000
From: David Brownell <david-b@pacbell.net>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] OneNAND: OMAP2: Switch to generic gpio calls
Date: Fri, 5 Dec 2008 10:14:49 -0800
References: <1228289844-5897-1-git-send-email-jarkko.nikula@nokia.com>
	<1228289844-5897-3-git-send-email-jarkko.nikula@nokia.com>
	<49391D78.90407@nokia.com>
In-Reply-To: <49391D78.90407@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200812051014.50439.david-b@pacbell.net>
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jarkko Nikula <jarkko.nikula@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 05 December 2008, Adrian Hunter wrote:
> -               if ((r = omap_request_gpio(c->gpio_irq)) < 0) {
> +               if ((r = gpio_request(c->gpio_irq, "OneNAND irq")) < 0) {

Worth noting that this depends on the OMAP patches which 
make those calls be equivalent.  Those patches are going
into 2.6.29-early via the ARM tree, as I recall; getting
the merge order wrong would break bisectability -- but
not buildability.

- Dave
