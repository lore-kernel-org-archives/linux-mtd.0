From: dwmw2@infradead.org (David Woodhouse)
Date: 10 Mar 2003 16:02:34 +0000
Subject: Memory leak
In-Reply-To: <002601c2e71c$7abe7d40$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
 <200303092010.44211.tglx@linutronix.de>
 <000f01c2e691$1a319a60$210486da@ybb>
 <200303101553.09156.tglx@linutronix.de>
 <1047305682.23941.44.camel@passion.cambridge.redhat.com>
 <002601c2e71c$7abe7d40$210486da@ybb>
Message-ID: <1047312153.23941.157.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-10 at 15:48, matsunaga wrote:

> It is correct that rmmod will resolve it, but my concern is a
> consistency of resource and memory saving.
> Dnode resource acuqired during mount seems not to be refereneced when
> you access to the file.

No. My point is _not_ that rmmod will resolve it, rather that rmmod will
complain _loudly_ if there are slab resources still allocated when you
try to unload the module. You'll then be unable to reload the module at
all, if I recall correctly.

-- 
dwmw2
