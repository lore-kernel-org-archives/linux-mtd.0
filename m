Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19ymeF-00055n-Ef
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 07:15:43 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HL800AJSS0AHE@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 15 Sep 2003 08:14:34 +0200 (MEST)
Date: Mon, 15 Sep 2003 08:09:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Pine.LNX.4.44.0309120801130.27968-100000@dashnine.joshuawise.com>
To: joshua@dashnine.joshuawise.com, linux-mtd@lists.infradead.org
Message-id: <200309150809.17666.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <Pine.LNX.4.44.0309120801130.27968-100000@dashnine.joshuawise.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: h1910 NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 12 September 2003 14:06, joshua@dashnine.joshuawise.com wrote:
> NAND flash seems to work on the iPAQ h1910. Things of note:
>
> * Not certain what type of ECC we should be using. Had to comment out the
> WARNING: Not using ECC is not recommended! message (or something like
> that) so that my dmesg wasn't flooded with those when I tried to read from
> flash.

Use Software-ECC.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
