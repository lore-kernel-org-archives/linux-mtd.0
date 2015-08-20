Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSMke-0004nL-Nf
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 10:07:17 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, vndao@altera.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ngachi86@gmail.com
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 12:06:36 +0200
Message-ID: <3030745.IsU6n2jnJj@ws-stein>
In-Reply-To: <201508201003.38179.marex@denx.de>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <201508201003.38179.marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marek,

On Thursday 20 August 2015 10:03:38, Marek Vasut wrote:
> > +Example:
> > +
> > +			quadspi_controller_0: quadspi@0x180014a0 {
> > +				compatible = "altr,quadspi-1.0";
> > +				reg = <0x180014a0 0x00000020>,
> > +				      <0x14000000 0x04000000>;
> > +				reg-names = "avl_csr", "avl_mem";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				flash0: epcq256@0 {
> > +					compatible = "altr,epcq256";
> > +					#address-cells = <1>;
> > +					#size-cells = <1>;
> > +					partition@0 {
> > +						/* 16 MB for raw data. */
> > +						label = "EPCQ Flash 0 raw data";
> > +						reg = <0x0 0x1000000>;
> > +					};
> > +					partition@1000000 {
> > +						/* 16 MB for jffs2 data. */
> > +						label = "EPCQ Flash 0 JFFS 2";
> > +						reg = <0x1000000 0x1000000>;
> > +					};
> 
> IIRC, encoding partitions into OF is deprecated (and it shouldn't be
> part of the example anyway, so please remove this bit).

Do you mean specifying partitions in OF is deprecated in general? Is there any link for that?
What would be an alternative to it?

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
