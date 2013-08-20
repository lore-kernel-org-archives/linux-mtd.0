Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBaLg-0006JY-BB
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 01:03:05 +0000
Received: by mail-vc0-f173.google.com with SMTP id id13so3428918vcb.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 18:02:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130818142911.GA3615@gmail.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-7-git-send-email-b32955@freescale.com>
 <1376660759.2089.358.camel@sauron.fi.intel.com>
 <20130817032644.GA27332@gmail.com>
 <20130817181447.GC5034@norris.computersforpeace.net>
 <20130818142911.GA3615@gmail.com>
Date: Mon, 19 Aug 2013 18:02:42 -0700
Message-ID: <CAN8TOE_u1OVWJw7zzzNGNQAs60RBBL7AajZn=bwTW=eB-y_b0w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 18, 2013 at 7:29 AM, Huang Shijie <shijie8@gmail.com> wrote:
> On Sat, Aug 17, 2013 at 11:14:47AM -0700, Brian Norris wrote:
>> On Fri, Aug 16, 2013 at 11:26:47PM -0400, Huang Shijie wrote:
>> I took pieces of your message and rewrote it myself. Diff pasted below
>> (I edited ecc_strength to be less redundant and added a few details that
>> were worth mentioning). Let me know if you want to revise it, but I'll
>
> thanks a lot!
>
> I really appreciate it. I always feel embarrassed when i descibe
> something in English :(

No need to be embarrassed. By this last iteration, it was actually
quite correct; there were just a few issues of style and an extra bit
of redundancy, now that ecc_strength *and* ecc_step_size were
documented.

...
>> @@ -173,3 +172,16 @@ Description:
>>               This is generally applicable only to NAND flash devices with ECC
>>               capability.  It is ignored on devices lacking ECC capability;
>>               i.e., devices for which ecc_strength is zero.
>> +
>> +What:                /sys/class/mtd/mtdX/ecc_step_size
>> +Date:                May 2013
>> +KernelVersion:       3.10
>> +Contact:     linux-mtd@lists.infradead.org
>> +Description:
>> +             The size of a single region covered by ECC, known as the ECC
>> +             step.  Devices may have several equally sized ECC steps within
>> +             each writesize region.  The step size counts only the data area,
>> +             not the spare area.
>
> Maybe this sentence is not accurate enough.
>
> As far as i know, when the gpmi does the hardware ECC, the last ECC step
> will use parts of the spare area. Just like:
>
> ----------------------------------------------------------------------------------
>          *    |                          P                            |
>          *    |<----------------------------------------------------->|
>          *    |                                                       |
>          *    |                                        (Block Mark)   |
>          *    |                      P'                      |      | |     |
>          *    |<-------------------------------------------->|  D   | |  O' |
>          *    |                                              |<---->| |<--->|
>          *    V                                              V      V V     V
>          *    +---+----------+-+----------+-+----------+-+----------+-+-----+
>          *    | M |   data   |E|   data   |E|   data   |E|   data   |E|     |
>          *    +---+----------+-+----------+-+----------+-+----------+-+-----+
>          *                                                   ^              ^
>          *                                                   |      O       |
>          *                                                   |<------------>|
>          *
>          *      P : the page size for BCH module.
>          *      E : The ECC strength.
>          *      G : the length of Galois Field.
>          *      N : The chunk count of per page.
>          *      M : the metasize of per page.
>          *      C : the ecc chunk size, aka the "data" above.
>          *      P': the nand chip's page size.
>          *      O : the nand chip's oob size.
>          *      O': the free oob.
> ----------------------------------------------------------------------------------
>  In this diagram, the "O" stands for the spare area, and the last ECC
>  step will use part of the spare area, the "Block Mark" is the boundary
>  for the page and OOB.

Apparently I totally ignored the possibility that ECC layouts place
their metadata in the data area (the 'E' regions above) not just in
the spare area ('O'). Out of curiosity, is this very common?

The point I really was trying to get to was that the "step" is only
measuring the division of the data area, not of any additional
metadata or spare area. So in your case, I still expect that
ecc_step_size * number-of-steps = writesize
So the step size is still counting "only the data" (not "data + E"),
but its corresponding data is not necessarily placed entirely in the
data area.

I think your objection is correct, and I just rebased and dropped the
inaccurate sentence.

Thanks,
Brian
