Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166VD4-0001My-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 11:06:30 +0000
Message-ID: <3BFBDB54.C02EBE28@sasken.com>
Date: Wed, 21 Nov 2001 16:50:28 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: Flash Partitons
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi
 It will be very usefull if some one can give their  comments.

We are developing an embeded device (email device ) and planning to have

CRAMFS for the root file system and JFFS2 for the user data.

If CRAMFS is root fs, then i cant have  system and user configuration
files under this as they are updated according to requirement.

One way is to have links to Jffs2 partition so that we  can update these
files.
Or To have a separate partition (jffs2) for configuration files, which
consumes a lot of
flash space (as 5 sectors are reserved for GC).

I feel first one is the better choice as we are very tight on FLASH
space.
But having the config files and user data in the same partition
.......will it be safe?
Like while manipulating the user data, is there any chance that config
files may be corrupted...while GC. is running and the power goes
down.......)

Is there any other way of doing this.

Thanks in advance
Regards
ashok
