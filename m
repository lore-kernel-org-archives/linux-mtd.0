Received: from mail-oi0-f66.google.com ([209.85.218.66])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGt1y-0006fr-3J
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 19:46:30 +0000
Received: by mail-oi0-f66.google.com with SMTP id v84so16765577oie.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 11:46:09 -0800 (PST)
Date: Tue, 13 Dec 2016 13:46:06 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: add a label property to jedec,spi-nor
Message-ID: <20161213194606.lk2rrbtb444zseyb@rob-hp-laptop>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-5-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1481557252-13656-5-git-send-email-clg@kaod.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 12, 2016 at 04:40:52PM +0100, Cédric Le Goater wrote:
> This can be used to easily identify a chip on a system with multiple
> chips.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
