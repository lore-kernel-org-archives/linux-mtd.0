Subject: Re: [PATCH] MTD: OneNAND: S5PC110: Implement DMA interrupt method
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100927100143.GA17778@july>
References: <20100927100143.GA17778@july>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:28:57 +0300
Message-ID: <1285655337.2437.13.camel@localhost>
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

On Mon, 2010-09-27 at 19:01 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Implement DMA interrupt method. previous time it polls the DMA status.
> It can reduce the CPU power but decrease the performance a little.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Does not apply to the l2 tree. Also it is not clear at all whether it
depends on the previous series or it is completely independent. Please,
re-send with the other patches which I did not take yet.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
