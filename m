Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPufT-0003tC-4I
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 17:52:54 +0000
Received: by mail-wm0-x241.google.com with SMTP id y5so7162274wmh.3
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 10:52:30 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller
 Version 2
To: matthew.gerlach@linux.intel.com
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
 <0bfc282d-2aec-8f36-1528-312f7ded8d9c@gmail.com>
 <alpine.DEB.2.20.1706270722440.8058@mgerlach-VirtualBox>
 <0ca53c35-732c-a122-8191-6d102e824d52@gmail.com>
 <alpine.DEB.2.20.1706270833100.8058@mgerlach-VirtualBox>
 <a7e3bb21-6e05-4117-0a25-8782a75b93ad@gmail.com>
 <alpine.DEB.2.20.1706271004460.8058@mgerlach-VirtualBox>
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <510a1968-3e5c-8621-a2f1-116cfe8f6eac@gmail.com>
Date: Tue, 27 Jun 2017 19:52:27 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1706271004460.8058@mgerlach-VirtualBox>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/27/2017 07:18 PM, matthew.gerlach@linux.intel.com wrote:
> 
> 
> On Tue, 27 Jun 2017, Marek Vasut wrote:
> 
>> On 06/27/2017 05:57 PM, matthew.gerlach@linux.intel.com wrote:
>>>
>>>
>>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>>
>>>> On 06/27/2017 04:32 PM, matthew.gerlach@linux.intel.com wrote:
>>>>>
>>>>>
>>>>> On Tue, 27 Jun 2017, Marek Vasut wrote:
>>>>>
>>>>> Hi Marek,
>>>>>
>>>>> Thanks for the feedback.  See my comments below.
>>>>>
>>>>> Matthew Gerlach
>>>>>
>>>>>> On 06/26/2017 06:13 PM, matthew.gerlach@linux.intel.com wrote:
>>>>>>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>>>>>
>>>>>>> Device Tree bindings for Version 2 of the Altera Quadspi Controller
>>>>>>> that can be optionally paired with a windowed bridge.
>>>>>>>
>>>>>>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37
>>>>>>> ++++++++++++++++++++++
>>>>>>>  1 file changed, 37 insertions(+)
>>>>>>>  create mode 100644
>>>>>>> Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>> b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>> new file mode 100644
>>>>>>> index 0000000..8ba63d7
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
>>>>>>> @@ -0,0 +1,37 @@
>>>>>>> +* Altera Quad SPI Controller Version 2
>>>>>>> +
>>>>>>> +Required properties:
>>>>>>> +- compatible : Should be "altr,quadspi-v2".
>>>>>>> +- reg : Contains at least two entries, and possibly three entries,
>>>>>>> each of
>>>>>>> +    which is a tuple consisting of a physical address and length.
>>>>>>> +- reg-names : Should contain the names "avl_csr" and "avl_mem"
>>>>>>> corresponding
>>>>>>> +          to the control and status registers and qspi memory,
>>>>>>> respectively.
>>>>>>> +
>>>>>>> +
>>>>>>> +The Altera Quad SPI Controller Version 2 can be paired with a
>>>>>>> windowed bridge
>>>>>>> +in order to reduce the footprint of the memory interface.  When a
>>>>>>> windowed
>>>>>>> +bridge is used, reads and writes of data must be 32 bits wide.
>>>>>>> +
>>>>>>> +Optional properties:
>>>>>>> +- reg-names : Should contain the name "avl_window", if the windowed
>>>>>>> bridge
>>>>>>> +          is used.  This name corresponds to the register space
>>>>>>> that
>>>>>>> +          controls the window.
>>>>>>> +- window-size : The size of the window which must be an even power
>>>>>>> of 2.
>>>>>>> +- read-bit-reverse : A boolean indicating the data read from the
>>>>>>> flash should
>>>>>>> +             be bit reversed on a byte by byte basis before being
>>>>>>> +             delivered to the MTD layer.
>>>>>>> +- write-bit-reverse : A boolean indicating the data written to the
>>>>>>> flash should
>>>>>>> +              be bit reversed on a byte by byte basis.
>>>>>>
>>>>>> Is there ever a usecase where you need to set just one of these
>>>>>> props ?
>>>>>> Also, they're altera specific, so altr, prefix should be added.
>>>>>
>>>>> In general, I think if bit reversal is required, it would be
>>>>> required in
>>>>> both directions.  However, anything is possible when using FPGAs.  So
>>>>> I thought separate booleans would be future proofing the bindings.
>>>>
>>>> Maybe we should drop this whole thing and add it when this is actually
>>>> required.
>>>>
>>>> Are there any users of this in the wild currently ?
>>>>
>>>> What is the purpose of doing this per-byte bit reverse instead of
>>>> storing th bits in the original order ?
>>>
>>> Hi Marek,
>>>
>>> Yes, there is hardware that has been in the wild for years that needs
>>> this bit reversal.  The specific use case is when a flash chip is
>>> connected to
>>> a FPGA, and the contents of the flash is used to configure the FPGA on
>>> power up.  In this use case, there is no processor involved with
>>> configuring the FPGA.  I am most familiar with this feature/bug with
>>> Altera FPGAs, but I believe this issue exists with other programmable
>>> devices.
>>
>> So the EPCQ/EPCS flash stores the bitstream in reverse or something ?
>> What are you storing in that flash except for the bitstream, filesystem?
>> Feel free to go into details, I believe it'd be useful to know exactly
>> what the problem is you're trying to solve here.
> 
> Hi Marek,
> 
> I am trying to write an MTD/spi-nor driver for version 2 of the
> Altera Quadspi contoller.  This controller is soft IP that is deployed
> in a FPGA.  As such, this component/driver can be used in wide range of
> use cases.  The controller could be used to update EPCQ/EPCS flash
> stores containing bit streams, but this component could be used for
> flash for filesystems or any non-volatile data store.  My hope is that
> all possible use cases should be covered by this driver.

How does this particular case where you have to reverse the bits look like ?

>>>>> Thinking about this binding more, I wonder if the binding name(s)
>>>>> should be (read|write)-bit8-reverse to indicate reversings the bits
>>>>> in a byte as opposed to reversing the bits in a 32 bit word?
>>>>>
>>>>> I don't think bit reversal is specific to Altera/Intel components.
>>>>> I see
>>>>> a nand driver performing bit reversal, and I think I've recently seen
>>>>> other FPGA based drivers requiring bit reversal.
>>>>
>>>> $ git grep bit.reverse Documentation/devicetree/ | wc -l
>>>> 0
>>>>
>>>> So we don't have such a generic binding . It's up to Rob (I guess) to
>>>> decide whether this is SoC specific and should've altr, prefix or not.
>>>> IMO it is.
>>>
>>> I agree there is no generic binding at this time, and I look forward
>>> to any input from Rob and anyone else on this issue.  I think it is
>>> worth pointing out that this really isn't an issue of an SoC, but rather
>>> it is an
>>> issue of how data in the flash chip is accessed.I think what makes
>>> this issue
>>> "weird" is that we have different hardware accessing the data in the
>>> flash with a different perspective.  The FPGA looks at the data from one
>>> perspective on power up, and a processor trying to update the flash has
>>> a different perspective.
>>
>> Another thing I'd ask here is, is that bit-reverse a hardware property
>> or is that some software configuration thing ?
> 
> I would say the bit reversal is a property of the FPGA that is reading
> the flash at power up.

So it's not a property of the block, but rather of the bus somewhere ?

-- 
Best regards,
Marek Vasut
