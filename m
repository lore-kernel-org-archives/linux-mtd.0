Received: from waste.org ([209.173.204.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MHad-00051k-7z
	for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2003 02:24:51 +0100
Date: Sat, 31 May 2003 20:25:16 -0500
From: Matt Mackall <mpm@selenic.com>
To: Con Kolivas <kernel@kolivas.org>
Message-ID: <20030601012516.GJ23715@waste.org>
References: <20030530174319.GA16687@wohnheim.fh-wedel.de>
	<20030530.235505.23020750.davem@redhat.com>
	<20030531075615.GA25089@wohnheim.fh-wedel.de>
	<200305311822.21823.kernel@kolivas.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305311822.21823.kernel@kolivas.org>
Content-Type: text/plain; charset=us-ascii
cc: "David S. Miller" <davem@redhat.com>
cc: linux-mtd@lists.infradead.org
cc: J?rn Engel <joern@wohnheim.fh-wedel.de>
cc: linux-kernel@vger.kernel.org
cc: jmorris@intercode.com.au
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 31, 2003 at 06:22:21PM +1000, Con Kolivas wrote:
> 
> The only way I could think of was perhaps using a load on another disk 
> (io_other which is in contest) that is using jffs2 when the contest baseline 
> is running on a normal filesystem - this has shown very little differences 
> between filesystems normally. Otherwise if everything in contest is run on 
> jffs2 it would affect every layer and hard to be sure you had a control to 
> compare with.

Timing on jffs2 is notoriously unrepeatable anyway - it's fully log
structured rather than journalled so it behaves a little differently.

-- 
Matt Mackall : http://www.selenic.com : of or relating to the moon
