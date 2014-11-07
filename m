Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmfNq-0008CN-Qa
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 08:59:07 +0000
Message-ID: <1415350722.958.286.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Fri, 07 Nov 2014 10:58:42 +0200
In-Reply-To: <545B66BA.4090904@codeaurora.org>
References: <1414331342-27839-1-git-send-email-tlinder@codeaurora.org>
 <544D5BEC.50802@nod.at> <544E052B.1040505@codeaurora.org>
 <544E08AE.7080506@nod.at> <5450C997.9010205@codeaurora.org>
 <5450D6C4.4040400@nod.at> <54538ABC.1040605@codeaurora.org>
 <5453ABF9.4070208@nod.at> <5453AD4D.2000303@nod.at>
 <545630E1.8020505@codeaurora.org>
 <1415261234.958.171.camel@sauron.fi.intel.com>
 <545B66BA.4090904@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 14:16 +0200, Tanya Brokhman wrote:
> What I'm trying to say - it 
> may be too late and you may lose data here. "preferred to prevent rather 
> than cure".

First of all, just to clarify, I do not have a goal of turning down your
patches. I just want to understand why this is the best design, and if
it is helpful to all Linux MTD users.

Modern flashes have strong ECC codes protecting against many bit-flips.
MTD even was modified to stop reporting about a single or few bit-flips,
because those happen too often and they are "harmless", and do not
require scrubbing. We have the threshold value in MTD for this, which is
configurable, of course.

Bit-flips develop slowly over time. If you get one more bit-flips, it is
not too late yet. You can mitigate the "too late" part by reading more
often of course.

You also may lower the bit-flip threshold when reading for scrubbing.

Could you try to "sell" your design in a way that it becomes clear why
it is better than just reading the entire flash periodically. Some hard
experimental data would be preferable.

The advantages of the "read all periodically" approach were:

1. Simple, no modifications needed
2. No need to write if the media is read-only, except when scrubbing
happens.
3. Should cover all the NAND effects, including the "radiation" one.

And disadvantages of your design were:

1. Need modifications, rather large, changes binary format, needs more
ram.
2. Does not cover all the NAND effects
3. Is not transparent to the user
4. If system time is incorrectly set, may cause a storm of I/O
(scrubbing) and may put the system to it's knees before user-space has a
chance to fix-up the system time.
5. Needs more writes on the R/O system (to maintain read counters)

Also, it is not clear if with your design we save energy. Reads a lot
less need less energy than writes and erases (to maintain read
counters). May you save energy comparing to the read-all periodically
approach. May be not.

Artem.
