MIME-Version: 1.0
In-Reply-To: <201506040058.52882.marex@denx.de>
References: <cover.1433364398.git.hramrach@gmail.com>
 <36e315552c849a4d22ac0fcff7958f6ffcafb160.1433364398.git.hramrach@gmail.com>
 <201506040058.52882.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 4 Jun 2015 06:54:00 +0200
Message-ID: <CAOMqctTB2AYOQZUc9o-R4PF1DQ-HY0RfSw5T-T28r5uP2s=qZA@mail.gmail.com>
Subject: Re: [PATCH 04/11] mtd: ofpart: do not fail probe when no partitions
 exist
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 June 2015 at 00:58, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, June 03, 2015 at 11:26:40 PM, Michal Suchanek wrote:
>> On Exynos it is necessary to set SPI controller parameters that apply to
>> a SPI slave in a DT subnode of the slave device. The ofpart code returns
>> an error when there are subnodes of the SPI flash but no partitions are
>> found. Change this condition to a warning so that flash without
>> partitions can be accessed on Exynos.
>
> I have to admit the rationale for this patch is not very clear to me, sorry.
> Can you please explain this a bit more ?

This is how the DT entry for SPI slave looks with s3c64xx:
flash: m25p80@0 {
        #address-cells = <1>;
        #size-cells = <1>;
        compatible = "jedec,spi-nor";
        reg = <0>;
        spi-max-frequency = <40000000>;
        linux,max_tx_len = <65536>;
        m25p,fast-read;
        controller-data {
            samsung,spi-feedback-delay = <0>;
        };
    };

this is example of flash partitions:
flash@0 {
        #address-cells = <1>;
        #size-cells = <1>;

        partition@0 {
                label = "u-boot";
                reg = <0x0000000 0x100000>;
                read-only;
        };

        uimage@100000 {
                reg = <0x0100000 0x200000>;
        };
};

The parser ignores any flash without subnodes and returns 0 (no
partititon). When there is a subnode it assumes the flash is
partitioned and tries to parse the subnodes as partitions. When there
are subnodes and none parses as partition an error is returned. As
shown above it is valid to have subnodes on unpartitioned flash.

When an error is returned from a partition parser the mtdpart code
passes on this error to the flash probe function and the proble of the
flash fails.

Thanks

Michal
