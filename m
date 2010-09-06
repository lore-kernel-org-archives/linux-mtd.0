Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsXqt-0000G1-Jx
	for linux-mtd@lists.infradead.org; Mon, 06 Sep 2010 09:19:00 +0000
Received: by fxm12 with SMTP id 12so3038842fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Sep 2010 02:18:58 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1283367468.2209.33.camel@brekeke>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
	<AANLkTinHmSpucwL4nKc5RNaBVc6fdt7bT_hTd2-fkQhB@mail.gmail.com>
	<1283367468.2209.33.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Sep 2010 12:17:36 +0300
Message-ID: <1283764656.11066.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: JamesLNute@eaton.com, linux-mtd@lists.infradead.org,
	Adrian.Hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 21:57 +0300, Artem Bityutskiy wrote:
> > Please let me know if there are any other tests you'd like run on this
> > device.  Otherwise, we'll probably try booting 2.6.35 and see what
> > happens.
> 
> I need to take some time and carefully look at this. And think. Please,
> make a copy of the contents of your flash, if you can. 
> 
> From your side what would be helpful is if you tried to figure out how
> to reproduce this. Since I do not have your HW I cannot reproduce this,
> so the only thing I can do is to ask you to reproduce the problem with
> various debugging patches.

Matthew, I've sent a series of UBI patches which may help us to find out
the root cause of your issues.

The other idea which would definitely help is to create a debugging
patch which will track all erasures of PEBs and store them somewhere. I
do not know which tracing debugging tools you have, if you have some
fast tracing you can just send this info via your tracing interface. But
if you don't, you can use other flash or another partition on your flash
and store the info.

Here is my thinking:

UBIFS index points to an unmapped LEB. There are 2 possibilities: either
the index is incorrect or someone - UBI or UBIFS mistakenly unmapped an
needed LEB.

I personally think this is most probably the latter.

So we need to gather information about all unmap operations:

1. which LEB and which PEB is unmapped. The best place to get this info
is the 'do_sync_erase()' function. But it does not lave LEB. But we need
to add an 'int lnum' parameter there, and amend the callers as well. It
is some work, but should not be too difficult.

2. Then we need to know who unmapped the LEB - we need the stackdump.
Normally, we use 'dump_stack()' function to print stack dump - but it
prints to the log buffer. So we need a function which gives us an array
of addresses which we then can save and later transform to symbols. Or
we need a func which gives us a string containing an array of addresses.

We probably need to implement it. But I think kmemleak is doing
something like that - we can look there.

But also, make sure no-one in UBI use mtd->erase directly, just in case.
I think all erases should go via 'do_sync_erase()'

3. Most erasures are done in the background thread, so the stackdump
will point to the background thread, which is not informative at all.
This means we should also print PEB/LEB/stackdump in 'schedule_erase()'
to track all places where the erasure is initiated.

So, for each PEB erase / LEB unmap we store 1, 2 and 3 somewhere. When
we hit the UBIFS bug, we can see how the LEB was unmapped and how the
PEB was erased - this should give use idea what happened.

Do you think you can do something like this? I do not think I have time
in near future for this. What do you think?

But of course, if you learn how to reproduce this - this would be great.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
