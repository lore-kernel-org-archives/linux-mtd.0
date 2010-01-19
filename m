Received: from ey-out-1920.google.com ([74.125.78.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXFHA-0008Gu-Vs
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 14:41:53 +0000
Received: by ey-out-1920.google.com with SMTP id 26so720995eyw.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jan 2010 06:41:46 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 19 Jan 2010 09:41:46 -0500
Message-ID: <dbdb2ea61001190641l14a0603kfe9b45f52576da60@mail.gmail.com>
Subject: static vs. dynamic UBI volume
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can a UBI volume be declared vol_type=static, but mounted with "ro"?
Conversely, if a volume is declared vol_type=dynamic, is it acceptable
to mount "ro" or "rw"?  I'm trying to understand if there are
dependencies between the two.

I'm seeing a very occasional problem on a volume that is
vol_type=dynamic, and is mounted "rw" during startup, then finally
"ro".  The ubiattach works fine, but when trying to initially mount
(as "rw"), I've seen...

[   12.887251] UBI error: ubi_io_read: error -74 while reading 516096
bytes from PEB 4:8192, read 516096 bytes
[   12.897619] UBIFS error (pid 1): ubifs_scan: corrupt empty space at
LEB 2:268135
[   12.905060] UBIFS error (pid 1): ubifs_scanned_corruption:
corruption at LEB 2:268135
[   12.922940] UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
[   13.048269] UBI error: ubi_io_read: error -74 while reading 516096
bytes from PEB 4:8192, read 516096 bytes
[   13.058549] UBIFS error (pid 1): ubifs_recover_master_node: failed
to recover master node


Not sure if this is corruption within NAND or something else.

twebb
