Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqtaR-0005wv-Oy
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:02:08 +0000
Received: by pacfv9 with SMTP id fv9so214684486pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:01:47 -0700 (PDT)
Date: Mon, 26 Oct 2015 19:01:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding
 specification
Message-ID: <20151027020144.GP13239@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151011200402.GE3696@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 11, 2015 at 01:04:02PM -0700, Brian Norris wrote:
> Hi DT maintainers,

Last call: I'd like a reviewer that
(1) does DT reviews somewhat regularly and
(2) is not me.

If I can't get one soon, I'll take this for 4.4.

Thanks,
Brian

> It's a bit hypocritical of me, since I've been a slow reviewer as well,
> but... can we get some review on this one? Usually, I'm comfortable
> taking driver DT bindings without your review, but this one is a bit
> more generic and is more far-reaching than the average driver.
> 
> I'm not a big fan of this change, and I don't quite understand why the
> bus driver (the SPI bus, which is a level up from the SPI device / MTD
> node) can specify its grandchildren (see spi-samsung.txt). But given the
> constraints, I think Michal's solution is OK. And I do agree that MTD's
> ofpart should be bit more specific.
> 
> Anyway, a quick look and an Ack/Nak would be appreciated.
> 
> Thanks,
> Brian
> 
> On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
> > To avoid conflict with other drivers using subnodes of the mtd device
> > create only one ofpart-specific node rather than any number of
> > arbitrary partition subnodes.
> > 
> > Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> > ---
> > v3:
> > 
> >  - rename DT node ofpart -> partitions
> > ---
> >  .../devicetree/bindings/mtd/partition.txt          | 68 +++++++++++++---------
> >  1 file changed, 40 insertions(+), 28 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> > index 8e5557d..8c2aff7 100644
> > --- a/Documentation/devicetree/bindings/mtd/partition.txt
> > +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> > @@ -4,10 +4,16 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
> >  on platforms which have strong conventions about which portions of a flash are
> >  used for what purposes, but which don't use an on-flash partition table such
> >  as RedBoot.
> > +
> > +The partition table should be partitions subnode of the mtd node. Partitions are
> > +defined in subnodes of the partitions node.
> > +
> > +For backwards compatibility partitions as direct subnodes of the mtd device are
> > +supported. This use is discouraged.
> >  NOTE: if the sub-node has a compatible string, then it is not a partition.
> >  
> > -#address-cells & #size-cells must both be present in the mtd device. There are
> > -two valid values for both:
> > +#address-cells & #size-cells must both be present in the partitions subnode of the
> > +mtd device. There are two valid values for both:
> >  <1>: for partitions that require a single 32-bit cell to represent their
> >       size/address (aka the value is below 4 GiB)
> >  <2>: for partitions that require two 32-bit cells to represent their
> > @@ -28,44 +34,50 @@ Examples:
> >  
> >  
> >  flash@0 {
> > -	#address-cells = <1>;
> > -	#size-cells = <1>;
> > +	partitions {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> >  
> > -	partition@0 {
> > -		label = "u-boot";
> > -		reg = <0x0000000 0x100000>;
> > -		read-only;
> > -	};
> > +		partition@0 {
> > +			label = "u-boot";
> > +			reg = <0x0000000 0x100000>;
> > +			read-only;
> > +		};
> >  
> > -	uimage@100000 {
> > -		reg = <0x0100000 0x200000>;
> > +		uimage@100000 {
> > +			reg = <0x0100000 0x200000>;
> > +		};
> >  	};
> >  };
> >  
> >  flash@1 {
> > -	#address-cells = <1>;
> > -	#size-cells = <2>;
> > +	partitions {
> > +		#address-cells = <1>;
> > +		#size-cells = <2>;
> >  
> > -	/* a 4 GiB partition */
> > -	partition@0 {
> > -		label = "filesystem";
> > -		reg = <0x00000000 0x1 0x00000000>;
> > +		/* a 4 GiB partition */
> > +		partition@0 {
> > +			label = "filesystem";
> > +			reg = <0x00000000 0x1 0x00000000>;
> > +		};
> >  	};
> >  };
> >  
> >  flash@2 {
> > -	#address-cells = <2>;
> > -	#size-cells = <2>;
> > +	partitions {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> >  
> > -	/* an 8 GiB partition */
> > -	partition@0 {
> > -		label = "filesystem #1";
> > -		reg = <0x0 0x00000000 0x2 0x00000000>;
> > -	};
> > +		/* an 8 GiB partition */
> > +		partition@0 {
> > +			label = "filesystem #1";
> > +			reg = <0x0 0x00000000 0x2 0x00000000>;
> > +		};
> >  
> > -	/* a 4 GiB partition */
> > -	partition@200000000 {
> > -		label = "filesystem #2";
> > -		reg = <0x2 0x00000000 0x1 0x00000000>;
> > +		/* a 4 GiB partition */
> > +		partition@200000000 {
> > +			label = "filesystem #2";
> > +			reg = <0x2 0x00000000 0x1 0x00000000>;
> > +		};
> >  	};
> >  };
> > -- 
> > 2.1.4
> > 
