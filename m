Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRLYN-0006VU-Sd
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 13:33:53 +0000
Message-ID: <540F01A1.3050903@ti.com>
Date: Tue, 9 Sep 2014 16:33:21 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2 1/3] nand: omap2: Add support for flash-based bad block
 table
References: <1410175636-4036-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410175636-4036-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540EBBEC.0@ti.com> <20140909132708.GA3315@arch.hh.imgtec.org>
In-Reply-To: <20140909132708.GA3315@arch.hh.imgtec.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2014 04:27 PM, Ezequiel Garcia wrote:
> On 09 Sep 11:35 AM, Roger Quadros wrote:
>> Ezequiel,
>>
>> On 09/08/2014 02:27 PM, Ezequiel Garcia wrote:
>>> This commit adds a new platform-data boolean property that enables use
>>> of a flash-based bad block table. This can also be enabled by setting
>>> the 'nand-on-flash-bbt' devicetree property.
>>
>> I'm not much aware of how on-flash-BBT works internally, but will it break things if
>> we keep on-flash-BBT "enabled" as the default option and add a DT property only to
>> explicitly disable the on-flash-BBT?
>>
> 
> No, that wouldn't work because the DT property already exists and it works to
> enable the flash BBT when it's present.
> 
> Documentation/devicetree/bindings/mtd/nand.txt
> 
> Of course, we can add a new no-nand-on-flash-bbt, but I really don't see the
> point. Users can just put the property in all the devicetree board files where
> it's needed.
> 
> And moreover, I don't want to change the default behavior of the driver; it's
> better to allow to *add* a new feature, if such feature is desired.
> Otherwise, users with some data in a flash's last blocks would be wiped and
> replaced with the BBT.
> 

OK. Let's stick with your patch then.

cheers,
-roger
