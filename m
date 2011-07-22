Subject: Re: [PATCH] mtd: s3c2410 nand: Remove uncessary null check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: jhbird.choi@samsung.com
Date: Fri, 22 Jul 2011 11:27:37 +0300
In-Reply-To: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
References: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311323261.20707.13.camel@sauron>
Mime-Version: 1.0
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-21 at 15:33 +0900, jhbird.choi@samsung.com wrote:
> From: Jonghwan Choi <jhbird.choi@samsung.com>
> 
> clk_get() return a pointer to the struct clk or an ERR_PTR().
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
