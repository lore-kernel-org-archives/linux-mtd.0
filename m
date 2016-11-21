Date: Mon, 21 Nov 2016 12:01:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@atmel.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: tango: Use nand_to_mtd() instead of directly
 accessing chip->mtd
Message-ID: <20161121120156.51d5f710@bbrezillon>
In-Reply-To: <5832C579.10101@sigmadesigns.com>
References: <1479718984-26491-1-git-send-email-boris.brezillon@free-electrons.com>
 <5832C579.10101@sigmadesigns.com>
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

On Mon, 21 Nov 2016 10:59:21 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 21/11/2016 10:03, Boris Brezillon wrote:
> 
> > The nand_to_mtd() helper is here to hide internal mtd_info <-> nand_chip
> > association and ease future refactors.
> > 
> > Make use of this helper instead of directly accessing chip->mtd.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/tango_nand.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)  
> 
> Acked-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Applied.

Thanks,

Boris

> 
> Regards.
> 
