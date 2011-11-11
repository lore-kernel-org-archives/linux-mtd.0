Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ROot3-0006xH-FE
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 11:03:13 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v3] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
References: <1320441908-9684-1-git-send-email-mikedunn@newsguy.com>
 <87lirnkbap.fsf@free.fr> <4EBC504C.5000008@newsguy.com>
 <87hb2bk4yz.fsf@free.fr> <4EBC9716.3090005@newsguy.com>
Date: Fri, 11 Nov 2011 12:02:56 +0100
In-Reply-To: <4EBC9716.3090005@newsguy.com> (Mike Dunn's message of "Thu, 10
 Nov 2011 19:31:34 -0800")
Message-ID: <87d3cykjkv.fsf@free.fr>
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

> On 11/10/2011 02:06 PM, Robert Jarzmik wrote:
> Interesting.  We took separate paths in this reverse engineering effort.  I
> observed activity during operation of the native OS using TrueFFS library, and
> you engaged more in trial-and-error, guided by inspection of disassembled code
> (if I'm not mistaken).  You may have made some more discoveries beyond my
> observation.  I have to inspect your code.  I know that reading oob-only was a
> different "sequence" than a normal page read.  Never saw oob-only write.
Ah, that seems different from docg3.
In docg3, look at doc_read_page_prepare(), and pay attention to the "offset"
parameter of the function. This one allows you to "seek" in the page directly to
the OOB area.

For the write, look at doc_write_seek(), and pay attention to the "ofs"
parameter of the function. And the write length (ie. the number of bytes written
the IO space) _can_ be 16, 512, or even 528).

> Ah, yes.  Never considered this.  If I understand you correctly, you are
> pointing out the fact that my hack for deferring oob write until after the page
> data is written breaks when multiple nandwrite processes are running.  I haven't
> tested with access from multiple processes yet.  But yes, the hack assumes only
> one process is accessing the device.
Alas, I did exactly as you did, driven by nandwrite :)

>  Even if you can write oob-only, you can't subsequently
> write the page data (with or without writing its ecc bytes), can you?
I don't know. I tried to write the OOB only, and the page only, or both, but in
1 page_write call. I never tried to do it in 2 page_program cycles ... I'll try
to make one write (without the oob, in raw mode), and then one write with the
oob to check.

>> No, mine G3 has no such blocks.
> Then how do you know it's one bit per block?
When I was retro-engineering the SAFTL partition scheme, I found out that when
UBoot (proprietary mioa701 bootloader) reads a binary partition (in my case
MSIPL), it always loads page4 of bi-block(0,1), and then scans from block (5,6)
onward for the first block where :
  page[block >> 3] & (1 << (block & 0x7)) == 1
Then, if the first block was 10 for example, the SAFTL header will be looked in
blocks (10..2048), and not (5..2048).

Now, in block(5,6) I have the SAFTL header (I know because of the CNAND tag),
you can check on my wiki.

So the only logical conclusion for skipping these first blocks is that they
actually are bad blocks.

> You're probably right.  I had no ambitions of trying to update the table
> anyway.  Only to read it and update the bbt table in RAM accordingly,
Yes, that's a good review comment you could do on docg3 driver which behaves
... poorly in this area :)

Cheers.

-- 
Robert
