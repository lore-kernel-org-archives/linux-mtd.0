Subject: Re: stable oops
From: David Woodhouse <dwmw2@infradead.org>
To: Nickolay <nickolay@protei.ru>
In-Reply-To: <448E920B.3050008@protei.ru>
References: <448E920B.3050008@protei.ru>
Content-Type: text/plain
Date: Sun, 18 Jun 2006 00:10:06 +0100
Message-Id: <1150585806.2584.28.camel@shinybook.infradead.org>
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

On Tue, 2006-06-13 at 14:23 +0400, Nickolay wrote:
> [42949425.260000] kernel BUG at fs/jffs2/readinode.c:353! 

There are two problems. First, there is some hardware problem which is
causing the ECC errors that you didn't show here. You need to fix that
for yourself.

Secondly, JFFS2 shouldn't be trusting node headers before their CRC is
checked. What's happening here is we _know_ that there should be a data
node at that location (which is why it's REF_UNCHECKED) because it's
listed in a summary. But the node isn't actually readable -- we read a
bogus value for its node type, and that's why we trigger the BUG() for
an unknown node being REF_UNCHECKED.

That BUG() seems to have crept in during another one of Artem's
"cleanups" for which he's rapidly becoming unpopular, and should now be
fixed in the git tree -- please could you confirm that?

-- 
dwmw2
