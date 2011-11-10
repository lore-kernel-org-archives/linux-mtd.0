Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROclO-0007Dv-Pf
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2011 22:06:28 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>
 <87lirnkbap.fsf@free.fr> <4EBC504C.5000008@newsguy.com>
Date: Thu, 10 Nov 2011 23:06:12 +0100
In-Reply-To: <4EBC504C.5000008@newsguy.com> (Mike Dunn's message of "Thu, 10
 Nov 2011 14:29:32 -0800")
Message-ID: <87hb2bk4yz.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> Hi Robert, thanks for taking a look and commenting.
>
> On 11/10/2011 11:49 AM, Robert Jarzmik wrote:
>>> +	doc_nop(docptr);
>>> +	doc_nop(docptr);
>>> +	doc_nop(docptr);
>>> +	doc_nop(docptr);
>>> +	doc_nop(docptr);
>> Wouldn't that be better doc_nop(docptr, 5) ?
>
>
> No.  If it's a function that loops, you're inserting too much delay due to loop
> overhead (unless the compiler unrolls it, but you don't know that) and you may
> as well use some generic delay function and not bother with the nop register at
> all.  I wanted to use the precise delay observed in the TrueFFS code to (1)
> avoid too much delay for the sake of performance, (2) in case the timing is
> critical and too much delay would cause problems, or (3) "nop" really isn't what
> it says (i.e. no operation).  If there were a C preprocessor directive
> equivalent to the assembly .rept directive, I would use it.
As you wish, but :
 (a) The nops are here to add a minimum delay
 (b) The performance would not be an issue, and yes, the compiler could unroll
 the loop as the number is a compile time constant
 (c) nop operation is a delay, that's actually how I understand it
 (d) it does work well on docg3
 (e) and you can do as you wish, it's your driver :)

> No actually ecc.write_oob - which this function defines - is a nand interface
> function.  I never observed oob-only writes while reverse engineering (read
> oob-only  yes, but not write).  Can you write oob-only on the G3?  Even if it
> were possible, the nand_write utility wants to write the oob *before* the page
> data.  This hack allows that utility to work.  Maybe the comment should say "oob
> can't be written before the page data".
Yes, I can write OOB only, page only, or both.

And I have the same problem with nandwrite.
Now consider you have 2 nandwrites working in parallel :
   nandwrite1         nandwrite2
   write_oob(OOB1)
                      write_oob(OOB2)
   write_page(page1) ------------------------> OOB1 was overrun
                      write_page(page2)

That really really bothers me. It's not about your code, I think you have no
choice. My concern is rather about nandwrite utility. My point is that it could
have better used write_oob(page1, OOB1).
And in that respect, I think there's something broken in it.

>> If it's the same as on docg3, each bit is a marker for one block, and the
>> following formula could apply:
>>           is_good = bbt[block >> 3] & (1 << (block & 0x7));
>
>
> Thanks.  Do any of your devices have bad blocks marked in this table?  Do you
> know how to modify the table?
No, mine G3 has no such blocks.
And I feel we can't modify them. After all, they are in the OTP area. My guess
is that they are set up at chip creation as initial bad blocks (ie. factory bad
blocks).
I think there is a difference between bad block (factory bad blocks) and worn
out blocks (after erases, having more bitflips that ECC can fix).

Cheers.

-- 
Robert
