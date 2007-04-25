Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177515648.5073.14.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 25 Apr 2007 16:46:06 +0100
Message-Id: <1177515966.2755.254.camel@pmac.infradead.org>
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

On Wed, 2007-04-25 at 17:40 +0200, Joakim Tjernlund wrote:
> +       if (!list->rb_node)
> +          __jffs2_dbg_dump_fragtree(frag); 

That one wouldn't have oopsed if you had passed it 'f' as you were
supposed to, instead of passing it NULL.

-- 
dwmw2
