Received: from d-106.linux2002.uq.net.au ([203.15.37.106] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YKms-0008Jf-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 05:38:31 +0000
Date: Wed, 6 Feb 2002 15:49:00 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Problem with files removing
In-Reply-To: <413FBB0BA5AED1119122000083234B1A01DD2973@alpha.igk.intel.com>
Message-ID: <Pine.LNX.4.44.0202061544340.8684-100000@lapdancer.baythorne.internal>
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

On Tue, 5 Feb 2002, Kolakowski, Mikolaj wrote:

> After short investigation I have noticed that jffs2_unlink function is
> called and jffs2_clear_inode is not.
> I think that this is problem with kernel version that I use 2.3.99. 

Yes. Looking at the changes in other filesystems between then and 
now, I see that d_delete() was removed. 

> I have put there d_delete but it cause GPF in clear_inode:
> if(inode->i_data.nrpages) 
> 	BUG();

On that one I have no clue. Either upgrade from 2.3.99 or look more 
closely at what other filesystems used to do in 2.3.99 to avoid this. 

-- 
dwmw2
