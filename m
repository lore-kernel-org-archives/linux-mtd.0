Subject: Re: [PATCH] Revert "[JFFS2] Reduce time for which erase_free_sem
	is held during erase."
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1191597989.4586.16.camel@sauron>
References: <1191597989.4586.16.camel@sauron>
Content-Type: text/plain
Date: Fri, 05 Oct 2007 17:00:05 -0400
Message-Id: <1191618005.30247.24.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-10-05 at 18:26 +0300, Artem Bityutskiy wrote:
> This patch locks up the system because it takes the 'erase_free_sem'
> in the erase callback function, which is in turn called from
> NAND/OneNAND driver with NAND/OneNAND chip locked.

I think the real bug is the drivers calling the callback with their own
locks held, surely?

-- 
dwmw2
