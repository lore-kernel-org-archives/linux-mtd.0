Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1In90F-0007AA-56
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 04:32:49 -0400
Subject: Re: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193798823.2651.65.camel@shinybook.infradead.org>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193798823.2651.65.camel@shinybook.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 31 Oct 2007 09:32:38 +0100
Message-Id: <1193819559.26497.73.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-10-30 at 22:47 -0400, David Woodhouse wrote:
> On Tue, 2007-10-30 at 18:39 +0100, Joakim Tjernlund wrote:
> > Per Davids request, NULLify ->raw pointers to catch
> > errors early.
> 
> Er, did I request that? I wanted you to do that in jffs2_do_unlink(),
> and you did -- but that was because your previous iteration of the patch
> was leaving fd->raw pointing to the _older_, now-obsolete dirent node,
> which could then get marked obsolete again later (at the site of the
> second hunk of your first patch).

Must have misunderstood then, but it makes sense to nullify all such
references, doesn't it? Anyhow I happy with the first part only, the
second patch needs more test.

  Jocke
