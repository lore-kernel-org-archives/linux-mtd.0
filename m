Received: from n16a.bullet.mail.mud.yahoo.com ([68.142.207.126])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lq8bL-0005bo-HV
	for linux-mtd@lists.infradead.org; Sat, 04 Apr 2009 16:20:17 +0000
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Date: Sat, 4 Apr 2009 09:20:06 -0700
References: <200903260042.42091.david-b@pacbell.net>
	<a95a62fe0904031300i82bdf42h5bc854a002e0091e@mail.gmail.com>
	<1238855797.4068.6.camel@macbook.infradead.org>
In-Reply-To: <1238855797.4068.6.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904040920.06981.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 04 April 2009, David Woodhouse wrote:
> think I'm going to add a WARN_ON(&mtd->dev.parent) into the core code.

I hope you mean WARN_ON(!mtd->dev.parent) ... :)
