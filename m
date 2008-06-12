Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6hsl-00082j-Er
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 08:10:07 +0000
Message-ID: <4850D9DA.7000207@grandegger.com>
Date: Thu, 12 Jun 2008 10:10:02 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] booting-without-of: add more bindings for FSL UPM driver
References: <484CECE2.9050605@grandegger.com>
	<519f1a6d9baeca8cfea9e8ad7a92c4d4@kernel.crashing.org>
	<484D49FF.4090604@grandegger.com>
	<a9f4227722f169bc9c2e712df774b748@kernel.crashing.org>
In-Reply-To: <a9f4227722f169bc9c2e712df774b748@kernel.crashing.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Segher Boessenkool wrote:
>>>> +      - chip-delay : may specify a delay value in milliseconds.
>>>
>>> Delay for what?  The binding should say.  "chip-delay" is a bit
>>> too generic name as well, it could be more descriptive perhaps.
>>
>> The chip-delay property defines an appropriate maximum delay
>> time (tR) required for read operations if the R/B pin is not
>> connected.
> 
> Yeah.  So please put that in the binding.
> 
>>> Shouldn't this be a property of the NAND device anyway, not the
>>> NAND controller?
>>
>> Strictly speaking, it's a property of the NAND device. Therefore it
>> should be inside the node nand@0, I thhink:
>>
>> +            nand@0 {
>> +                #address-cells = <1>;
>> +                #size-cells = <1>;
>> +                    chip-delay = <25>; // in micro-seconds
> 
> Something like that, yes.  You wrote milliseconds before; which is it?

Oops, it's in micro-seconds.

> And, a better property name, please.

Here is what we speak about (from the NAND chip manual):

  "After a READ command is sent to the memory device, data is
   transferred from the memory array to the data register in tR.
   Typically tR is 25us. The READ STATUS (70h) command or the R/B#
   signal can be used to determine when the device is ready."

And in the NAND header file "chip-delay" is documented as shown below:

  "chip_delay: [BOARDSPECIFIC] chip dependent delay for transfering data 
               from array to read regs (tR)"

The name "read-fetch-time" sounds more reasonable too me, but English
is not my native language.

>> Where should that be documented?
> 
> In the binding for nand devices.  If there isn't any yet, it might be
> best to include that with the binding for your nand controller (i.e.,
> describe the whole sub node there).

OK, here is a my proposal:

    x) Freescale Localbus UPM programmed to work with NAND flash

      Required properties:
      - compatible : "fsl,upm-nand".
      - reg : should specify localbus chip select and size used for the chip.
      - fsl,upm-addr-offset : UPM pattern offset for the address latch.
      - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
      - gpios : may specify optional GPIO connected to the Ready-Not-Busy pin.

      Each NAND flash device is represented as a sub-node of the UPM node.
      The nodes's name represents the name of the corresponding device.

      NAND flash properties:
      - compatible: not yet used.
      - read-fetch-delay: chip dependent delay for transfering data 
        from array to read regs (tR) im micro-seconds.
 
      Each partition is represented as a sub-node of the NAND flash device.
      Each node's name represents the name of the corresponding partition
      of the NAND flash device.

      NAND flash partitions:
      - reg : The partition's offset and size within the flash bank.
      - label : (optional) The label / name for this flash partition.
        If omitted, the label is taken from the node name (excluding
        the unit address).
      - read-only : (optional) This parameter, if present, is a hint to
        Linux that this flash partition should only be mounted
        read-only.  This is usually used for flash partitions
        containing early-boot firmware images or data which should not
        be clobbered.
 
      Example:

	upm@1,0 {
		compatible = "fsl,upm-nand";
		reg = <1 0 1>;
		fsl,upm-addr-offset = <16>;
		fsl,upm-cmd-offset = <8>;
		gpios = <&qe_pio_e 18 0>;

		flash {
			#address-cells = <1>;
			#size-cells = <1>;
			compatible = "stmicro,NAND512W3A2BN6E";
			read-fetch-delay = 25

			fs@0 {
				label = "fs";
				reg = <0 f80000>;
			};

			firmware@f80000 {
				label ="firmware";
				reg = <f80000 80000>;
				read-only;
			};
		};
	};

What do you think?

Wolfgang.
