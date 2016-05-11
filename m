Received: from mail-sg2apc01on0079.outbound.protection.outlook.com
 ([104.47.125.79] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0O3D-0000dd-En
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 06:55:20 +0000
Subject: Re: [PATCH] mtd: nandbiterrs: Support for NAND biterrors test on
 platforms without raw write
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <572BDE8C.3020703@netcommwireless.com>
 <20160508184451.3d90176a@bbrezillon> <57300D8A.8040607@netcommwireless.com>
 <20160510104851.53dc8211@bbrezillon>
CC: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
From: Iwo Mergler <iwo.mergler@netcommwireless.com>
Message-ID: <5732D730.30703@netcommwireless.com>
Date: Wed, 11 May 2016 16:54:40 +1000
MIME-Version: 1.0
In-Reply-To: <20160510104851.53dc8211@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2016 06:48 PM, Boris Brezillon wrote:
> Hi Iwo,
>
> On Mon, 9 May 2016 14:09:46 +1000
> Iwo Mergler <iwo.mergler@netcommwireless.com> wrote:
>
>> Hi Boris,
>>
>>
>> I have to admit that your NACK surprised me.
>>
>> My patch removes an unnecessary use of raw write
>> from the test. It was only there because of my
>> original implementation, which I now consider
>> mistaken.
> Sorry, I didn't look at the diff itself, and focused on the commit
> message :-/. Indeed, using normal write in the overwrite test should be
> harmless, but I still think that all controller should properly
> implement raw access functions, otherwise the "incremental errors"
> test is irrelevant (you'll overwrite ECC bytes along with in-band
> data, and will end up with more bitflips than you expected).
Indeed. Fully agree.


>> I fully agree with you that raw write should
>> be implemented, despite the impediments.
>> Although I have seen at least one NAND controller
>> that always computed and wrote ECC, with no way
>> for software to circumvent it.
> Hm, I was told that so many times and each time I had a closer look it
> appeared to be untrue, so I tend to be skeptical on these kind of
> statement now. Could you tell me more about this controller?
It's been a while. Probably Philips/NXP mobile phone chip
set, PNX8000 or similar. Don't think it ever made it into the
market as such, but the earliest ARM9 'microcontrollers' (LPC3xxx)
have a high likelihood of being the same silicon.

DMA with no provision of software I/O was fashionable in
the early '00s. Patent US8060688 is a reflection of that pain,
despite the attempts at obfuscation by the attorneys. ;-)

>> Could you please elaborate a little why you
>> don't want a test module to work with incomplete
>> MTD drivers?
> As I said, this test module will only work in overwrite mode when the
> controller does not support raw accesses.
>> Is that supposed to be motivating
>> driver writers for better implementations? ;-)
> Yes, partly, and also because it's really helpful when you need to debug
> NAND stuff.
>
> Honestly, I'd rather see NAND implementations return -ENOTSUPP when
> they do not support raw accesses than pretending they are.
I think the Qualcomm driver does that, the original form
of the test fails with an error code on the raw write.

>> Would you accept the patch if I remove the comment
>> about data reshuffling drivers? It's not required
>> for the patch and, as you correctly pointed out,
>> now inaccurate.
> At least rework it to mention that you're only modifying the overwrite
> test, and that writing in normal mode in this case is harmless.
I'll do that. Patch follows.

Best regards,

Iwo
