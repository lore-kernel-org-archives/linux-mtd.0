Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKmo2-0005Pv-Ot
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 12:19:27 +0000
Subject: Re: [linux-sunxi] Re: [PATCH 2/4] mtd: nand: nand_decode_ext_id():
 Fill in ecc strength and size for Samsung
To: boris.brezillon@free-electrons.com,
 Brian Norris <computersforpeace@gmail.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-2-git-send-email-hdegoede@redhat.com>
 <20150730092914.3616eb5c@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55BA1637.5000008@redhat.com>
Date: Thu, 30 Jul 2015 14:19:03 +0200
MIME-Version: 1.0
In-Reply-To: <20150730092914.3616eb5c@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 30-07-15 09:29, Boris Brezillon wrote:
> Hi,
>
> On Wed, 29 Jul 2015 19:53:52 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
>> On some nand controllers with hw-ecc the controller code wants to know the
>> ecc strength and size and having these as 0, 0 is not accepted.
>>
>> Specifying these in devicetree is possible but undesirable as the nand
>> may be different in different production runs of the same board, so it
>> is better to get this info from the nand id where possible.
>>
>> This commit adds code to read the ecc strength and size from the nand for
>> Samsung extended-id nands. This code is based on the info for the 5th
>> id byte in the datasheets for the following Samsung nands: K9GAG08U0E,
>> K9GAG08U0F, K9GAG08X0D, K9GBG08U0A, K9GBG08U0B. These all use these bits
>> in the exact same way.
>
> Okay, that's the one I'm not sure about. If that's really the case,
> and Samsung is actually using the same layout for all its chips, we
> should be good, but as I already stated in the other thread, this was
> not the case for Hynix chips.

The list of datasheets I checked is longer then the one used to write
the other samsung code which is setting equally important properties.

Regards,

Hans
