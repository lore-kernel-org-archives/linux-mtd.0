From: orjan.friberg@axis.com (Orjan Friberg)
Date: Wed, 12 Mar 2003 15:17:26 +0100
Subject: [PATCH] Oops on umount/mount (JFFS 1)
References: <3E6CB695.CF72E9BC@axis.com>
Message-ID: <3E6F4176.E49F1450@axis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Orjan Friberg wrote:
> 
> The patch below takes care of a umount/mount-related oops I had.  It happens when a JFFS 1 file
> system is mounted for the second time if CONFIG_JFFS_PROC_FS is on, due to jffs_proc_root being
> freed on a umount, but only being allocated once (at init).  The patch below allocates
> jffs_proc_root each time the proc entry is registered.  (In my case, besides corrupting a node, the
> bug also manifested itself by /proc/fs/jffs not showing up after the second mount.)

Is this ok to commit?

-- 
Orjan Friberg
Axis Communications AB
