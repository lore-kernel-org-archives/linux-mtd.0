Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjmB8-0003WC-O3
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 12:19:24 +0000
Date: Fri, 3 Mar 2017 13:19:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Moritz Fischer
 <moritz.fischer@ettus.com>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Message-ID: <20170303131901.391b0700@bbrezillon>
In-Reply-To: <6d5ef869-a1d5-c8d2-847d-1c7aaafa74cf@linaro.org>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
 <6d5ef869-a1d5-c8d2-847d-1c7aaafa74cf@linaro.org>
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

On Fri, 3 Mar 2017 11:27:34 +0000
Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:

> On 02/03/17 19:50, Alban wrote:
> > Add the binding to expose MTD partitions as nvmem providers.  
> 
> It would be nice to see more description of this patch, explaining the 
> real use case.
> >
> > Signed-off-by: Alban <albeu@free.fr>
> > ---
> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > new file mode 100644
> > index 0000000..47602f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > @@ -0,0 +1,29 @@
> > += NVMEM in MTD =
> > +
> > +Config data for drivers is often stored in MTD devices. This binding
> > +define how such data can be represented in device tree.
> > +
> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`  
> We should prefix this property with "mtd" to make it more explicit that 
> this is specific to mtd devices.

MTD is a linux-ism, not sure DT maintainers will like it ;-).

> 
> May be we should put this under "Required Properties" section, marking 
> it as mandatory for mtd nvmem providers.

It's definitely optional. It's really a choice to provide a nvmem cells
under an MTD partition.

> 
> > +property to their node. Data cells can then be defined as child nodes
> > +of the partition as defined in nvmem.txt.
> > +
> > +Example:
> > +
> > +	flash@0 {
> > +		...
> > +
> > +		partition@2 {
> > +			label = "art";
> > +			reg = <0x7F0000 0x010000>;
> > +			read-only;
> > +
> > +			nvmem-provider;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			eeprom@1000 {
> > +				label = "wmac-eeprom";
> > +				reg = <0x1000 0x1000>;
> > +			};
> > +		};
> > +	};
> >  
