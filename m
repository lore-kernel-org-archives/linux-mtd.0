Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROgv1-0002HG-KO
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 02:32:40 +0000
Message-ID: <4EBC9716.3090005@newsguy.com>
Date: Thu, 10 Nov 2011 19:31:34 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>	<87lirnkbap.fsf@free.fr>
 <4EBC504C.5000008@newsguy.com> <87hb2bk4yz.fsf@free.fr>
In-Reply-To: <87hb2bk4yz.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
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

On 11/10/2011 02:06 PM, Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
>
>> Hi Robert, thanks for taking a look and commenting.
>>
>> On 11/10/2011 11:49 AM, Robert Jarzmik wrote:
>>>> +	doc_nop(docptr);
>>>> +	doc_nop(docptr);
>>>> +	doc_nop(docptr);
>>>> +	doc_nop(docptr);
>>>> +	doc_nop(docptr);
>>> Wouldn't that be better doc_nop(docptr, 5) ?
>>
>> No.  If it's a function that loops, you're inserting too much delay due to loop
>> overhead (unless the compiler unrolls it, but you don't know that) and you may
>> as well use some generic delay function and not bother with the nop register at
>> all.  I wanted to use the precise delay observed in the TrueFFS code to (1)
>> avoid too much delay for the sake of performance, (2) in case the timing is
>> critical and too much delay would cause problems, or (3) "nop" really isn't what
>> it says (i.e. no operation).  If there were a C preprocessor directive
>> equivalent to the assembly .rept directive, I would use it.
> As you wish, but :
>  (a) The nops are here to add a minimum delay
>  (b) The performance would not be an issue, and yes, the compiler could unroll
>  the loop as the number is a compile time constant
>  (c) nop operation is a delay, that's actually how I understand it
>  (d) it does work well on docg3
>  (e) and you can do as you wish, it's your driver :)


Then it's probably just a delay, as advertised.  I wanted to be paranoid and
duplicate exactly what I was observing during PalmOS operation.  In that case,
why not dispense with the nop reg altogether and use some short generic delay? 
Anyway, minor issue.


>> No actually ecc.write_oob - which this function defines - is a nand interface
>> function.  I never observed oob-only writes while reverse engineering (read
>> oob-only  yes, but not write).  Can you write oob-only on the G3?  Even if it
>> were possible, the nand_write utility wants to write the oob *before* the page
>> data.  This hack allows that utility to work.  Maybe the comment should say "oob
>> can't be written before the page data".
> Yes, I can write OOB only, page only, or both.


Interesting.  We took separate paths in this reverse engineering effort.  I
observed activity during operation of the native OS using TrueFFS library, and
you engaged more in trial-and-error, guided by inspection of disassembled code
(if I'm not mistaken).  You may have made some more discoveries beyond my
observation.  I have to inspect your code.  I know that reading oob-only was a
different "sequence" than a normal page read.  Never saw oob-only write.


> And I have the same problem with nandwrite.

> Now consider you have 2 nandwrites working in parallel :
>    nandwrite1         nandwrite2
>    write_oob(OOB1)
>                       write_oob(OOB2)
>    write_page(page1) ------------------------> OOB1 was overrun
>                       write_page(page2)
>
> That really really bothers me. It's not about your code, I think you have no
> choice. My concern is rather about nandwrite utility. My point is that it could
> have better used write_oob(page1, OOB1).
> And in that respect, I think there's something broken in it.


Ah, yes.  Never considered this.  If I understand you correctly, you are
pointing out the fact that my hack for deferring oob write until after the page
data is written breaks when multiple nandwrite processes are running.  I haven't
tested with access from multiple processes yet.  But yes, the hack assumes only
one process is accessing the device.

Another problem with my hack is that the oob-only write is quietly ignored if it
is not immediately followed by a write of the data on the same page.  One of the
mtd tests in the kernel tests oob-only writes, and it fails miserably because
they are all ignored.  Should probably take this hack out, and fix nand_write,
or just use a simplified, fixed version.  Yes, mtd_write should not assume oob
can be written first.  Even if you can write oob-only, you can't subsequently
write the page data (with or without writing its ecc bytes), can you?


>>> If it's the same as on docg3, each bit is a marker for one block, and the
>>> following formula could apply:
>>>           is_good = bbt[block >> 3] & (1 << (block & 0x7));
>>
>> Thanks.  Do any of your devices have bad blocks marked in this table?  Do you
>> know how to modify the table?
> No, mine G3 has no such blocks.


Then how do you know it's one bit per block?


> And I feel we can't modify them. After all, they are in the OTP area. My guess
> is that they are set up at chip creation as initial bad blocks (ie. factory bad
> blocks).
> I think there is a difference between bad block (factory bad blocks) and worn
> out blocks (after erases, having more bitflips that ECC can fix).


You're probably right.  I had no ambitions of trying to update the table
anyway.  Only to read it and update the bbt table in RAM accordingly,

Thanks,
Mike
