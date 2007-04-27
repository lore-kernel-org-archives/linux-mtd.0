Subject: Re: [RFC: 2.6 patch] drivers/mtd/maps/nettel.c: possible cleanups
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20070426234756.GM3468@stusta.de>
References: <20070426234756.GM3468@stusta.de>
Content-Type: text/plain
Date: Fri, 27 Apr 2007 23:35:13 +0100
Message-Id: <1177713313.2755.681.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-04-27 at 01:47 +0200, Adrian Bunk wrote:
> This patch contains the following possible cleanups:
> - make 2 needlessly global functions static
> - #if 0 the unused nettel_eraseconfig()
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

For obvious reasons I'll apply this only if approved by the owner of the
map driver in question.

-- 
dwmw2
