Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFQTz-0006el-TU
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 08:52:20 +0000
Date: Thu, 17 Jan 2008 09:47:53 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: DMcLeod <dmcleod@bittware.com>
Subject: Re: JFFS2 access time
In-Reply-To: <478E0D5E.8070508@bittware.com>
Message-ID: <Pine.LNX.4.64.0801170944580.24534@lnxricardw.se.axis.com>
References: <478E0D5E.8070508@bittware.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 16 Jan 2008, DMcLeod wrote:

> Hi all,
>
> We are using uClinux git 2.6.23. We have 4 2.5MB files sitting in a
> directory on a ~40MB jffs2 partition (on NOR flash). The very first time
> we do an 'ls' in that directory, the response takes literally minutes.
> After the initial delay, any accesses to those files are very

By "the first time" to you mean the first time you boot the board at all, 
or the first time after each boot?

If you download a 10 MB JFFS2 image into a 40 MB partition, then JFFS2 
will upon mounting erase each flash sector in the unused 30 MB area and 
write cleanmarkers to it. This more or less blocks accesses to the flash 
during this time. However, this only occurs the first time the system is 
booted, after that, the partition is completely "JFFS2-formatted" and 
there shouldn't be any further delays.

/Ricard
