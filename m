From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 12 Mar 2003 09:46:46 +0100
Subject: 2.4.19 rmk4 Jffs2 Performance problems, Upgrade diffulculty.
In-Reply-To: <3E6E5C74.2080201@visi.com>
References: <3E6D1821.3060002@visi.com> <200303111555.47644.tglx@linutronix.de>
 <3E6E5C74.2080201@visi.com>
Message-ID: <200303120946.46305.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 11 March 2003 23:00, RobertS wrote:
>
> What I am doing now is turning on the verbose debug messages and keep
> everything as simple as possible.  I will be performing a series of
> tests and will use this thread either to post my findings or further
> questions.
Set JFFS2_DEBUG=1 and do an 
echo 9 >/proc/sys/kernel/printk 
before you mount the device and start copying.
Log via a serial console if possible, as klogd seems to loose bits, if there 
is heavy load.

Send this captured log to me in private or put it anywhere for download.


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
