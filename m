Subject: Re: [PATCH] JFFS2 appears to "freeze" during erase
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1180691482.1468.267.camel@gentoo-jocke.transmode.se>
References: <1180691482.1468.267.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 01 Jun 2007 19:04:57 +0100
Message-Id: <1180721097.25232.43.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: radbis@googlemail.com,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-01 at 11:51 +0200, Joakim Tjernlund wrote:
> This is a old patch from Radoslaw Bisewski(see MTD list). The patch
> fixes the long stalls I am seeing in "GC starves write's in 2.6.20" I
> sent yesterday. Please apply.

It seems to make sense; I need to convince myself that every other user
of the erase_free_sem is actually OK with it. I think
jffs2_g_c_deletion_dirent() should be OK, at first glance. I'm less
convinced about jffs2_mark_node_obsolete(), where we currently hold the
erase_free_sem while we actually mark the node obsolete. Will look into
it...

-- 
dwmw2
