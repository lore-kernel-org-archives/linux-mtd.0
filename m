From: dwmw2@infradead.org (David Woodhouse)
Date: 10 Mar 2003 17:04:23 +0000
Subject: Memory leak
In-Reply-To: <004901c2e721$d30125c0$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
 <200303092010.44211.tglx@linutronix.de>
 <000f01c2e691$1a319a60$210486da@ybb>
 <200303101553.09156.tglx@linutronix.de>
 <1047305682.23941.44.camel@passion.cambridge.redhat.com>
 <002601c2e71c$7abe7d40$210486da@ybb>
 <1047312153.23941.157.camel@passion.cambridge.redhat.com>
 <004901c2e721$d30125c0$210486da@ybb>
Message-ID: <1047315863.23941.161.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-10 at 16:26, matsunaga wrote:
> You are correct again ;-)
>   kmem_cache_destroy(full_dnode_slab);
> and
>   kmem_cache_destroy(node_frag_slab);
> return error.

Aha, that's good. You're saying they _do_ return an error?

Please compile with CONFIG_JFFS2_FS_DEBUG=1 and capture all the messages
over a serial console. Add a printk to the allocation and free routines
for both the full_dnode and node_frag structures to print the address
which is allocated/freed. Then we can compare and find where structures
are allocated but not freed.

What exactly do you need to do to trigger this? Is it something special
about the particular file system image on your device?

-- 
dwmw2
