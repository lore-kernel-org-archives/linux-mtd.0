From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060108141430.GJ3774@stusta.de>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
	<20060108002457.GE3774@stusta.de>
	<1136680734.30348.34.camel@pmac.infradead.org>
	<20060107174523.460f1849.akpm@osdl.org>
	<1136724072.30348.66.camel@pmac.infradead.org>
	<20060108125700.GI3774@stusta.de>
	<1136725580.30348.69.camel@pmac.infradead.org>
	<20060108141430.GJ3774@stusta.de>
Content-Type: text/plain
Date: Sun, 08 Jan 2006 14:24:40 +0000
Message-Id: <1136730280.30348.78.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-01-08 at 15:14 +0100, Adrian Bunk wrote:
> This patch removes the wrong dependency of MTD_OBSOLETE_CHIPS on BROKEN 
> and marks the non-compiling MTD_AMDSTD and MTD_JEDEC drivers as BROKEN.

Looks better; thanks.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Signed-off-by: David Woodhouse <dwmw2@infradead.org>

-- 
dwmw2
