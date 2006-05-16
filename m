From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060516123750.GS6931@stusta.de>
References: <20060515005637.00b54560.akpm@osdl.org>
	<20060516123750.GS6931@stusta.de>
Content-Type: text/plain
Date: Tue, 16 May 2006 14:04:19 +0100
Message-Id: <1147784659.27870.43.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [-mm patch] make drivers/mtd/nand/cs553x_nand.c:cs553x_init()
	static
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-16 at 14:37 +0200, Adrian Bunk wrote:
> This patch makes the needlessly global cs553x_init() static.

NAK. That problem was inherited from another board driver which was
copied and modified. And that driver inherited it in turn... let's not
piss about with them one at a time; let's just fix them _all_ at once,
instead. And let's remove the bizarre use of '#ifdef MODULE' around the
cleanup functions while we're at it.

http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=cead4dbc03ba6eb2e35bac04439b76a0cc2286ce

-- 
dwmw2
