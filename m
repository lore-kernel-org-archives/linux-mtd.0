Received: from fep02-mail.bloor.is.net.cable.rogers.com ([66.185.86.72])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18bhv5-0007KO-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 14:01:27 +0000
Date: Thu, 23 Jan 2003 09:31:50 -0500 (EST)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: Raphael Hertzog <eng@eipm.ch>
cc: linux-mtd@lists.infradead.org
Subject: Re: Lilo-mtd passes garbage as kernel command line
In-Reply-To: <1043317565.559.24.camel@localhost>
Message-ID: <Pine.LNX.4.44.0301230928440.1035-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I once enabled the serial port control in lilo but left a serial mouse
attached.  It seems lilo interacts with video/keyboard and serial port at
the same time, duplicating output into both.

On 23 Jan 2003, Raphael Hertzog wrote:

> I'm using lilo-mtd (lilo 21 with the patch available on the website) to
> boot on a DOC. It works but I have a little problem. It looks like lilo
> is passing garbage to the kernel as kernel command line.
