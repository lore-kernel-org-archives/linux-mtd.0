Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IGsq-0005dr-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2002 23:18:49 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6E00B0OY5E68@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 01 Dec 2002 00:48:51 +0100 (MET)
Date: Sun, 01 Dec 2002 00:46:59 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: undefined reference to 'crc32' ?
In-reply-to: <002301c298c1$e6f10360$0300a8c0@jockeXP>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
 Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212010046.59435.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3DE7CB23.5535F5E6@imc-berlin.de>
 <002301c298c1$e6f10360$0300a8c0@jockeXP>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Saturday 30 November 2002 23:43, Joakim Tjernlund wrote:
> CVS JFFS2 assumes that  crc32()  is avialable as a generic function. You
> need my crc32 backport from 2.5 to 2.4. It's somewhere in the MTD
> archives(I think). I don't have it handy ATM.
I had no 2.4.20 kernel available, when I overhauled patchin.sh. I did not 
realize that 2.4.19 had include/linux/crc32.h also available.

I changed patchin.sh so it supports those kernels too.

cvs up

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
