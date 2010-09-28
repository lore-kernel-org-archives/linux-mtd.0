Subject: Re: [PATCH v2 0/3] mtd: OneNAND: S5PC100/S5PC110 Updates
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100928102654.GA30178@july>
References: <20100928102654.GA30178@july>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 14:56:11 +0300
Message-ID: <1285674971.2437.99.camel@localhost>
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

On Tue, 2010-09-28 at 19:26 +0900, Kyungmin Park wrote:
> The following changes since commit 5e999254f1894da542e7200b968fcfeec162478e:
>   Rohit Hassan Sathyanarayan (1):
>         mtd: MLC device check in OneNAND driver
> 
> Kyungmin Park (3):
>       MTD: OneNAND: S5PC100: Only S5PC110 use the command map method
>       MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when HIGHMEM
>       MTD: OneNAND: S5PC110: Implement DMA interrupt method
> 
>  drivers/mtd/onenand/samsung.c |  118 ++++++++++++++++++++++++++++++++++++-----
>  1 files changed, 104 insertions(+), 14 deletions(-)

Pushed all 3 patches to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
