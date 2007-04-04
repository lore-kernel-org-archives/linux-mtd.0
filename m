Received: from alias2.ihug.co.nz ([203.96.222.12])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HYzc5-0003ii-7W
	for linux-mtd@lists.infradead.org; Wed, 04 Apr 2007 03:09:02 -0400
From: "Gavin Lambert" <gavinl@compacsort.com>
To: "'Jitendra Jain'" <jitendra.jain@einfochips.com>
Subject: RE: MEMGETREGIONCOUNT ioctl
Date: Wed, 4 Apr 2007 19:11:58 +1200
Message-ID: <004501c77688$88c0b930$74fbfea9@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <00b401c77683$d0be6340$fd09a8c0@jitendrajain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm a bit of an MTD newbie myself, so I could be wrong about some of
this, but:

Quoth Jitendra Jain [jitendra.jain@einfochips.com]:
> As per the driver, the MEMGETREGIONCOUNT returns the
> parameter numeraseregions, which is meant to signify if the
> flash erase size is same throughout or whether it has
> variable sized sectors (which is found on NOR flash devices).
> Why does the util denote that number as number of erase regions ??

Because that's sort of what it is.  If your driver doesn't support the
ioctl at all then callers assume the erase size is constant as given in
the erasesize field of MEMGETINFO.  If it does support the ioctl, then
callers expect it to return the number of erase block size-change
thresholds (since a region can cover multiple erase blocks, provided
they're contiguous and of the same size).

> Next, the MEMGETREGIONINFO seems to copy arguments from User
> to the kernel which I dont understand. This is meant to give
> the User information so, it ought to be copy_to_user.

It's bidirectional.  It has to first copy to the kernel so that the
kernel can read the regionindex field and find out which region the user
wants to know about.  Then once it's filled in the rest of the
kernel-side structure it needs to copy that back to userspace.
