Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHlIf-0002gL-Vz
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 12:49:13 -0400
Message-ID: <43303D59.1040805@yandex.ru>
Date: Tue, 20 Sep 2005 20:48:25 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Anders Grafstrom <grfstrm@users.sourceforge.net>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>
	<43303409.5030406@users.sourceforge.net>
In-Reply-To: <43303409.5030406@users.sourceforge.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Anders Grafstrom wrote:
> Artem Bityutskiy wrote:
>> Index: erase.c
>> ===================================================================
>> RCS file: /home/cvs/mtd/fs/jffs2/erase.c,v
>> retrieving revision 1.84
>> retrieving revision 1.85
>> diff -u -r1.84 -r1.85
>> --- erase.c    20 Sep 2005 14:27:34 -0000    1.84
>> +++ erase.c    20 Sep 2005 14:53:15 -0000    1.85
>> @@ -337,7 +337,6 @@
>>              if (*datum + 1) {
>>                  *bad_offset += i;
>>                  printk(KERN_WARNING "Newly-erased block contained 
>> word 0x%lx at offset 0x%08x\n", *datum, *bad_offset);
>> -                ret = -EIO;
>>                  goto fail;
>>              }
>>          }
> 
> 
> May I ask why you rolled back this change?
No problems :-)

> I have a problem, that I'm trying to solve, with blocks that are not 
> erased despite a "successful" return from c->mtd->erase(). The result of 
> this is a very broken filesystem when the blocks are reused. It seems to 
> me that the above rolled back change would prevent the filesystem from 
> being broken in this situation(?).

Let's analyse the situation.

JFFS2 issues the erase command, MTD returns OK, but the eraseblock does 
not contain all 0xFFs. Is this JFFS2's fault? No. this is driver's 
fault. The driver must not return success in this case. It must return 
an error.

And the check in JFFS2 that the eraseblock contains all FFs is *wrong*. 
That's not JFFS2's business at all. That's MTD's business. MTD 
guarantees that it either erases the eraseblock or returns error. My 
oppinion is that this check must go to MTD. Perhaps, you may embrace it 
by #ifdefs - this is the implementation detal.

So, JFFS2 does what it is not supposed to do at all. It slows down 
things by this. I wanted to remove the check, but dwmw2 loudly 
complained. He wants to be as reliable as it is possible.

Ok, now about the rollback. If we return -EIO, JFFS2 will mark the block 
as bad. Imagine your driver is broken, and the block is not actually 
bad. That's just driver. JFFS2 will mark nearly all eraseblocks as bad. 
What will you do next? In case of NAND, this assumes you're in trouble 
unless you have a list of real bad blocks.

So, this is why I rolled back. Probably the right approach will be to 
add such blocks to the JFFS2 in-RAM bad block list but not mark them as 
bad physically. But this is a distinct activity. I didn't explore this.

That "fix" slipped there accidentally. I didn't test it. So I removed 
it. If you are energetic enough, work this problem out please :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
