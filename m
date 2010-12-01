Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PNmP0-0006wt-Tq
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 13:07:19 +0000
Message-ID: <4CF64869.4020902@aimvalley.nl>
Date: Wed, 01 Dec 2010 14:06:49 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
References: <20101129195014.19224240@wker>	<4CF4D4CA.8040906@aimvalley.nl>	<20101130163541.44c48a94@wker>	<AANLkTikEDQyNttTcKgHLwhR53sYSFbtVK-oy2S3END46@mail.gmail.com>	<20101201105518.206635e6@wker>
	<AANLkTikci0e2jaHCarA9HG86b_C-1UUcT_PMy-Q_mBrP@mail.gmail.com>
In-Reply-To: <AANLkTikci0e2jaHCarA9HG86b_C-1UUcT_PMy-Q_mBrP@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Eric_Holmberg@trimble.com, Anatolij Gustschin <agust@denx.de>,
	linux-mtd@lists.infradead.org, boaz ben david <boazbd@gmail.com>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, Dec 1, 2010 at 11:55 AM, Anatolij Gustschin <agust@denx.de> wrote:
> 
>> On Tue, 30 Nov 2010 20:18:56 +0200
>> boaz ben david <boazbd@gmail.com> wrote:
>>
>>> Sorry to bump the thread but I'm having issues which I think are similiar
>>> with MLC NAND flash.
>>> Will reducing the write buffer help here too?
>> I don't know. Your issues may look similar but without
>> knowing the details it is not possible to say. Most
>> probably no. I reduced the write buffer size in the CFI
>> driver. The issues we observed seem to be NOR flash
>> specific.
>>
> 
> Hi,
> 
> let me try to explain this. Both UBI and UBIFS have a notion of min_io_size.
> It is
> NAND page size in case of NAND. In case of NOR, UBI reports min_io_size as
> 1.
> So UBI assumes NOR flash writes one byte at a time.
> 
> Since UBIFS align all flash nodes to 8 bytes, UBIFS assumes min_io_size for
> NOR is 8 bytes. See fs/ubifs/super.c:
> 
>         /*
>          * UBIFS aligns all node to 8-byte boundary, so to make function in
>          * io.c simpler, assume minimum I/O unit size to be 8 bytes if it is
>          * less than 8.
>          */
>         if (c->min_io_size < 8) {
>                 c->min_io_size = 8;
>                 c->min_io_shift = 3;
>         }
> 
> Then the UBIFS scanning and recovery code is trying to be very picky about
> how
> nodes are corrupted. We wanted to distinguish between corruptions caused by
> power cuts and corruptions caused by something else. UBIFS policy is that it
> should
> gracefully recover from all corruptions cause by power cuts, and it does not
> try to
> recover from other types of corruptions.
> 
> Thus, in journal recovery code, if we see that we have good node, good node,
> good
> node, then some trash, we analyse this trash. We check that the amount of
> trash is
> not longer than maximum UBIFS node size aligned up to min_io_size, and then
> after
> this go all 0xFFs. And some other checks. See no_more_nodes() function.
> 
> In your case what happens is that we look that the amount of corrupted data
> is longer
> than common header size (all nodes start with the common header) aligned up
> to
> the min_io_size. And since we assume data is written min_io_size bytes at a
> time
> (8 bytes, next 8 bytes, etc in your case), we assume that the common header
> was
> successfully written, and we check it. But it is corrupted in your case,
> simply because
> you write 64 bytes at a time, no 8. And we reject the flash.
> 
> So all you need to do is to teach UBIFS to look at CFI write buffer size,
> and make
> min_io_size to be the same. Then it should work fine.
> 
> Try hacking UBIFS and make min_io_size to be 64. If it works, you can
> provide a
> nice solution - add corresponding field to mtd_info structure and teach UBI
> to look
> at it.
> 


A while ago I hacked mtd/ubi to hold CFI write buffer size in oobsize
in case of NOR flash. We have NOR devices with 64 (SPANSION) and 1024
(Numonyx™ Axcell™ M29EW) bytes write buffer size.
I never submitted it to this list because I considered it a hack
(and was rather busy).

I'm even more busy now, but I can cook up the patches and send them if
you want (hopefully I have time this evening or tomorrow).

It's only for testing (private kernel) since I assume it's not acceptable
to abuse oobsize this way (for NOR flash) ?

---
N. van Bolhuis.
