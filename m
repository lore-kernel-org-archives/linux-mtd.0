Received: from botnar.kaiser.cx ([176.28.20.183])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV0vs-0004EA-SK
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 20:39:26 +0000
Date: Mon, 18 Jun 2018 22:36:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: mxc: set spare area size register
 explicitly
Message-ID: <20180618203656.GA1926@botnar.kaiser.cx>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
 <1528637487-25172-1-git-send-email-martin@kaiser.cx>
 <20180618160929.421bee73@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618160929.421bee73@bbrezillon>
Sender: Martin Kaiser <martin@botnar.kaiser.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Thus wrote Boris Brezillon (boris.brezillon@bootlin.com):

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: stable@vger.kernel.org

> Hm, a Cc-stable tag without its associated Fixes tag, I don't like that.
> Can you find which commit introduced this bug?

the particular corner case that I fixed has never really worked. As my
fix updates the preset operation, I'd suggest adding a Fixes tag pointing
at the first commit that introduced the preset operation.

I'll resend my patch with this tag added.

Best regards,

   Martin
