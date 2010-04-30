Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7qVG-0002M7-5g
	for linux-mtd@lists.infradead.org; Fri, 30 Apr 2010 13:43:38 +0000
Subject: Re: [PATCH] mtd/ubi: recognize empty flash with errors as empty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100429192333.GA12067@Chamillionaire.breakpoint.cc>
References: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
	<1272108241.11751.1635.camel@localhost.localdomain>
	<20100425210938.GA15192@Chamillionaire.breakpoint.cc>
	<1272257990.17386.2.camel@localhost>
	<20100426082855.GA18811@Chamillionaire.breakpoint.cc>
	<1272534149.7750.85.camel@localhost>
	<20100429192333.GA12067@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Apr 2010 16:37:58 +0300
Message-ID: <1272634678.31081.104.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-29 at 21:23 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-04-29 12:42:29 [+0300]:
> 
> >> So I think the latter case is now broken. In fact I just copied some
> >> random things into my mtd partition and after attach & mkvol they were
> >> gone with no error.
> >
> >You mean UBI just attached your device? What would you expect it to do
> >when it sees that part of eraseblocks contain corrupted headers? ATM, it
> >just formats those eraseblocks. What would be your expectation?
> 
> Before the patch attaching a bootloader[0] partition would not work. Now
> it does.
> 
> >> So in case we want to support something other than UBI then we should
> >> probably add another error code in order to distinguish between read
> >> error and not a vald EC / VID header.
> >
> >If you feed UBI flash with no valid UBI headers, it will be refused, I
> >think.
> 
> It does not, not anymore. si->is_empty is only set if we find a valid EC
> header. Unknown data results now in UBI_IO_BAD_{EC|VID}_HDR is excluded
> from si->is_empty. Duh.
> 
> >I actually do not really see what is the use-case or scenario you want
> >UBI to handle better.
> 
> The first case was:
> - empty flash
> - a bad block which is not marked as such.
> 
> This is now fixed. However, not empty flash with non-UBI data will be
> now UBInized. Earlier, it was refused, you had to use flash_eraseall or
> ubiformat first.
> 
> In my optinion accidently attaching is not a problem in the field. It is
> only a problem if you are attaching by hand and you mix up the
> partitions.
> 
> The patch attached should fix this and flash with something not UBI
> will be refused again. It is compiled tested, don't have hw here right
> now.
> 
> [0] assumed that the bootloader does not start with 0xff within the
>     first few bytes.

Yeah, I see. I am not sure I like your patch because the process_eb()
function becomes even more twisted and unreadable. I'll think if we can
do this another way.

Basically, what I am thinking about is to stop playing with si->is_empty
in process_eb. Instead, make process_eb just account which blocks were
found. And at the end, when all blocks are scanned, look at the
situation, what were the blocks, and decide whether to go for formatting
or not.

I'll send you an e-mail later.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
