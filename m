From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 14:49:20 +0100
Subject: jffs2 occasionally locking up?
In-Reply-To: <2702075D4DE2B043BF5EB82E9CFAD45B0BD456@mail1.mediatrix.com>
References: <2702075D4DE2B043BF5EB82E9CFAD45B0BD456@mail1.mediatrix.com>
Message-ID: <200302141449.20995.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 14:48, Frederic Giasson wrote:
> On Friday 14 February 2003 10:29:23, tglx at linutronix.de wrote:
> >If you copy too much data to the partition, it tries to garbage collect to
> >give you more space on the device. The endless loop seems true.
> >
> >Could you please set JFFS2_DEBUG=1 and provide a log-output.
> >Don't forget to echo 9 >/proc/sys/kernel/printk before starting your copy
> >session. Please compress the log and mail it to me in private (will be
> > some MB) or provide it any location for download
>
> We encountered the same problem, the garbage collector seemed to spin
> endlessly, but usually it stoped after many hours.  We found a way to avoid
> the problem: calling "sync" command before every copy to jffs2. This way,
> copy time is much more deterministic, even when jffs2 is almost full.
But that does not solve the problem. Could anybody provide a log please, as 
I'm out of hardware at the moment.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
