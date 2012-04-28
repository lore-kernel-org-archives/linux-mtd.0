Received: from mail4-relais-sop.national.inria.fr ([192.134.164.105])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNzzJ-0001E7-1o
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 05:14:30 +0000
Date: Sat, 28 Apr 2012 07:06:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: dwmw2@infradead.org
Subject: question about fs/jffs2/readinode.c
Message-ID: <alpine.DEB.2.02.1204280701210.1917@hadrien>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function read_direntry in fs/jffs2/readinode.c contains the following 
code:

         err = jffs2_flash_read(c, (ref_offset(ref)) + read,
                                rd->nsize - already, &read, &fd->name[already]);
 	if (unlikely(read != rd->nsize - already) && likely(!err))
                       return -EIO;

         if (unlikely(err)) {
                 JFFS2_ERROR("read remainder of name: error %d\n", err);
                 jffs2_free_full_dirent(fd);
                 return -EIO;
         }

Is it intentional that the first if doesn't free fd?  At first I thought 
that that might be the case, because what would be the point of having two 
conditionals if they are going to do the same thing.  But I can't see why 
fd should not be freed either, so maybe the two conditionals are just 
there to give different error messages?

thanks,
julia
