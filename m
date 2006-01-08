From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060107220702.GZ3774@stusta.de>
References: <20060107220702.GZ3774@stusta.de>
Content-Type: text/plain
Date: Sun, 08 Jan 2006 00:00:09 +0000
Message-Id: <1136678409.30348.26.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN and
	remove broken MTD_OBSOLETE_CHIPS drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-01-07 at 23:07 +0100, Adrian Bunk wrote:
> This patch brings the MTD_SHARP driver back into life and removes the 
> non-compiling MTD_AMDSTD and MTD_JEDEC with everything depending on 
> them.

Please provide further background on your reasoning. I'll enumerate my
questions to make it easy for you to answer each one fully.

1. Precisely when were these chip drivers marked obsolete?

2. What was the reason for marking them obsolete?

3. What are the factors which led you to conclude that _now_ is the time
to actually remove them?

4. What are the factors which led you to _remove_ the map drivers which
currently use the obsolete chip drivers, rather than taking the obvious
alternative solution for those map drivers?

-- 
dwmw2
