Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rpldn-0001vP-Pp
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 19:02:48 +0000
Message-ID: <4F1F004C.6040501@flatfrog.com>
Date: Tue, 24 Jan 2012 20:02:36 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
In-Reply-To: <4F1EE749.6020801@flatfrog.com>
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

On 01/24/2012 06:15 PM, Orjan Friberg wrote:
> I'm going to check whether the oops is dependent on Linux + rootfs being
> on a JFFS2 partition or if it's just a matter of kernel version.

Slight mistake: the kernel is not in the root filesystem, and does not 
reside in a JFFS2 partition.

Anyway, exposing the bug does not depend solely on whether the root file 
system is one of the JFFS2 partitions being exercised in the test. 
(Only tested in one direction: in a configuration where the bug does not 
show up I moved the rootfs from the SD card to a JFFS2 partition on the 
NAND.)


I'll be trying out various kernel versions next.  Hopefully I'll find 
something isolated that can either be backported or at least convince me 
that this is in fact a JFFS2 bug and support me switching over to UBIFS.

Thanks,
Orjan

-- 
Orjan Friberg
FlatFrog Laboratories AB
