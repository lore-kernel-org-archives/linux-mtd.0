Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhIOD-0002gx-1G
 for linux-mtd@lists.infradead.org; Mon, 14 Aug 2017 16:38:54 +0000
Date: Mon, 14 Aug 2017 09:38:30 -0700 (PDT)
From: matthew.gerlach@linux.intel.com
To: Rob Herring <robh@kernel.org>
cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
In-Reply-To: <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
Message-ID: <alpine.DEB.2.20.1708140931290.11426@mgerlach-VirtualBox>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
 <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Rob,

Thanks for the feedback.  Please see my comments in line.

Matthew Gerlach

On Thu, 10 Aug 2017, Rob Herring wrote:

> On Sun, Aug 06, 2017 at 11:24:02AM -0700, matthew.gerlach@linux.intel.com wrote:
>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>
>> Device Tree bindinds for Altera ASMI Parallel II IP Core.
>
> s/bindinds/bindings/
>
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>> ---
>>  .../devicetree/bindings/mtd/altera-asmip2.txt      | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>> new file mode 100644
>> index 0000000..3380366
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>> @@ -0,0 +1,22 @@
>> +* Altera ASMI Parallel II IP Core
>> +
>> +Required properties:
>> +- compatible : Should be "altr,asmi_parallel2".
>
> s/_/-/
>
>> +- reg : A tuple consisting of a physical address and length.
>> +
>> +Optional subnodes:
>> +Subnodes of the Altera ASMI Paralllel II IP Core are spi slave nodes.
>
> But this is not a general purpose SPI controller?


The component is a general pupose SPI controller, but this driver
expects a spi-nor device to be connected to it.  As such I wonder if the
compatible string should be "altr,asmi-parallel2-spi-nor".


>
>> +- reg : chip select value
>> +- label : optional user friendly label
>> +
>> +Example:
>> +
>> +qspi: spi@a0001000 {
>> +	compatible = "altr,asmi_parallel2";
>> +	reg = <0xa0001000 0x10>;
>> +
>> +	flash@0 {
>
> This should have a compatible.
>
>> +		reg = <0>;
>> +		label = "FPGA Image";
>> +	};

Since I have no way to test multiple flash chips, it might
be simpler to not specify any subnodes.

>> +};
>> --
>> 2.7.4
>>
>
