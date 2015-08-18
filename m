Received: from mail-bn1on0056.outbound.protection.outlook.com ([157.56.110.56]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRmEw-0004Em-NB
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 19:08:07 +0000
Message-ID: <55D3819D.1040009@opensource.altera.com>
Date: Tue, 18 Aug 2015 14:03:57 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Vikas MANOCHA <vikas.manocha@st.com>
CC: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, "Yves
 Vandervennet" <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D29A0B.20408@st.com> <201508180647.30119.marex@denx.de>
 <0B80CAC4-70B3-4557-8D6E-4CA84AF9CEA2@st.com>
In-Reply-To: <0B80CAC4-70B3-4557-8D6E-4CA84AF9CEA2@st.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On 08/18/2015 12:48 AM, Vikas MANOCHA wrote:

[...]

>>>> +Required properties:
>>>> +- compatible : Should be "cdns,qspi-nor".
>>>> +- reg : Contains two entries, each of which is a tuple consisting of a
>>>> +    physical address and length.  The first entry is the address and
>>>> +    length of the controller register set.  The second entry is the
>>>> +    address and length of the QSPI Controller data area.
>>>
>>> "Controller data area", i think it means mapped NOR Flash address ?
>>
>> Probably ; Graham ?
>>
>>> If yes, it would be more clear with "Physical base address & size of NOR
>>> Flash".
>>
>> This is the Direct mode thing, correct ? We don't support this, so I think
>> we should drop this bit altogether and keep only one single address in this
>> field.
>
> No it's not.
>

It's the location of the SRAM fifo.  Also direct mode location I think, 
if that were ever used.

The size is determined by a configuration parameter during system 
design.  On Altera Cyclone5 the size is really big compared to SRAM 
fifo.  I don't know why, maybe some hw engineer thought it would be 
better to have a large size in case direct mode was used.

BR,
Graham
