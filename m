Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ja15-0007EF-Ll
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 08:44:27 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HJ3002KM452KN@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 04 Aug 2003 09:43:51 +0200 (MEST)
Date: Mon, 04 Aug 2003 10:40:11 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <m3ispeb4cp.fsf@bfnet.com>
To: David Wuertele <dave-gnus@bfnet.com>, linux-mtd@lists.infradead.org
Message-id: <200308041040.11475.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <m3ispeb4cp.fsf@bfnet.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: zlib patch doesn't take?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 04 August 2003 03:26, David Wuertele wrote:
> I'm trying to patch my already heavily-patched linux-2.4.18 to use the
> mtd snapshot from what looks like May.  After running
>
>   ./patchin.sh -j -c /home/build/linux
>
> and starting a kernel compile (using gcc-3.3) I get the following
> error.  Any suggestions?

zlib.h is obviously not updated.

Can you provide the output of ./patchin.sh ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
