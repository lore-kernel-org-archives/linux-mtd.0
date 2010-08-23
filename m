Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnWGG-0001fw-0g
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 12:36:24 +0000
Received: by fxm12 with SMTP id 12so3530327fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 05:36:23 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
	<AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 15:34:51 +0300
Message-ID: <1282566891.24044.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-16 at 13:27 +0200, Arno Steffen wrote:
> Sorry for delay, have been out of office.
> Haven't found neither /etc/udev nor /lib/udev on my embedded system.
> udev is not mention in dmesg | grep udev
> But after creating /etc/udev/rules/10-udev.rules I could see this in
>  cat /dev/udev/rules.d/10-udev.rules
> As I don't have any idea what rule I have to write in I left it blank.
> So no success with this method

OK, anyway, I believe this is not related to UBI. I gave you several
other ideas, cannot help more than that.

> ubimkvol /dev/ubi0 -N test -m
> Set volume size to 9805824UBI error: ubi_io_write: error -5 while
> writing 512 bytes to PEB 81:512, written 0 bytes
> 
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB
> 2147479551:0, PEB 81

This is independent problem, I think. Your driver returns EIO when UBI
writes to the flash. Looks like you have issues in the driver or HW
level.

Did you run mtd tests? Please run and validate your flash. Take a look
here, for reference:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
