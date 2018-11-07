Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKPD7-0004Iu-64
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 14:53:38 +0000
Date: Wed, 7 Nov 2018 15:53:15 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, miquel.raynal@bootlin.com, broonie@kernel.org,
 david.wolfe@nxp.com, fabio.estevam@nxp.com, prabhakar.kushwaha@nxp.com,
 yogeshnarayan.gaur@nxp.com, han.xu@nxp.com, shawnguo@kernel.org
Subject: Re: [PATCH v4 00/10] Port the FSL QSPI driver to the SPI framework
Message-ID: <20181107155315.056a0d47@bbrezillon>
In-Reply-To: <1541601809-16950-1-git-send-email-frieder.schrempf@kontron.de>
References: <1541601809-16950-1-git-send-email-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed,  7 Nov 2018 15:43:17 +0100
Frieder Schrempf <frieder.schrempf@kontron.de> wrote:

> Changes in v4:
> ==============
> * Rebase on top of v4.20-rc1
> * Drop patches that were merged separately
> * Address change of company name and email address

Looks like your SoB and Author fields are still using the old address.
