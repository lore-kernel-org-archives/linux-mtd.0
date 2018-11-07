Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKPTx-0006p9-R6
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 15:11:03 +0000
Date: Wed, 7 Nov 2018 16:10:39 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.De>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "david.wolfe@nxp.com"
 <david.wolfe@nxp.com>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "yogeshnarayan.gaur@nxp.com" <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [PATCH v4 00/10] Port the FSL QSPI driver to the SPI framework
Message-ID: <20181107161039.4b509a80@bbrezillon>
In-Reply-To: <c9b12dba-3922-9deb-e600-8a3aa1b3dfb5@kontron.de>
References: <1541601809-16950-1-git-send-email-frieder.schrempf@kontron.de>
 <20181107155315.056a0d47@bbrezillon>
 <c9b12dba-3922-9deb-e600-8a3aa1b3dfb5@kontron.de>
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

On Wed, 7 Nov 2018 15:07:37 +0000
Schrempf Frieder <frieder.schrempf@kontron.De> wrote:

> On 07.11.18 15:53, Boris Brezillon wrote:
> > On Wed,  7 Nov 2018 15:43:17 +0100
> > Frieder Schrempf <frieder.schrempf@kontron.de> wrote:
> >   
> >> Changes in v4:
> >> ==============
> >> * Rebase on top of v4.20-rc1
> >> * Drop patches that were merged separately
> >> * Address change of company name and email address  
> > 
> > Looks like your SoB and Author fields are still using the old address.  
> 
> I changed my git user email and git send-email added a "From:" field to 
> each patch because the old SoB doesn't match the new git user config.
> 
> I can change the SoB fields in the next version.

Yep, you'd better update both the SoB and author (they have to match):

git commit --amend --author="Schrempf Frieder <frieder.schrempf@kontron.de>" -s

(and don't forget to remove the old SoB)
