Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160VpJ-00056s-00
	for <linux-mtd@lists.infradead.org>; Sun, 04 Nov 2001 22:33:13 +0000
Date: Sun, 4 Nov 2001 22:42:30 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Michael Rothwell <rothwell@holly-springs.nc.us>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2, CF, PCMCIA adapter, ATA
In-Reply-To: <1004911786.4240.56.camel@gromit.house>
Message-ID: <Pine.LNX.4.33.0111042238560.28157-100000@imladris.demon.co.uk>
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

On 4 Nov 2001, Michael Rothwell wrote:

> Sorry it took so long; I had to copy the oops output from the console
> screen... here it is, by way of ksymoops:

That's a BUG(). And it's probably the one in ACCT_PARANOIA_CHECK():

#define ACCT_PARANOIA_CHECK(jeb) do { \
                __u32 my_used_size = 0; \
                struct jffs2_raw_node_ref *ref2 = jeb->first_node; \
                while (ref2) { \
                        if (!(ref2->flash_offset & 1)) \
                                my_used_size += ref2->totlen; \
                        ref2 = ref2->next_phys; \
                } \
                if (my_used_size != jeb->used_size) { \
                        printk(KERN_NOTICE "Calculated used size %08x != 
stored used size %08x\n", my_used_size, jeb->used_size); \
                        BUG(); \
                } \
        } while(0)


I haven't seen those trigger for months - please could you set 
CONFIG_JFFS2_FS_DEBUG=1 and capture _all_ (inc. KERN_DEBUG) messages from 
mounting a clean filesystem to the time it oopses? A serial console 
may be useful.

How did you build your JFFS2 image? What arguments did you give to 
mkfs.jffs2 if you used it?

-- 
dwmw2
