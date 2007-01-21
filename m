Date: Sun, 21 Jan 2007 11:23:47 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
Subject: Re: [-mm patch] drivers/mtd/ubi/: possible cleanups
In-Reply-To: <20070119184048.GR9093@stusta.de>
Message-ID: <Pine.LNX.4.64.0701211122480.6215@pentafluge.infradead.org>
References: <20070111222627.66bb75ab.akpm@osdl.org>
	<20070119184048.GR9093@stusta.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Andrew Morton <akpm@osdl.org>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-19 at 19:40 +0100, Adrian Bunk wrote:
This patch contains the following possible cleanups:
> - make needlessly global code static
> - remove the following unused variable:
>   - debug.c: alloc_prints
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>
I've committed this.

BTW: Do you really need that many different
>      CONFIG_MTD_UBI_DEBUG_* options?
>
The idea is to be able to switch debugging messages on/off for different 
units separately. But the number of the option may indeed be reduced - i 
will try to do this.

Thanks!

-- 
Best regards,
Artem Bityutskiy
