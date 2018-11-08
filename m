Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKk3D-0001Mo-Ui
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 13:08:48 +0000
Date: Thu, 8 Nov 2018 14:08:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/7] mtd: spi-nor: add restriction for nmaps in smpt parser
Message-ID: <20181108140826.428b77ed@bbrezillon>
In-Reply-To: <20181108135447.36a0314c@bbrezillon>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
 <20181108110653.21063-4-tudor.ambarus@microchip.com>
 <20181108135447.36a0314c@bbrezillon>
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

On Thu, 8 Nov 2018 13:54:47 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> > -	while (i < smpt_len) {
> > +	for (nmaps = 0; i < smpt_len; nmaps++) {
> > +		/*
> > +		 * The map selector is limited to a maximum of 8 bits, allowing
> > +		 * for a maximum of 256 possible map configurations. The total
> > +		 * number of map configurations should be addressable by the
> > +		 * total number of bits described by the detection commands.
> > +		 */
> > +		if (ncmds && nmaps >= (1 << (ncmds + 1)))
> > +			break;
> > +  
> 
> Maybe I missed something but it sounds like this change is just
> optimizing the SPMT parsing a bit, and to be honest, I'm not sure this
> is really needed. Most of the time, smpt_len will be rather small, so
> trying to bail out earlier is not bringing much perf improvements.

To make it clearer, I don't think the extra complexity is worth the tiny
perf improvement.
