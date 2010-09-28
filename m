Subject: Re: [PATCH 4/4] MTD: OneNAND: S5PC110: Add timeout to prevent the
	endless loop
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <20100927072517.GA32095@july>
References: <20100927072517.GA32095@july>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:27:34 +0300
Message-ID: <1285655254.2437.11.camel@localhost>
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

On Mon, 2010-09-27 at 16:25 +0900, Kyungmin Park wrote:
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> There's no case timeout but add it for some H/W problem or
> wrong codes implementation
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

I've pushed this patch to l2-mtd-2.6.git, but did not push patches 1-3.
Please, re-send them against the l2 tree.

Also, please note that we use "mtd:" prefix for the MTD patches, not
"MTD:".

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
