Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvNSd-0000RG-3k
 for linux-mtd@lists.infradead.org; Tue, 04 Apr 2017 12:21:25 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 3C2642017E
 for <linux-mtd@lists.infradead.org>; Tue,  4 Apr 2017 12:21:00 +0000 (UTC)
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0A3920155
 for <linux-mtd@lists.infradead.org>; Tue,  4 Apr 2017 12:20:57 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id v76so60348073ywg.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Apr 2017 05:20:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc@st.com>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-2-git-send-email-ludovic.Barre@st.com>
 <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
 <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc@st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Apr 2017 07:20:36 -0500
Message-ID: <CAL_JsqK5mZojW1fVRrg=TfO3sXd7Eqa6gS9NS9aDjXwn4_26_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document the STM32 QSPI bindings
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 4, 2017 at 2:28 AM, Ludovic BARRE <ludovic.barre@st.com> wrote:
> Hi Rob
>
> thanks for review
> my comments below
>
> br
> Ludo
>
> On 04/03/2017 06:57 PM, Rob Herring wrote:
>>
>> On Fri, Mar 31, 2017 at 07:02:03PM +0200, Ludovic Barre wrote:
>>>
>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>
>>> This patch adds documentation of device tree bindings for the STM32
>>> QSPI controller.
>>>
>>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>>> ---
>>>   .../devicetree/bindings/mtd/stm32-quadspi.txt      | 45
>>> ++++++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> new file mode 100644
>>> index 0000000..95a8ebd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> @@ -0,0 +1,45 @@
>>> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
>>> +
>>> +Required properties:
>>> +- compatible: should be "st,stm32f469-qspi"
>>> +- reg: contains the register location and length.
>>> +  (optional) the memory mapping address and length
>>
>> Why optional? Either the h/w has it or doesn't. If some chips don't,
>> they should have a different compatible string.
>
> in fact, the stm32 qspi controller can operate in any of the following
> modes:
> -indirect mode: all the operations are performed using the qspi registers
> with read/write.
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory (use memcpy_fromio). this mode improve read throughput
>
> if qspi_mm is defined the qspi controller use read memory-mapped mode
> else the controller transfers in indirect mode.

You should always have the memory region defined because that's what
the h/w has. If you want another property to select the mode, then
perhaps that's fine. But why? Can't the OS figure out which to use?
Why would you ever not use memory mapped mode unless the driver
doesn't yet support it?

Rob
