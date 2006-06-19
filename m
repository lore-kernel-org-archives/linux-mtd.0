Subject: Re: [JFFS2] a way to reduce memory usage
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Bazhenov <dbazhenov@rambler.ru>
In-Reply-To: <200606191150.08436.dbazhenov@rambler.ru>
References: <200606151216.23086.dbazhenov@rambler.ru>
	<1150587140.2584.32.camel@shinybook.infradead.org>
	<200606191150.08436.dbazhenov@rambler.ru>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 09:00:54 +0100
Message-Id: <1150704054.3176.387.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-06-19 at 11:50 +0400, Dmitry Bazhenov wrote:
> The algorithm allows to leave in memory only references to those nodes, that
> can affect future functionality, but to free references to all other nodes.
> The algorithm is appliable for the case of NAND chips also. 

http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=9bfeb691e75b21fdaa80ffae719083200b190381

-- 
dwmw2
