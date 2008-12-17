Received: from smtp7-g19.free.fr ([212.27.42.64])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD4IE-0006Dj-SS
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 21:50:59 +0000
Message-ID: <49497440.7050204@free.fr>
Date: Wed, 17 Dec 2008 22:50:56 +0100
From: Chris Moore <moore@free.fr>
MIME-Version: 1.0
To: Marc Singer <elf@synapse.com>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of the fixup.
	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>
In-Reply-To: <20081216205650.GA13729@zealous.synapse.com>
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

Hi Marc and the list,

I am afraid to admit that I was the author of the modifications that you 
obviously did not like :(
Let me also admit that I am a newbie to MTD, to CFI and to NOR flash 
devices so please correct me if I write anything stupid.

You say in the subject "AMD implemtation restore to original version 
that has worked fine since 2001".
You seem to imply by this that my modifications broke some previously 
working AMD parts.
I apologize if this is the case but I cannot see how.
Which AMD part(s) did I break?
(However I did realize after submitting my patch that it could possibly 
break certain Macronix parts using AMD CFI PRI V1.0 that were previously 
working more by luck than judgement.)

Before submitting my patch I carefully considered whether to modify the 
AMD fixup or to add a Macronix specific one as you did.
It seemed to me that:-
a) In the context of the fixup AMD referred to the "Primary Vendor 
Command Set and Control Interface ID Code" used and not to the 
manufacturer of the part.
For this Macronix also use the "AMD/Fujitsu Standard Command Set".
b) Although AIUI each manufacturer is free to choose his own Device ID 
allocations, in practice most manufacturers use the same Device ID when 
they clone another manufacturer's part.
For example IIRC, AMD, Fujitsu, Spansion, EON, ESI and Macronix all use:-
- 0xBA/0x22BA for their 29LV400 B parts
- 0xB9/0x22B9 for their 29LV400 T parts
I therefore concluded that it was legitimate and useful in terms of 
avoiding duplicate code to handle Macronix in the AMD fixup routine.
You prefer to separate the fixup routines and I accept your decision (it 
was a close call for me).

However I do have one objection:-
Your Macronix version is not equivalent to mine and I believe that my 
version handles more parts correctly ;-)

Instead of:-

+                switch (cfi->id) {
+                                /* Macronix MX29LV400CT */
+                case 0x00ba:
+                case 0x22ba:
+                        extp->TopBottom = 2;                 /* bottom-boot */
+                        break;
+                        	/* Macronix MX29LV400CB */
+                case 0x00b9:
+                case 0x22b9:
+                        extp->TopBottom = 3;                 /* top-boot */
+                        break;
+                default:
+                                /* Fall back is to assume we have
+                                 * bottom-boot. */
+                        extp->TopBottom = 2; /* bottom-boot */
+                        break;
+                }


I would prefer:-

+                switch (cfi->id) {
+                                /* Macronix MX29LV400CB */
+                case 0x00ba:
+                case 0x22ba:
+                        extp->TopBottom = 2;                 /* bottom-boot */
+                        break;
+                default:
+                        extp->TopBottom = (cfi->id & 0x80)
+                                ? 3 /* top-boot */
+                                : 2 /* bottom-boot */;
+                        break;
+                }


David Woodhouse asked me to add correct handling of a few Macronix parts 
which are incorrectly detected by my code and I shall do this once your 
patch goes through.

There is one other point that I would like to make (again).
IMHO the patch from Uwe Kleine-Koenig in this thread should be applied:-
http://thread.gmane.org/gmane.linux.drivers.mtd/22267
See also this thread:-
http://thread.gmane.org/gmane.linux.drivers.mtd/22176

Sorry for this long ramble.

Cheers,
Chris
