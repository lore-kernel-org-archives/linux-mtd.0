Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PASVq-0001g5-NV
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 19:15:19 +0000
Received: by vws2 with SMTP id 2so80281vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 12:15:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style,
	signed-ness, printing fixups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
	<1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 22:15:12 +0300
Message-ID: <1288034112.1865.7.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 00:19 -0700, Brian Norris wrote:
> There were some signed/unsigned integer comparisons. Their types were
> changed for safety. Also, "strtol" was improperly used for unsigned
> data types.
> 
> Nanddump's pretty print options needed a slight reformat to prepare for
> printing offsets that are more than 32 bits (8 hex characters) wide.
> This prevents overlap of output and ensures that at least one space is
> printed between hex and ascii printouts. Perhaps this could use some
> better alignment in the future.
> 
> Other fixes:
> * Corrected several simple spacing issues
> * Changed indentation of some global variable declarations in
>   order to prepare for the next patch, which makes those
>   declarations longer
> * Used macro for PRETTY_ROW_SIZE instead of constant 16
> * Reformatted, edited a multi-line comment
> * Removed some unnecessary casts
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  nanddump.c  |   55 +++++++++++++++++++++++++++----------------------------
>  nandwrite.c |   28 ++++++++++++++--------------
>  2 files changed, 41 insertions(+), 42 deletions(-)

Mike is right, it is much better to separate functional and cleanup
changes, even split different clean-up changes into several patches.
Maintaining this stuff and reviewing patches takes time, and splitting
helps a lot. Let's push this patch but please, try to splint patches on
more smaller pieces. Yes, it'll be more work for you, but less for me.
But when submitters take more burden and maintainer less - the system
scales better. Take into account that I'm doing this stuff just because
I like MTD and do not like see people's patches lost, so little help in
form of perfectly split micro-patches is appreciated.

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
