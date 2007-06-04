Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv8jv-0008Rq-ES
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 05:20:43 -0400
Subject: Re: [PATCH] JFFS2 appears to "freeze" during erase
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1180721097.25232.43.camel@pmac.infradead.org>
References: <1180691482.1468.267.camel@gentoo-jocke.transmode.se>
	<1180721097.25232.43.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Jun 2007 11:20:37 +0200
Message-Id: <1180948837.30670.3.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: radbis@googlemail.com,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-01 at 19:04 +0100, David Woodhouse wrote:
> On Fri, 2007-06-01 at 11:51 +0200, Joakim Tjernlund wrote:
> > This is a old patch from Radoslaw Bisewski(see MTD list). The patch
> > fixes the long stalls I am seeing in "GC starves write's in 2.6.20" I
> > sent yesterday. Please apply.
> 
> It seems to make sense; I need to convince myself that every other user
> of the erase_free_sem is actually OK with it. I think
> jffs2_g_c_deletion_dirent() should be OK, at first glance. I'm less
> convinced about jffs2_mark_node_obsolete(), where we currently hold the
> erase_free_sem while we actually mark the node obsolete. Will look into
> it...
> 

looked a litte closer on the new locking in erase.c and wonder
why not jffs2_erase_succeeded() and jffs2_erase_failed() needs
to take erase_free_sem?

 Jocke
