Received: from gum.itee.uq.edu.au ([130.102.66.1])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HYanf-0000E9-1M
	for linux-mtd@lists.infradead.org; Tue, 03 Apr 2007 00:39:20 -0400
Message-ID: <4611DA6B.5000409@itee.uq.edu.au>
Date: Tue, 03 Apr 2007 14:39:07 +1000
From: John Williams <jwilliams@itee.uq.edu.au>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [uClinux-dev] ENOENT creating /dev/root on MTD RAM partition
References: <461057B4.8030209@itee.uq.edu.au>
In-Reply-To: <461057B4.8030209@itee.uq.edu.au>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I wrote:

> I'm working on the 2.6 kernel for MicroBlaze (embedded, NOMMU) arch. 
> Like some other nommu archs, we typically mount root on an MTD RAM 
> partition (either CRAMFS or ROMFS).
> 
> All of this is working fine on 2.6.19 plus SnapGear 2.6.19-uc0-bigpatch 
> NOMMU patchset.
> 
> However, since coming forward to 2.6.20 (plus equiv. SnapGear patchset) 
> mount_root is failing.

Problem solved.  An error in the arch link script resulted in the 
initcall_rootfs initcalls to not be invoked - thus the stub init_ramfs 
wasn't mounted, and /dev didn't exist.

John
