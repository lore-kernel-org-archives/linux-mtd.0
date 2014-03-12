Message-ID: <5320AC16.8030901@gmail.com>
Date: Wed, 12 Mar 2014 19:48:54 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v3 4/9] of: mtd: add documentation for the ONFI NAND timing
 mode property
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-5-git-send-email-b.brezillon.dev@gmail.com>
 <F8865D0A-59A7-41A7-AA7F-9B91DF5C8258@gmail.com>
In-Reply-To: <F8865D0A-59A7-41A7-AA7F-9B91DF5C8258@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/03/2014 19:27, Warner Losh a écrit :
> On Mar 12, 2014, at 12:07 PM, Boris BREZILLON <b.brezillon.dev@gmail.com> wrote:
>
>> Add documentation for the ONFI NAND timing mode property.
> I don’t see a Toggle/JEDEC mode timing property. Will that be defined for Toshiba, Samsung
> and San Disk flash? Or will this be limited to Micron, Intel and Hynix (the only ones
> supporting ONFI)?

There is currently no Toggle/JEDEC timing mode support, and I don't know 
what these
timing modes describe.
But I guess they can be converted to standard timings described in 
nand_sdr_timings
struct (or in your case in the future nand_ddr_timings struct).

Could you check that the timings described by these modes use the same 
naming convention
as those defined in the ONFI specification 
(www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf
  chapter 4.15.4) ?

If this is the case, we can define a new DT property and new converters.

Best Regards,

Boris

> Warner
>
>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
>> ---
>> Documentation/devicetree/bindings/mtd/nand.txt |    8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
>> index b53f92e..2046027 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
>> @@ -19,3 +19,11 @@ errors per {size} bytes".
>> The interpretation of these parameters is implementation-defined, so not all
>> implementations must support all possible combinations. However, implementations
>> are encouraged to further specify the value(s) they support.
>> +
>> +- onfi,nand-timing-mode: an integer encoding the supported ONFI timing modes of
>> +  the NAND chip. Each supported mode is represented as a bit position (i.e. :
>> +  mode 0 and 1 => (1 << 0) | (1 << 1) = 0x3).
>> +  This is only used when the chip does not support the ONFI standard.
>> +  The last bit set represent the closest mode fulfilling the NAND chip timings.
>> +  For a full description of the different timing modes see this document:
>> +  www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf
>> -- 
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
