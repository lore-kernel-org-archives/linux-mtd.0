Subject: Re: [PATCH] txx9ndfmc: Use nand_release() to free resources
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1257172848-6282-1-git-send-email-anemo@mba.ocn.ne.jp>
References: <1257172848-6282-1-git-send-email-anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Nov 2009 11:40:38 +0200
Message-Id: <1257759638.21596.233.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-02 at 23:40 +0900, Atsushi Nemoto wrote:
> This patch fixes memory leak on chip->bbt and chip->buffers.
> 
> Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> ---
>  drivers/mtd/nand/txx9ndfmc.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Taken to the l2-mtd-2.6 tree, thanks. 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
