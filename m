Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16v1UE-0005up-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 20:41:02 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GUB00901G00PL@asu.edu> for linux-mtd@lists.infradead.org; Tue,
 09 Apr 2002 12:40:48 -0700 (MST)
Date: Tue, 09 Apr 2002 12:42:50 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: root jffs2 filesystem on blkmtd emulated device
In-reply-to: <20020409114205.A21994@ns2.forestsidingsupply.com>
To: Mike Mattice <mike@forestsidingsupply.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1018381371.15728.3.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <20020409114205.A21994@ns2.forestsidingsupply.com>
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

On Tue, 2002-04-09 at 09:42, Mike Mattice wrote:
> I've got a flash based ide module which is too small for my needs w/o 
> compression.  So, I'm trying to get this to use jffs2 as it's root 
> filesystem type.   I've run into a bit of a problem.
> 
> After applying the following patch, using the attached config, and passing 
> 'blkmtd=/dev/hdc2' to the kernel and setting the root device to 
> '/dev/mtdblock/0' via lilo, I get this on the console.  (hand typed, but 
> should be very close)

good debugging, it was fixed in october, but due to some cvs snafu, has
never made it into the 2.4 kernels. Just remove the invalidate_device
call
