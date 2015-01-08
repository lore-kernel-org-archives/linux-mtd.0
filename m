Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9ImH-0007lv-RP
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 19:29:55 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so5065363wib.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 11:29:31 -0800 (PST)
Message-ID: <54AEDA1F.9000709@vanguardiasur.com.ar>
Date: Thu, 08 Jan 2015 16:27:27 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: NAND ECC capabilities
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
 <54AEB38D.4030403@vanguardiasur.com.ar> <20150108190916.GT9759@ld-irv-0074>
In-Reply-To: <20150108190916.GT9759@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, Huang Shijie <shijie8@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01/08/2015 04:09 PM, Brian Norris wrote:
> On Thu, Jan 08, 2015 at 01:42:53PM -0300, Ezequiel Garcia wrote:
>> On 01/08/2015 05:32 AM, Ricard Wanderlof wrote:
>>> On Thu, 8 Jan 2015, Steve deRosier wrote:
>>>> Is my general understanding correct?
>>>
>>> I'd say yes, but the ECC threshold should be per 512 byte ECC block (which 
>>> seems to be the correct term rather than 'sector'), rather than per page. 
>>> Are you sure that the threshold is set to 4 (see 
>>> /sys/devices/virtual/mtd/mtd<n>/bitflip_threshold )?
>>>
>>> Normally the threshold is set below the ECC correction capability, so that 
>>> bit scrubbing has a chance to occur before the bits rot too far. Say you 
>>> have the threshold set at 4 bits, and you have 3 bits that have flipped. 
>>> If another bit flips, the block would be scrubbed, but say that two bits 
>>> flipped before you read the data the next time. You would have lost your 
>>> chance of recovery, so it makes sense to have the threshold lower than the 
>>> ECC capability. I would say 3/4 of the ECC capability would be a 
>>> reasonable value.
>>>
>>
>> This makes a lot of sense. However, do we have any way of telling if the
>> bitflips where produced on the same ECC sector?
>>
>> From a cursory look to the code, I'd say there's no such feature with
>> the current MTD/NAND design. So, if an mtd_read reports 3 bitflips you
>> have no way of telling they happened on the same sector or not, so you
>> can't implement your idea.
> 
> I'm not sure if I'm misunderstanding you or if you are misunderstanding
> the code. Please review Documentation/ABI/testing/sysfs-class-mtd for
> the 'bitflip_threshold' description. We only deal with the max # of
> bitflips per sector (or block, or whatever you want to call it). No
> ECC-related concept is handled on a per-page basis.
> 
> So I believe Ricard is accurately describing the current reality, not
> "his idea."
> 

My bad. I was completely sure that the "max_bitflips" returned by the
NAND read operations was a per-page value, but I see now it wouldn't
make any sense.

Thanks for the correction,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
