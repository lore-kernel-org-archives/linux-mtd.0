Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjCQY-0000v4-Re
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 12:23:37 +0100
Date: Sat, 20 Oct 2007 12:42:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: mattjreimer@gmail.com
Subject: Re: [PATCH] MTD: treat any negative return value from correct() as an
	error
Message-ID: <20071020104226.GD32465@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 October 2007 14:33:23 -0700, mattjreimer@gmail.com wrote:
> 
> Treat any negative return value from a NAND driver's correct() function
> as a failure, rather than just -1. Some drivers (e.g. diskonchip) can
> return error values such as -EIO, which ended up being treated as the
> number of bits corrected, which in turn resulted in nand_do_read_ops()
> returning -EUCLEAN rather than -EBADMSG.

What an interesting patch.

NACK on patch description.  Several things are wrong with this:
o -EIO shouldn't become -EBADMSG any more than -EUCLEAN.  It should
  remain -EIO and nothing else.
o I cannot see how diskonchip can return -EIO.  Only -ERANGE.
o rtc_from4_correct_data() and doc200x_correct_data() will basically
  pass on -ERANGE from decode_rs8() or decode_rs16(), respectively.
  Afaict decode_rsXX() should just BUG() instead.

However I like the patch itself, because it allows one to rename those
magic -1 return values to self-documenting -EBADMSG.

Jörn

-- 
It is the mark of an educated mind to be able to entertain a thought
without accepting it.
-- Aristotle
