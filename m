From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 10:29:23 +0100
Subject: jffs2 occasionally locking up?
In-Reply-To: <0019C845.3E4BC54E@mail.auerswald.de>
References: <0019C845.3E4BC54E@mail.auerswald.de>
Message-ID: <200302141029.23689.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thursday 13 February 2003 16:18, kai-uwe.bloem at auerswald.de wrote:
> - mount an empty partition as jffs2 on an Intel 28f128K3 flash.
> - copy a large directory tree to it
> - *immediately* overwrite that tree with itself
> - *immediately* copy another large oversized (too big for this partition)
> tree
> Sometimes the last copy doesn't produce a "no space" error message. Rather,
> it does not return for at least half an hour, which is the longest time I
> waited for completion.
> Moreover, if I stop copying by ctrl-c, and try to unmount the partition,
> the unmount locks up as well.
> I have put some code into the cfi driver to observe sector erasing. I
> noticed that after I have interrupted the copy, sectors are still erased
> every other second or such. This keeps going on and on. Looks to me like
> the garbage collector is in a kind of endless loop here.
If you copy too much data to the partition, it tries to garbage collect to 
give you more space on the device. The endless loop seems true.
 
Could you please set JFFS2_DEBUG=1 and provide a log-output.
Don't forget to echo 9 >/proc/sys/kernel/printk before starting your copy 
session. Please compress the log and mail it to me in private (will be some 
MB) or provide it any location for download

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
