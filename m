Message-ID: <53208F7D.8090104@gmail.com>
Date: Wed, 12 Mar 2014 17:46:53 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH v2 04/14] mtd: nand: define struct nand_timings
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com>
 <531DC1A4.7010208@gmail.com> <20140311185554.GD31835@obsidianresearch.com>
In-Reply-To: <20140311185554.GD31835@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>,
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

Le 11/03/2014 19:55, Jason Gunthorpe a écrit :
> On Mon, Mar 10, 2014 at 02:44:04PM +0100, Boris BREZILLON wrote:
>
>> Some timings are missing here (see Table 55 in the ONFI spec):
> Right..
>
> The 'mode' covers only the raw electrical parameters needed to
> exchange commands, other timings cover the commands
> themselves. Notably the timing mode does not alter those parameters.
>
> To me it seems tidy to keep the 'mode' timings contained in their own
> struct and find other homes for the other parameters.
>
>> -tR
>> -tBERS
>> -tCCS
>> -tPLEBSY
>> -...
>>
>> I see at least 3 of those timings that could be useful (for the moment) :
>> - tR: this one should be used to fill the chip_delay field
>> - tPROG and tBERS: could be used within nand_wait to choose the timeo
>>    value appropriately.
> IIRC these timing values are really only necessary if the controller
> does not support the READY/BUSY input, in that case drivers typically
> seem to use 'chip_delay' which is the maximum possible command
> execution time (a sleep long enough to guarentee that READY/BUSY is
> de-asserted).
You're right about tR (or chip_delay): it's only used when there are no 
R/B pin.
I experienced it when I tried the RB_NONE case in the sunxi driver: the 
default
chip_delay set by the NAND core code was too small to fit the NAND chip 
requirements.

Anyway, I really think the chip_delay field should be set according to 
NAND chip
characteristics not harcoded in NAND controller driver code (as 
currently done).

tPROG and tBERS, would be used in nand_wait function and do not depend 
on the R/B pin.
These are just used as timeouts.

>
>> Or should I create a new struct for these timings ?
>> In the latter case how should I name it ?
> struct onfi_command_timings ?

I'm not a big fan of this name. I think timing structs should not 
contain onfi in their
names, because these timings are also available on non ONFI chips.

Moreover, these timings are also part of the SDR NAND timings, they are 
just retrieved
using another method when interfacing with an ONFI chip.

Maybe we should change the nand_sdr_timings struct name too.

What do you think ?

Best Regards,

Boris

>
> Regards,
> Jason
