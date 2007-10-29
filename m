Subject: RE: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <005201c819be$649f47e0$5267a8c0@Jocke>
References: <005201c819be$649f47e0$5267a8c0@Jocke>
Content-Type: text/plain
Date: Sun, 28 Oct 2007 20:26:45 -0400
Message-Id: <1193617605.2915.84.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?=27J=F6rn?= Engel' <joern@logfs.org>,
	'Jamie Lokier' <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2007-10-29 at 00:58 +0100, Joakim Tjernlund wrote:
> David, before rewriting getdents et. all may I ask you to apply the
> patch I sent today? Then we will have something that works and go
> from there.

I'm not happy about having fd->raw still pointing to nodes which may no
longer exist. Can't we set it to NULL (and cope with potential fallout)?

-- 
dwmw2
