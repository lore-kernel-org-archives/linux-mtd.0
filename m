Subject: Re: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain
Date: Tue, 30 Oct 2007 22:47:03 -0400
Message-Id: <1193798823.2651.65.camel@shinybook.infradead.org>
Mime-Version: 1.0
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

On Tue, 2007-10-30 at 18:39 +0100, Joakim Tjernlund wrote:
> Per Davids request, NULLify ->raw pointers to catch
> errors early.

Er, did I request that? I wanted you to do that in jffs2_do_unlink(),
and you did -- but that was because your previous iteration of the patch
was leaving fd->raw pointing to the _older_, now-obsolete dirent node,
which could then get marked obsolete again later (at the site of the
second hunk of your first patch).

-- 
dwmw2
