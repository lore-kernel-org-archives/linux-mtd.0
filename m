Subject: Re: JFFS2 OOPS in 2.6.20
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1173379047.3461.482.camel@pmac.infradead.org>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 18:51:06 +0000
Message-Id: <1173379866.3461.485.camel@pmac.infradead.org>
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

On Thu, 2007-03-08 at 18:37 +0000, David Woodhouse wrote:
> Can you make it print the flash offset of the offending node, and the
> header contents (like the 0040,4001,00000044,00000000 above) before
> dying? Then reproduce with CONFIG_JFFS2_FS_DEBUG=1 and show me the
> full output.

We've seen something very similar to this before.

http://lists.infradead.org/pipermail/linux-mtd/2006-June/015878.html
http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=3877f0b6c9f54d43e55e532404a935b90393b635

-- 
dwmw2
