From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@lumentis.se
In-Reply-To: <004001c4074f$99fd6d70$0a01a8c0@LUMENTIS02>
References: <004001c4074f$99fd6d70$0a01a8c0@LUMENTIS02>
Content-Type: text/plain
Message-Id: <1079000387.867.106.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Mar 2004 10:19:48 +0000
Content-Transfer-Encoding: 7bit
cc: joris.lammers@pandora.be
cc: linux-mtd@lists.infradead.org
Subject: RE: Failed to garbage collect: ENOSPC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-11 at 10:59 +0100, Joakim Tjernlund wrote:
> > Only way to get out of this is to remove the log file that 
> > was written to most. This file is then about 200kB in size 
> > but after removal the free space of the partition grows from 
> > 124kB to 2MB! Apparently there was dirty space to collect?
> 
> The JFFS2 overhead from small writes is rather big. Each write is its own node in
> flash so a 124kB log file can be 2MB on flash. If you copy the log file and delete the
> old file, you will free flash space.

We really ought to count the space taken up that way. We already have
the offending nodes marked as non-optimal, so that on GC we actually
read the whole page and write it out again in a single node, obsoleting
lots of the smaller nodes. We should keep track of them separately and
GC them before returning -ENOSPC.

-- 
dwmw2
