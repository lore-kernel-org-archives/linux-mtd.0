Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgQnt-0007Bp-59
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 15:50:05 +0000
Date: Tue, 13 Jan 2004 16:47:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Markus Borchers <MBorchers@adwin.de>
Message-ID: <20040113154724.GA23333@wohnheim.fh-wedel.de>
References: <opr1py4bes8jdzbh@10.100.100.100>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <opr1py4bes8jdzbh@10.100.100.100>
cc: linux-mtd@lists.infradead.org
Subject: Re: overwrite complete flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 January 2004 16:10:49 +0100, Markus Borchers wrote:
> 
> I miss a device-file (like /dev/hda) to have access independent of any 
> partitions.

Should be just like /dev/hda - look for the device with minor number 0
or create it, if you don't have it.

brw-rw----    1 root     disk       3,   0 Mar 14  2002 /dev/hda
brw-rw----    1 root     disk       3,   1 Mar 14  2002 /dev/hda1
brw-rw----    1 root     disk       3,   2 Mar 14  2002 /dev/hda2
brw-rw-rw-    1 root     root      31,   0 Jan  1  1970 /dev/mtdblock0
brw-rw-rw-    1 root     root      31,   1 Jan  1  1970 /dev/mtdblock1
brw-rw-rw-    1 root     root      31,   2 Jan  1  1970 /dev/mtdblock2

The names may not be optimal, feel free to use different ones.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
