Date: Mon, 6 Feb 2017 10:05:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alison Wang <alison.wang@nxp.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Alison Wang <b18965@freescale.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: Update dependency of IFC for LS1021A
Message-ID: <20170206100542.65f19dc5@bbrezillon>
In-Reply-To: <DB6PR0401MB2584DBE5D6496F44B7169B49F4600@DB6PR0401MB2584.eurprd04.prod.outlook.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
 <1483411266-45875-2-git-send-email-b18965@freescale.com>
 <4e04eb5e-fb53-f71e-ee49-0872a6c11e97@gmail.com>
 <DB6PR0401MB2584606EC932BF1FAED788E1F4610@DB6PR0401MB2584.eurprd04.prod.outlook.com>
 <ffb2c20d-3aeb-6f5a-1880-3bed0c964821@gmail.com>
 <DB6PR0401MB2584DBE5D6496F44B7169B49F4600@DB6PR0401MB2584.eurprd04.prod.outlook.com>
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

Hi Alison,

On Thu, 5 Jan 2017 02:02:30 +0000
Alison Wang <alison.wang@nxp.com> wrote:

> > On 01/04/2017 02:46 AM, Alison Wang wrote:  
> > >> On 01/03/2017 03:41 AM, Alison Wang wrote:  
> > >>> As NAND support for Freescale/NXP IFC controller is available on
> > >>> LS1021A, the dependency for LS1021A is added.  
> > >>
> > >> Does LS stand for LayerScape ? Yes it does. So why does
> > >> ARCH_LAYERSCAPE not cover LS1021 ?  
> > > [Alison Wang] LS1021A is an earlier product and is not compatible  
> > with later Layerscape architecture. So ARCH_LAYERSCAPE can't cover
> > LS1021A.
> > 
> > Ah ok, I see. That information would be useful in the commit message ;-)
> >   
> [Alison Wang] Ok. :)

Would you mind sending a v3 with the updated commit message?

Thanks,

Boris
