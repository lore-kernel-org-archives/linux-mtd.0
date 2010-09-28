Subject: Re: [PATCH 0/4] MTD: OneNAND: Fix samsung SoCs various bugs
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100927072431.GA32076@july>
References: <20100927072431.GA32076@july>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:25:39 +0300
Message-ID: <1285655139.2437.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-27 at 16:24 +0900, Kyungmin Park wrote:
> The following changes since commit 32163f4b2cef28a5aab8b226ffecfc6379a53786:
>   Al Viro (1):
>         alpha: fix usp value in multithreaded coredumps
> 
> Kyungmin Park (4):
>       MTD: OneNAND: Remove unused cmd_map at s5pc110
>       MTD: OneNAND: S5PC100: Only S5PC110 use the command map method
>       MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when HIGHMEM
>       MTD: OneNAND: S5PC110: Add timeout to prevent the endless loop
> 
>  drivers/mtd/onenand/samsung.c |   45 +++++++++++++++++++++++++++-------------
>  1 files changed, 30 insertions(+), 15 deletions(-)

Some patches are already in my l2-mtd-2.6.git tree, could you please
send the series against the l2 tree so that I could apply it?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
