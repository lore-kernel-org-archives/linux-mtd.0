Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuxrK-0003t7-5K
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 10:37:59 +0000
Received: by mail-wm0-x243.google.com with SMTP id s12-v6so4770330wmc.0
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2018 03:37:47 -0700 (PDT)
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Ice Lake SPI
 serial flash
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20180828165059.55223-1-mika.westerberg@linux.intel.com>
 <3261d2da-c0a5-920e-ca12-17924a2d3918@gmail.com>
 <20180829111740.12223549@bbrezillon>
 <57933711d93f3ba372ca14743daa90df834ed494.camel@infinera.com>
 <20180829123306.3e9928a4@bbrezillon>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c0c61e87-a369-230e-9905-4f36ce61b4ec@gmail.com>
Date: Wed, 29 Aug 2018 12:37:38 +0200
MIME-Version: 1.0
In-Reply-To: <20180829123306.3e9928a4@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/29/2018 12:33 PM, Boris Brezillon wrote:
> On Wed, 29 Aug 2018 10:28:05 +0000
> Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:
> 
>> On Wed, 2018-08-29 at 11:17 +0200, Boris Brezillon wrote:
>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>>
>>> Hi Marek,
>>>
>>> On Tue, 28 Aug 2018 18:56:38 +0200
>>> Marek Vasut <marek.vasut@gmail.com> wrote:
>>>   
>>>> On 08/28/2018 06:50 PM, Mika Westerberg wrote:  
>>>>> Intel Ice Lake exposes the SPI serial flash controller as a PCI device
>>>>> in the same way than Intel Denverton. Add Ice Lake SPI serial flash PCI
>>>>> ID to the driver list of supported devices.
>>>>>
>>>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>  
>>>>
>>>> This should probably go through trivial patches ML, no ?  
>>>
>>> Nope, it should go through the spi-nor tree. Actually, even for trivial
>>> fixes like typos, I prefer to take them directly to avoid possible
>>> future conflicts in case something changes near the typo.
>>>   
>>>> Also, CC Stable.  
>>>
>>> Why? It's adding a new entry in pci_ids[] table, it looks like
>>> supporting new HW to me, not fixing a bug.  
>>
>> So you can boot/use new HW with stable kernels. Stable kernels would become
>> useless fairly quickly otherwise.
>> HW enablement patches are OK when they don't affect existing HW by much.
> 
> Where did you get that from? I've always been told that Cc-ing stable
> was reserved for bug fixes.

Same rule applies to new USB IDs , it's an exception.

-- 
Best regards,
Marek Vasut
