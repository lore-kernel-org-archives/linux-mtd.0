Received: from henry.synapsedev.com ([66.147.194.230] helo=henry.synapse.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDLz8-00049p-BX
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 16:44:26 +0000
Message-ID: <494A7DE8.6010404@synapse.com>
Date: Thu, 18 Dec 2008 08:44:24 -0800
From: Marc Oscar Singer <elf@synapse.com>
MIME-Version: 1.0
To: Chris Moore <moore@free.fr>
Subject: Re: [PATCH] Revised the detection for broken boot-region detection.
	MACRONIX parts have a custom implementation of the
	fixup.	AMD	implemtation
	restore to original version that has worked fine since	2001.
References: <20081216205650.GA13729@zealous.synapse.com>	<49497440.7050204@free.fr>
	<49499FDA.4010000@synapse.com> <4949C730.9050906@free.fr>
In-Reply-To: <4949C730.9050906@free.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IMHO, it would be better to leave the AMD fixup code as it was.  It 
works fine for the AMD parts.  My comment about
changing what was already working has to do with the fact that editing 
the AMD fixup code is modifying working code.
The number of bytes saved because we don't have to check bit 7 twice in 
the default is nominal.  The fixup table
was changed to call the same function for two different manufacturers, 
so we had to add an explicit check for the manufacturer
in the fixup routine.  Why bother?  The AMD fixup is stable and 
working.  As far as I know, AMD isn't making more NOR flash,
so we are in a good position for *not* breaking support for AMD parts.

So, instead, lets write a new fixup for the Macronix part.  Yes, we have 
to duplicate the bit 7 test, but the routine, overall, can
be a straightforward switch on the exceptional IDs with the default 
still checking bit 7.

So, the principles are

 1) leave working code alone.
 2) use existing mechanisms as they were intended (i.e. the fixup table 
that selects by manufacturer)

If you agree, then you should be able to make your changes on top of the 
patch that I already submitted.

Cheers.

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
