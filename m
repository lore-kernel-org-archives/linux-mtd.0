Received: from smtp106.sbc.mail.gq1.yahoo.com ([67.195.14.109])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJU9p-0002R1-1z
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 15:13:11 +0000
From: David Brownell <david-b@pacbell.net>
To: "Steven A. Falco" <sfalco@harris.com>
Subject: Re: [Question] m25p80 driver versus spi clock rate
Date: Wed, 24 Jun 2009 08:13:00 -0700
References: <4A3FEE98.60700@harris.com>
	<200906231538.40125.david-b@pacbell.net>
	<4A423750.8080605@harris.com>
In-Reply-To: <4A423750.8080605@harris.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200906240813.01220.david-b@pacbell.net>
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 24 June 2009, Steven A. Falco wrote:
> Your changes to bitbang_work look good.

You tested?


> I'm not clear on why you first set do_setup = -1 but later 
> use do_setup = 1.  Perhaps they should both be "1".  Other than that,
> 
> Acked-by: Steven A. Falco <sfalco@harris.com>

The "-1" is for the init path, "1" for per-transfer overrides;
this way it avoids some extra calls to set up the bits/speed.
