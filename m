From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Tue, 11 Mar 2003 01:26:37 +0900
Subject: Memory leak
References: <000e01c2e65b$71ca7020$210486da@ybb> <200303092010.44211.tglx@linutronix.de> <000f01c2e691$1a319a60$210486da@ybb> <200303101553.09156.tglx@linutronix.de> <1047305682.23941.44.camel@passion.cambridge.redhat.com> <002601c2e71c$7abe7d40$210486da@ybb> <1047312153.23941.157.camel@passion.cambridge.redhat.com>
Message-ID: <004901c2e721$d30125c0$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> On Mon, 2003-03-10 at 15:48, matsunaga wrote:
> 
> > It is correct that rmmod will resolve it, but my concern is a
> > consistency of resource and memory saving.
> > Dnode resource acuqired during mount seems not to be refereneced when
> > you access to the file.
> 
> No. My point is _not_ that rmmod will resolve it, rather that rmmod will
> complain _loudly_ if there are slab resources still allocated when you
> try to unload the module. You'll then be unable to reload the module at
> all, if I recall correctly.

You are correct again ;-)
  kmem_cache_destroy(full_dnode_slab);
and
  kmem_cache_destroy(node_frag_slab);
return error.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
