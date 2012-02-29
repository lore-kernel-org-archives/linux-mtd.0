Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2htP-0007ZX-2l
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 11:40:24 +0000
Message-ID: <4F4E0E9D.7090002@linutronix.de>
Date: Wed, 29 Feb 2012 12:40:13 +0100
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1330515322.3545.99.camel@sauron.fi.intel.com>
In-Reply-To: <1330515322.3545.99.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.02.2012 12:35, schrieb Artem Bityutskiy:
> On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
>> The following patch set implements checkpointing support for
>> UBI. Checkpointing is an optional feature which stores the physical to
>> logical eraseblock relations in a checkpointing superblock to reduce
>> the initialization time of UBI. The current init time of UBI is
>> proportional to the number of physical erase blocks on the FLASH
>> device. With checkpointing enabled the scan time is limited to a fixed
>> number of blocks.
> 
> Notice, your patch-set has huge amount of checkpatch.pl complaints -
> please fix them. This will also be consistent with the overall UBI
> coding style where I honored checkpatch.pl limitations like identation
> style and 80 chars per line.
> 

All checkpatch.pl complaints will be fixed.
But first we have to discuss and address real problems.

By sending the second iteration of the patch-set I'll make checkpatch.pl
happy. :-)

Thanks,
//richard

-- 
Phone: +49 7556 91 98 91; Fax.: +49 7556 91 98 86

Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
