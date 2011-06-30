Subject: Re: [PATCH] MTD: atmel_nand: fix wrong use of 0 as NULL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Thu, 30 Jun 2011 14:49:14 +0300
In-Reply-To: <1309365676-19210-1-git-send-email-nicolas.ferre@atmel.com>
References: <1309365676-19210-1-git-send-email-nicolas.ferre@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309434559.23597.174.camel@sauron>
Mime-Version: 1.0
Cc: hong.xu@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 18:41 +0200, Nicolas Ferre wrote:
> Fixing this error:
> atmel_nand.c:718:20: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
