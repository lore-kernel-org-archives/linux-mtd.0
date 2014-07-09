Received: from mail-qa0-x22a.google.com ([2607:f8b0:400d:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4goT-0001oH-61
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 01:36:50 +0000
Received: by mail-qa0-f42.google.com with SMTP id dc16so5560571qab.15
 for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2014 18:36:26 -0700 (PDT)
Date: Tue, 8 Jul 2014 18:36:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 1/3] mtd: Add sysfs attributes to expose the ECC stats
 fields
Message-ID: <20140709013623.GE7537@ld-irv-0074>
References: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1403618152-4515-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403618152-4515-2-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 24, 2014 at 10:55:50AM -0300, Ezequiel Garcia wrote:
> These new sysfs device attributes allows to retrieve the ECC
> and bad block stats by poking a sysfs file, which is often more convenient
> than using the ioctl.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  Documentation/ABI/testing/sysfs-class-mtd | 38 ++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.c                     | 45 +++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)

I'm squashing in the following diff:

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 66d5206df742..76ee192f80a0 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -191,7 +191,7 @@ KernelVersion:	3.17
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		The number of failures reported by this device's ECC. Typically,
-		this failures are associated to failed read operations.
+		these failures are associated with failed read operations.
 
 		It will always be a non-negative integer.  In the case of
 		devices lacking any ECC capability, it is 0.
@@ -212,7 +212,7 @@ Date:		June 2014
 KernelVersion:	3.17
 Contact:	linux-mtd@lists.infradead.org
 Description:
-		The number of blocks marked as bad, is any, in this partition.
+		The number of blocks marked as bad, if any, in this partition.
 
 What:		/sys/class/mtd/mtdX/bbt_blocks
 Date:		June 2014
@@ -221,4 +221,4 @@ Contact:	linux-mtd@lists.infradead.org
 Description:
 		The number of blocks that are marked as reserved, if any, in
 		this partition. These are typically used to store the in-flash
-		bad block table.
+		bad block table (BBT).
