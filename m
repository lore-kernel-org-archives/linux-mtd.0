Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFlQe-0005D1-Pb
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 15:50:33 +0000
Subject: Re: UBIFS: recovery of master node
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <55A7B004.2090705@dave-tech.it>
 <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55A7D2B1.1040203@dave-tech.it>
Date: Thu, 16 Jul 2015 17:50:09 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Richard,

Il 16/07/2015 17:29, Richard Weinberger ha scritto:
> Andrea,
>
> On Thu, Jul 16, 2015 at 3:22 PM, Andrea Scian <rnd4@dave-tech.it> wrote:
>> Dear all,
>>
>> I'm trying to understand how UBIFS recovers master node from a corrupted
>> flash (e.g. after power cut during one of the two of master node or due
>> flash corruption itself).
>>
>> IIUC (please correct me if I'm wrong) UBIFS store two copies of master node,
>> in LEB1 and LEB2 (LEB0 is reserved for superblock), ref.
>> http://www.linux-mtd.infradead.org/doc/ubifs_whitepaper.pdf.
>> Inside ubifs_recover_master_node() try to read first LEB1 and, only in case
>> of get_master_node() does NOT return an error, it tries to read LEB2 (ref.
>> fs/ubifs/recovery.c)
>> I'm working with a 3.10 class kernel, but I've found nearly the same code on
>> mainline.
>>
>> On my test-bed, the recovery fails because get_master_node(LEB1) fails
>> (exactly here
>> http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/fs/ubifs/recovery.c#n184)
>> I'm hacking around the code to see what's really happening under the wood,
>> but I'm a UBIFS newbie I would like to ask:
>>
>> 1) why if get_master_node(LEB1) fails we don't ALWAYS look at
>> get_master_node(LEB2)? I think we should try to read LEB2 even if something
>> really bad happens to LEB1.. or not?
> AFAIK the idea was that only upon plausible errors the second LEB will be used.
> If reading LEB1 fails due to an internal MTD error UBIFS gives up.

Understood, I think you already told me that UBI/UBIFS assume that empty 
flash always stay empty

However, to me it seems this is a heavy limitation, if we have another 
master node, why don't we always try to use it?
Again, I'm just trying to understand the recovery code and try to 
improve it (if possible ;-) )

>> 2) if I bypass the get_master_node(LEB1) return value, I found that
>> get_master_node(LEB2) fails too, for the same reason of LEB1 (see above).
>> IIUC we check about empty space because master node pages get written
>> without being erased every time, but I'm still studying this topic ;-)
>>
>> If I bypass that check too, I can mount UBIFS and everything inside the FS
>> is there but, of course, I'm sure I'm doing something that may be wrong..
>>
>> WDYT?
> So, you're facing bitflips on empty space?

Yes, and this seems the same behavior I saw previously regarding factory 
bad block marker (ref 
http://lists.infradead.org/pipermail/linux-mtd/2015-March/058151.html)

> Is this MLC NAND?

Yes, I'm doing some heavy stress test on it

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
