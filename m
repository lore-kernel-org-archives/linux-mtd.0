Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCjXU-0008Dp-8o
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 03:59:29 +0000
Received: by lbbgf7 with SMTP id gf7so3138707lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 20:59:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <503E0274.7000205@antcom.de>
References: <50222E55.5070204@embedded-brains.de>
 <1345808311.2848.286.camel@sauron.fi.intel.com>
 <50377989.1050401@antcom.de>
 <1346229208.2848.441.camel@sauron.fi.intel.com>
 <503E0274.7000205@antcom.de>
Date: Fri, 14 Sep 2012 20:59:25 -0700
Message-ID: <CAN8TOE-7e5CuLz6bQduif9m7gv_d_WY4JWA1_P887+29R3mWjQ@mail.gmail.com>
Subject: Re: ARM: LPC32XX SLC ECC Handling
From: Brian Norris <computersforpeace@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Linux MTD <linux-mtd@lists.infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Aug 29, 2012 at 4:52 AM, Roland Stigge <stigge@antcom.de> wrote:
> On 08/29/2012 10:33 AM, Artem Bityutskiy wrote:
>>>>> the LPC32XX SLC controller has a ECC feature that covers only
>>>>> the main data area, but not the OOB data.  Is it the
>>>>> responsibility of the user to protect its OOB data via an
>>>>> ECC?  The LPC32XX MLC controller on the other hand covers the
>>>>> complete OOB data with its ECC.  How can a user determine if
>>>>> it has to protect its OOB data?

I haven't dealt with this question, since I basically don't support
user data in OOB on my system. I'm basically using only UBI. But see
my other comments below.

>>>> I guess it is good idea to CC the author of the drivers.
>>>
>>> Thanks for CC'ing, would have missed it.
>>>
>>> Yes, it's exactly as Sebastian described - only the MLC
>>> controller covers OOB in ECC.
>>>
>>> At this point, I need to give back the question to the MTD
>>> maintainers: Is there an API how we can help users at this point?
>>> I would be happy to implement it.
>>
>> Well, I guess from the user's POW the driver either protects OOB
>> data with ECC or not. There is no interface for detecting this in
>> MTD, but I do not see why someone could not create it.
>>
>> Am I right that we are talking about the situation when OOB and
>> data areas are covered by different ECCs, or this is about user
>> writing data +oob at one go, and everything is covered by the same
>> ECC?
>
> In the above case of LPC32xx/MLC NAND (not sure if this is common with
> other controllers),

By my experience in interacting with the community, few controllers
have support for protecting OOB with ECC, and even fewer drivers
actual implement it. I think my (out-of-tree) driver was the only one
that could ever reported bitflips for OOB transactions. And for
instance, I added the read_oob/read_oob_raw and
write_oob/write_oob_raw clarification in nand_ecc_ctrl, but there are
no in-tree users that differentiate the two...

> the controller covers 512 (sub)pages plus some OOB
> bytes with a single ECC operation, storing it behind those covered OOB.

My controller is basically the same.

Brian
