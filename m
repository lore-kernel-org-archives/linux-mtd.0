Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8UNe-00015L-7M
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 10:27:31 +0000
Message-ID: <4F63158F.1030405@linutronix.de>
Date: Fri, 16 Mar 2012 11:27:27 +0100
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubiattach oops/warning
References: <4F62076E.2080409@linutronix.de>
 <1331893462.3730.41.camel@sauron.fi.intel.com>
In-Reply-To: <1331893462.3730.41.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.03.2012 11:24, Artem Bityutskiy wrote:
> On Thu, 2012-03-15 at 16:14 +0100, Richard Weinberger wrote:
>> Hi!
>>
>> While attaching to a NAND chip with lot's of damaged PEBs
>> I UBI gone nuts.
>>
>> See the attached log file.
>> Looks like a bug in an error path.
>>
>> Kernel is 3.0.23 plus some board specific fixes.
>> I didn't touch any UBI stuff...
>
> Can you reproduce this? Did you preserve the flash image?
>

Not really. :(
I got this because the nand driver had a bug.
(That's why most PEBs contained bad data)

I'll try to reproduce it.

Thanks,
//richard

-- 
Phone: +49 7556 91 98 91; Fax.: +49 7556 91 98 86

Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
