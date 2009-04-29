Received: from smtp128.sbc.mail.sp1.yahoo.com ([69.147.65.187])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzE0g-0005vY-DN
	for linux-mtd@lists.infradead.org; Wed, 29 Apr 2009 17:55:57 +0000
From: David Brownell <david-b@pacbell.net>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers
Date: Wed, 29 Apr 2009 10:55:51 -0700
References: <7948530904290459q36d9c3fcq2db0dedcf88549d2@mail.gmail.com>
	<49F852EB.1080701@nokia.com>
In-Reply-To: <49F852EB.1080701@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904291055.51333.david-b@pacbell.net>
Cc: Mika Korhonen <mika.j.korhonen@gmail.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 April 2009, Adrian Hunter wrote:
> +       .shutdown       = __devexit_p(omap2_onenand_shutdown),

That looks wrong.  Shutdown functions shouldn't get discarded
like exit functions.  I'd think the fix for that would be taking
away any __devexit annotation on the shutdown function.
