Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <006f01c782b9$b23ecfd0$020120ac@Jocke>
References: <006f01c782b9$b23ecfd0$020120ac@Jocke>
Content-Type: text/plain
Date: Fri, 20 Apr 2007 17:13:51 -0400
Message-Id: <1177103631.30621.35.camel@shinybook.infradead.org>
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

On Thu, 2007-04-19 at 21:34 +0200, Joakim Tjernlund wrote:
> Ping. 

Sorry for taking so long to look at this. Did you test this without
SUMMARY support? 

I agree that we ought to make the summary code _not_ imply
!jffs2_can_mark_obsolete(). There's a few things I want to change about
the summary code -- the nodes are currently about twice as large as they
need to be, too. I'll look at that soon.

-- 
dwmw2
