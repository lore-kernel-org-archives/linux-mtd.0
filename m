Received: from mail5.bluewin.ch ([195.186.1.207])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bi58-0007Lj-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 14:11:50 +0000
Subject: Re: Lilo-mtd passes garbage as kernel command line
From: Raphael Hertzog <eng@eipm.ch>
To: Ilguiz Latypov <ilatypov@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0301230928440.1035-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
References: 
	 <Pine.LNX.4.44.0301230928440.1035-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043332962.15620.46.camel@localhost>
Mime-Version: 1.0
Date: 23 Jan 2003 15:42:42 +0100
Content-Transfer-Encoding: 8bit
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

Am Don, 2003-01-23 um 15.31 schrieb Ilguiz Latypov:
> I once enabled the serial port control in lilo but left a serial mouse
> attached.  It seems lilo interacts with video/keyboard and serial port at
> the same time, duplicating output into both.

I think it's totally unrelated to my problem. The lilo and the DOC are
on an embedded PC without VGA output but with serial ports and I do see
the garbage with the boot messages that are sent via the serial line...

Also I try to pass the parameter "console=null" to prevent the kernel
from sending those messages but it doesn't work as it used to when I was
uing "doc-lilo" from m-sys (associated to their binary-only driver :-().

BTW, along with the patch for lilo there's a "boot.b-mtd", where are the
sources for this file ?

Cheers,
-- 
Raphaël Hertzog - EIPM SA
