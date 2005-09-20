Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHdO4-0008Im-0N
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 04:22:09 -0400
Message-ID: <432FC69D.30602@ipi.ac.ru>
Date: Tue, 20 Sep 2005 12:21:49 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: "David A. Braun" <braunster@gmail.com>
References: <432C2E6C.6050400@gmail.com>	<20050919093300.GB21380@wohnheim.fh-wedel.de>	<Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>	<20050919153217.GA26968@wohnheim.fh-wedel.de>
	<432F0884.2020409@gmail.com>
In-Reply-To: <432F0884.2020409@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David A. Braun wrote:
> If the name in master->name doesn't match any of the partitions 
> mentioned on the kernel command line then *pparts->offset is not 
> initialized. The result is that all the partitions start at 0. Also the 
> length of the "SIZE_REMAINING" partition is never initialized. Also the 
> return value is -EINVAL instead of the number of partitions. This 
> results in none of the partitions being pass to the driver. The only 
> partition that appears in /proc/partitions is one for the whole device.
> 

Is not it intentional?

There is a comment:
<Q> mtd-id := unique name used in mapping driver/device (mtd->name) </Q>

These names are identifing the separate devices rather than partitions.
And IMO it's only way to deal multiple flash devices with different partitioning.

--
Regards.
	Tim.
