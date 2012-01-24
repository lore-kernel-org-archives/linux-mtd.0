Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RpjyU-0000Fp-Lu
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 17:16:03 +0000
Message-ID: <4F1EE749.6020801@flatfrog.com>
Date: Tue, 24 Jan 2012 18:15:53 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com>
In-Reply-To: <4F1E802D.5010402@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A couple of new observations in trying to box this in:

Early revisions (A2) of the BeagleBoard xM has both NAND and SD/MMC.  If 
I boot the system (Linux + rootfs) off the SD card (ext3 formatted) and 
create two JFFS2 partitions in the NAND flash, I cannot repeat the 
problem.  That system uses a pretty recent kernel, 3.0.17.

As a sanity check, I ran the 2.6.32 configuration on the xM board to 
verify that it wasn't a problem isolated to our own board.  Sure enough, 
it happens there too.


I'm going to check whether the oops is dependent on Linux + rootfs being 
on a JFFS2 partition or if it's just a matter of kernel version.


On a side note, is there a more easily searchable archive than 
http://lists.infradead.org/pipermail/linux-mtd/?


Thanks,
Orjan

-- 
Orjan Friberg
FlatFrog Laboratories AB
