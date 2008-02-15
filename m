Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPwE9-0005Vd-1O
	for linux-mtd@lists.infradead.org; Fri, 15 Feb 2008 08:47:31 +0000
Subject: Re: Abnormal behavior with JFFS2 on latest kernel
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: kmpark@infradead.org
In-Reply-To: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
References: <004601c86fa2$201a78d0$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Feb 2008 09:47:17 +0100
Message-Id: <1203065237.5419.74.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-linux-kernel@vger.kernel.org,
	'linux-mtd' <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-02-15 at 16:12 +0900, Kyungmin Park wrote:
> Hi,
> 
> I got following messages.
> INFO: task pdflush:56 blocked for more than 120 seconds.
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 
> What are the meanings?
> Too mush running GC in JFFS2 or others?
> 
> BR,
> Kyungmin Park

It is probably erasing lots of blocks and that takes a while, minutes
some times. I once sent a patch to address this but the patch is racy
w.r.t module unload. Look in the archive after patches from me.

 Jocke
