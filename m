Date: Thu, 10 Dec 2015 09:44:08 -0800
From: Tony Lindgren <tony@atomide.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@arm.linux.org.uk>,
 "hramrach@gmail.com" <hramrach@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] ARM: dts: DRA7: add entry for qspi mmap region
Message-ID: <20151210174407.GF23396@atomide.com>
References: <1448860515-28336-1-git-send-email-vigneshr@ti.com>
 <1448860515-28336-5-git-send-email-vigneshr@ti.com>
 <20151130223408.GJ23396@atomide.com> <565D25E6.4070206@ti.com>
 <20151201163950.GR23396@atomide.com> <566017A8.5040106@ti.com>
 <566907D7.6040003@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566907D7.6040003@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Vignesh R <vigneshr@ti.com> [151209 21:05]:
> 
> 
> On 12/03/2015 03:51 PM, Vignesh R wrote:
> > 
> > 
> > On 12/01/2015 10:09 PM, Tony Lindgren wrote:
> >> * Vignesh R <vigneshr@ti.com> [151130 20:46]:
> >>> On 12/01/2015 04:04 AM, Tony Lindgren wrote:
> >>>>
> ...
> >>
> >> OK. They are both on L3 main so that won't cause any issues for separate
> >> interconnect driver instances. As they are still separate targets flushing
> >> a posted write to one area will not flush anything to the other.
> >>
> > 
> > I didn't quite understand what you meant by interconnect driver instance.
> > qspi_base and qspi_mmap region are tightly bound to each other and both
> > needs to be accessed by ti-qspi driver (though different targets).
> > Besides qspi_mmap region is only used to read data, there will not be
> > any write accesses to this target. Are you saying this binding is not
> > viable?
> > 
> 
> As I stated above qspi_base and qspi_mmap region are tightly bound,
> there is no way to use qspi_mmap region w/o accessing qspi_base. So I am
> planning to keep them as it is. I will move qspi_ctrlmod to use syscon.
> Something like:
> 
> qspi: qspi@4b300000 {
>        compatible = "ti,dra7xxx-qspi";
>        reg = <0x4b300000 0x100>,
>              <0x5c000000 0x4000000>,
>        reg-names = "qspi_base", "qspi_mmap";
>        syscon-chipselects = <&scm_conf 0x558>;
>        #address-cells = <1>;
>        #size-cells = <0>;
>        spi-max-frequency = <48000000>;
>        ti,hwmods = "qspi";
> };
> 
> Do you think this is not viable in future?

That's OK, they are on the same interconnect instance. And with the
syscon you're not directly tinkering with the SCM registers. So
yeah, that should work in the long run too.

The absolute addresses will get changed to just offsets from the
interconnect target. But if you use the Linux standard functions like
platform_get_resource_byname + devm_request_mem_region + devm_ioremap
then no changes are needed to your driver later on.

Thanks,

Tony
