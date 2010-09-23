Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyjwn-0006uU-ND
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:26:42 +0000
Received: by fxm4 with SMTP id 4so1231895fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 04:26:40 -0700 (PDT)
Subject: Re: flash_erase vs flash_eraseall
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTi=efR8LkMr_FVxV7V6TzZ2yd1-=2ph5vsaNz41U@mail.gmail.com>
References: <AANLkTi=efR8LkMr_FVxV7V6TzZ2yd1-=2ph5vsaNz41U@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 14:24:57 +0300
Message-ID: <1285241097.29268.80.camel@localhost>
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

On Wed, 2010-09-22 at 00:35 -0400, Mike Frysinger wrote:
> while looking to extend the erase ioctl abi to take a flags argument,
> i needed updated utils to test my work.  reviewing the flash_erase and
> flash_eraseall code bases makes me wonder why there are even two tools
> in the first place.  "eraseall" sounds like it should simply be an
> option to the "erase" util.  so why does it warrant its own code base
> for a mere option ?

I have no idea, this is historical.

> 
> also in looking at these utils, flash_erase does not support the
> extended 64bit api as it is doing ioctls directly nor does it use
> getopt.  flash_eraseall however is using the common libmtd api (so it
> gets the extend api support for free), and it is cleanly using getopt
> cleanly.  which leads to a simple conclusion from my side ...
> 
> let's punt the current flash_erase code, rename flash_eraseall to
> flash_erase, and then extend its options to support the minor
> functionality of flash_erase.  doesnt look like it'll be hard at all
> to do this.  but before i undertake the task, i want to make sure the
> idea isnt simply going to be rejected due to some concern about
> retaining backwards compatibility.
> 
> running `flash_erase /dev/mtd#` (no arguments) will make it erase the
> first block.  this seems kind of useless to me.
> 
> so i'd make the arguments:
> flash_erase [options] <mtd> <start> [count]
> Options:
>   -N, --erasebad
>   -j, --jffs2
>   -u, --unlock
>   -q, --quiet
>         --silent
> 
> for the "all" functionality, we can have a value of "-1" or "0" for
> the count mean "all", or make people type "all".
> -mike

I'm perfectly fine with getting rid of one of these, this would be a
very good clean-up. May be additionally we could create a
flashe_eraseall shell script which will just run flash_erase <mtd> 0 -1
<other flags>.

But also, it need a careful look to make sure all flash_eraseall
functionality is also in flash_erase.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
