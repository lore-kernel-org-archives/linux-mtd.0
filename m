Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9LbN-0001VR-9e
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 22:30:50 +0000
Received: by mail-we0-f172.google.com with SMTP id k11so4965209wes.3
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 14:30:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54AD31F8.4050100@vanguardiasur.com.ar>
References: <1420564094-1086-1-git-send-email-grmoore@opensource.altera.com>
 <1420564094-1086-2-git-send-email-grmoore@opensource.altera.com>
 <54AD31F8.4050100@vanguardiasur.com.ar>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 8 Jan 2015 16:30:06 -0600
Message-ID: <CAL_Jsq+nbZMnJZ=Wm--DODWRXm5aqEJ_7BVDuET9oSXJaJtWug@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kumar Gala <galak@codeaurora.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2015 at 7:17 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> (CCing DT mailing list and DT binding maintainers)
>
> On 01/06/2015 02:08 PM, Graham Moore wrote:
>> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
>> ---
>>  .../devicetree/bindings/mtd/cadence_quadspi.txt    |   50 ++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>> new file mode 100644
>> index 0000000..3a8ea1c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
>> @@ -0,0 +1,50 @@
>> +* Cadence Quad SPI controller
>> +
>> +Required properties:
>> +- compatible : Should be "cdns,qspi-nor".

This controller only works with flash devices and is different than this one:?

Documentation/devicetree/bindings/spi/spi-cadence.txt

>> +- reg : Contains two entries, each of which is a tuple consisting of a
>> +     physical address and length.  The first entry is the address and
>> +     length of the controller register set.  The second entry is the
>> +     address and length of the QSPI Controller data area.
>> +- interrupts : Unit interrupt specifier for the controller interrupt.
>> +- clocks : phandle to the Quad SPI clock.
>> +- ext-decoder : Value of 0 means no external chipselect decoder is
>> +     connected, 1 means there is an external chipselect decoder connected.
>
> As I already said in the driver patch, I think this property should be
> boolean and have a vendor prefix.

The above binding already uses "is-decoded-cs". Let's not invent something new.

>> +- fifo-depth : Size of the data FIFO in words.
>
> This one looks generic enough to leave it as it is, without any vendor
> prefix.

All sorts of properties with fifo in them... Nothing is particularly
dominate, so this is fine.

>> +- bus-num : Number of the SPI bus to which the controller is connected.
>> +
>
> I think you forgot to remove bus-num here.
>
>> +Optional subnodes:
>> +Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
>> +custom properties:
>> +- cdns,page-size : Size, in bytes, of the device's write page
>> +- cdns,block-size : Size of the device's erase block
>> +- cdns,read-delay : Selay for read capture logic, in clock cycles

s/Selay/Delay/

>> +- cdns,tshsl-ns : Delay in master reference clocks for the length that the master mode chip select outputs are de-asserted between transactions.
>> +- cdns,tsd2d-ns : Delay in master reference clocks between one chip select being de-activated and the activation of another.
>> +- cdns,tchsh-ns : Delay in master reference clocks between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
>> +- cdns,tslch-ns : Delay in master reference clocks between setting qspi_n_ss_out low and first bit transfer.

Aren't these properties probeable at all? We really should have
standard bindings for this. It seems spi NOR flash devices have gone
somewhat undocumented, but it is not hard to find examples already in
use.

Is it master reference clocks or nanoseconds for the units?

Rob

>> +
>> +Example:
>> +
>> +     qspi: spi@ff705000 {
>> +             compatible = "cdns,qspi-nor";
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             reg = <0xff705000 0x1000>,
>> +                     <0xffa00000 0x1000>;
>> +             interrupts = <0 151 4>;
>> +             clocks = <&qspi_clk>;
>> +             ext-decoder = <0>;
>> +             fifo-depth = <128>;
>> +
>> +             flash0: n25q00@0 {
>> +                     ...
>> +                     cdns,page-size = <256>;
>> +                     cdns,block-size = <16>;
>> +                     cdns,read-delay = <4>;
>> +                     cdns,tshsl-ns = <50>;
>> +                     cdns,tsd2d-ns = <50>;
>> +                     cdns,tchsh-ns = <4>;
>> +                     cdns,tslch-ns = <4>;
>> +             }
>> +     }
>>
>
> --
> Ezequiel Garcia, VanguardiaSur
> www.vanguardiasur.com.ar
