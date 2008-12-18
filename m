Received: from smtp3-g19.free.fr ([212.27.42.29])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD9og-0003Ix-4s
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 03:44:50 +0000
Message-ID: <4949C730.9050906@free.fr>
Date: Thu, 18 Dec 2008 04:44:48 +0100
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Marc Oscar Singer <elf@synapse.com>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of the
	fixup.	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>	<49497440.7050204@free.fr>
	<49499FDA.4010000@synapse.com>
In-Reply-To: <49499FDA.4010000@synapse.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marc,

Thank you for your reply.

I removed Uwe from the CC list.
This may be bad form but this part of the discussion does not concern 
his patch.

Marc Oscar Singer a écrit :
> Chris Moore wrote:
>   
>> Before submitting my patch I carefully considered whether to modify 
>> the AMD fixup or to add a Macronix specific one as you did.
>> It seemed to me that:-
>> a) In the context of the fixup AMD referred to the "Primary Vendor 
>> Command Set and Control Interface ID Code" used and not to the 
>> manufacturer of the part.
>> For this Macronix also use the "AMD/Fujitsu Standard Command Set".
>> b) Although AIUI each manufacturer is free to choose his own Device ID 
>> allocations, in practice most manufacturers use the same Device ID 
>> when they clone another manufacturer's part.
>> For example IIRC, AMD, Fujitsu, Spansion, EON, ESI and Macronix all use:-
>> - 0xBA/0x22BA for their 29LV400 B parts
>> - 0xB9/0x22B9 for their 29LV400 T parts
>> I therefore concluded that it was legitimate and useful in terms of 
>> avoiding duplicate code to handle Macronix in the AMD fixup routine.
>> You prefer to separate the fixup routines and I accept your decision 
>> (it was a close call for me).
>>     
> The only risky part is that your code depended, implicitly, on the fact 
> that both of the Macronix IDs had the high bit set.
>   

Both ?
I count around 23 ;-)
In the commit comments for my patch I cited the following Macronix parts 
with AMD CFI PRI V1.0:-

It detects the following parts correctly:-
MX28F640C3B T
MX29LV002C  B
MX29LV002NC B
MX29LV004C  T
MX29LV400C  T/B
MX29LV800C  T/B
MX29LV160C  T/B
MX29SL800C  T/B
MX29SL802C  T/B

It detects the following uniform part as bottom but it should work
correctly:-
MX29LV040C

It does not detect the following correctly:-
MX28F640C3B B
MX29LV002C  T
MX29LV002NC T
MX29LV004C  B
MX29SL400C  T/B
MX29SL402C  T/B


> IMHO, it is more clear and safer to be explicit in the way that the code 
> will execute.
>
>   

It seemed clear to me but one's own code always does ... at least at the 
time of writing it ;-)

> Your wish to avoid duplicate code seems odd in that you check for the 
> macronix ID in the fixup.  Someone reading the code
> is going to have to know that the amd_fixup is called for Macronix 
> parts, but that would be unexpected given the way
> that the
>   

IMHO the only real problem is that, as you say, the name of the function 
is not very clear.
Maybe I should have changed it to something like 
fixup_amd_cfi_pri_v1_0_bootblock().
However in my patch I wished to change as little as possible.

>> However I do have one objection:-
>> Your Macronix version is not equivalent to mine and I believe that my 
>> version handles more parts correctly ;-)
>>
>> Instead of:-
>>
>> +                switch (cfi->id) {
>> +                                /* Macronix MX29LV400CT */
>> +                case 0x00ba:
>> +                case 0x22ba:
>> +                        extp->TopBottom = 2;                 /* 
>> bottom-boot */
>> +                        break;
>> +                            /* Macronix MX29LV400CB */
>> +                case 0x00b9:
>> +                case 0x22b9:
>> +                        extp->TopBottom = 3;                 /* 
>> top-boot */
>> +                        break;
>> +                default:
>> +                                /* Fall back is to assume we have
>> +                                 * bottom-boot. */
>> +                        extp->TopBottom = 2; /* bottom-boot */
>> +                        break;
>> +                }
>>
>>
>> I would prefer:-
>>
>> +                switch (cfi->id) {
>> +                                /* Macronix MX29LV400CB */
>> +                case 0x00ba:
>> +                case 0x22ba:
>> +                        extp->TopBottom = 2;                 /* 
>> bottom-boot */
>> +                        break;
>> +                default:
>> +                        extp->TopBottom = (cfi->id & 0x80)
>> +                                ? 3 /* top-boot */
>> +                                : 2 /* bottom-boot */;
>> +                        break;
>> +                }
>>
>>     
> This is part of the unclear portion of the fixup.  Do you know of 
> Macronix parts that can depend on the ID bit 7 selecting top versus
> bottom boot?
>   

Yes, the following at least and maybe more:-

MX29LV800C  T/B
MX29LV160C  T/B
MX29SL800C  T/B
MX29SL802C  T/B


>> David Woodhouse asked me to add correct handling of a few Macronix 
>> parts which are incorrectly detected by my code and I shall do this 
>> once your patch goes through.
>>     
> Which parts are those?  I can just resubmit with them...or you can 
> submit a patch that takes care of all of this.
>
>   

MX28F640C3B B
MX29LV002C  T
MX29LV002NC T
MX29LV004C  B
MX29SL400C  T/B
MX29SL402C  T/B

I could submit a patch but probably not until after Christmas.

I think the best plan is that if you really want to make this change 
(with which I do not really agree) then:-
- Put through your patch, preferably revised to leave the ID bit 7 test.
- I shall then submit another patch on top to take care of the remaining 
cases.

But as I wrote above, personally I think that all that is necessary is 
to give the fixup function a clearer name.

> I'll check on this, but it may be a week before I can do so as I'm 
> travelling soon.
>   

I'll be away next week too.
Have a Happy Christmas.

Cheers,
Chris
