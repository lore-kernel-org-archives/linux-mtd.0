Received: from henry.synapsedev.com ([66.147.194.230] helo=henry.synapse.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LD7CH-0006Wy-39
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 00:57:01 +0000
Message-ID: <49499FDA.4010000@synapse.com>
Date: Wed, 17 Dec 2008 16:56:58 -0800
From: Marc Oscar Singer <elf@synapse.com>
MIME-Version: 1.0
To: Chris Moore <moore@free.fr>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of the fixup.
	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>
	<49497440.7050204@free.fr>
In-Reply-To: <49497440.7050204@free.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chris Moore wrote:
> Hi Marc and the list,
>
> I am afraid to admit that I was the author of the modifications that 
> you obviously did not like :(
> Let me also admit that I am a newbie to MTD, to CFI and to NOR flash 
> devices so please correct me if I write anything stupid.
No worries.
>
> You say in the subject "AMD implemtation restore to original version 
> that has worked fine since 2001".
> You seem to imply by this that my modifications broke some previously 
> working AMD parts.
That isn't what I meant.
> I apologize if this is the case but I cannot see how.
> Which AMD part(s) did I break?
> (However I did realize after submitting my patch that it could 
> possibly break certain Macronix parts using AMD CFI PRI V1.0 that were 
> previously working more by luck than judgement.)
>
> Before submitting my patch I carefully considered whether to modify 
> the AMD fixup or to add a Macronix specific one as you did.
> It seemed to me that:-
> a) In the context of the fixup AMD referred to the "Primary Vendor 
> Command Set and Control Interface ID Code" used and not to the 
> manufacturer of the part.
> For this Macronix also use the "AMD/Fujitsu Standard Command Set".
> b) Although AIUI each manufacturer is free to choose his own Device ID 
> allocations, in practice most manufacturers use the same Device ID 
> when they clone another manufacturer's part.
> For example IIRC, AMD, Fujitsu, Spansion, EON, ESI and Macronix all use:-
> - 0xBA/0x22BA for their 29LV400 B parts
> - 0xB9/0x22B9 for their 29LV400 T parts
> I therefore concluded that it was legitimate and useful in terms of 
> avoiding duplicate code to handle Macronix in the AMD fixup routine.
> You prefer to separate the fixup routines and I accept your decision 
> (it was a close call for me).
The only risky part is that your code depended, implicitly, on the fact 
that both of the Macronix IDs had the high bit set.
IMHO, it is more clear and safer to be explicit in the way that the code 
will execute.

Your wish to avoid duplicate code seems odd in that you check for the 
macronix ID in the fixup.  Someone reading the code
is going to have to know that the amd_fixup is called for Macronix 
parts, but that would be unexpected given the way
that the
>
> However I do have one objection:-
> Your Macronix version is not equivalent to mine and I believe that my 
> version handles more parts correctly ;-)
>
> Instead of:-
>
> +                switch (cfi->id) {
> +                                /* Macronix MX29LV400CT */
> +                case 0x00ba:
> +                case 0x22ba:
> +                        extp->TopBottom = 2;                 /* 
> bottom-boot */
> +                        break;
> +                            /* Macronix MX29LV400CB */
> +                case 0x00b9:
> +                case 0x22b9:
> +                        extp->TopBottom = 3;                 /* 
> top-boot */
> +                        break;
> +                default:
> +                                /* Fall back is to assume we have
> +                                 * bottom-boot. */
> +                        extp->TopBottom = 2; /* bottom-boot */
> +                        break;
> +                }
>
>
> I would prefer:-
>
> +                switch (cfi->id) {
> +                                /* Macronix MX29LV400CB */
> +                case 0x00ba:
> +                case 0x22ba:
> +                        extp->TopBottom = 2;                 /* 
> bottom-boot */
> +                        break;
> +                default:
> +                        extp->TopBottom = (cfi->id & 0x80)
> +                                ? 3 /* top-boot */
> +                                : 2 /* bottom-boot */;
> +                        break;
> +                }
>
This is part of the unclear portion of the fixup.  Do you know of 
Macronix parts that can depend on the ID bit 7 selecting top versus
bottom boot?
>
> David Woodhouse asked me to add correct handling of a few Macronix 
> parts which are incorrectly detected by my code and I shall do this 
> once your patch goes through.
Which parts are those?  I can just resubmit with them...or you can 
submit a patch that takes care of all of this.

>
> There is one other point that I would like to make (again).
> IMHO the patch from Uwe Kleine-Koenig in this thread should be applied:-
> http://thread.gmane.org/gmane.linux.drivers.mtd/22267
> See also this thread:-
> http://thread.gmane.org/gmane.linux.drivers.mtd/22176
>
I'll check on this, but it may be a week before I can do so as I'm 
travelling soon.
> Sorry for this long ramble.
>
> Cheers,
> Chris
>
Thanks for the response.


-- 
Marc Singer
Bureau of Gizmology
elf@synapse.com
t. 206.832.3712
   800.682.0581
f. 206.381.0899

Synapse Product Development, LLC.
1511 6th Avenue, 4th floor
Seattle, WA 98101
