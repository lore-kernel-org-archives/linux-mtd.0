Received: from e33.co.us.ibm.com ([32.97.110.131])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxBBB-0003fr-Td
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 17:07:39 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Michael Howard <michael.howard@med.ge.com>
In-Reply-To: <41226B8B.7010603@med.ge.com>
References: <41226B8B.7010603@med.ge.com>
Content-Type: text/plain
Message-Id: <1092776847.2912.139.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 16:07:28 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: compile errors with daily snapshots
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-17 at 15:33, Michael Howard wrote:
> Hello,
> 
> I've been grabbing the daily snapshots for a couple of weeks now and 
> keep seeing the following error:
> 
> fs/jffs2/write.c: In function `jffs2_write_dnode':
> fs/jffs2/write.c:95: error: storage size of `vecs' isn't known
> fs/jffs2/write.c:95: warning: unused variable `vecs'
> fs/jffs2/write.c: In function `jffs2_write_dirent':
> fs/jffs2/write.c:236: error: storage size of `vecs' isn't known
> fs/jffs2/write.c:236: warning: unused variable `vecs'
> make[2]: *** [fs/jffs2/write.o] Error 1
> make[1]: *** [fs/jffs2] Error 2
> make: *** [fs] Error 2
> 
> 
> Is anyone else getting this?  I've tried patching 2.4.23 and 2.6.7 with 
> the same results.  Any help would be much appreciated.

dwmw2 updated CVS to merge with Linus, so you need 2.6.8-rc1 or greater
for the snapshots to work with a 2.6 kernel.  Actually, because of the
merge 2.6.8 should be fairly close to CVS anyway.

No comment on 2.4 support... ;)

As for your specific error, Al Viro moved struct kvec into
include/linux/uio.h during some sparse annotation cleanup.  That in
itself wouldn't be hard to fix, but you also need the symlink patches Al
did for jffs2 to work.  That's a larger patch kit, so it's probably
simpler to update to 2.6.8.1.

josh
