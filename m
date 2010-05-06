Subject: Re: [PATCH] mtd: Remove empty mtd/mtdbdi.c and mtd/internal.h files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4BE23ADB.9090409@renesas.com>
References: <4BE23A03.1030001@renesas.com>  <4BE23ADB.9090409@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 09:34:00 +0300
Message-ID: <1273127640.3702.199.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@logfs.org>,
	dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 12:43 +0900, Shinya Kuribayashi wrote:
> Commit a33eb6b9 (Move mtd_bdi_*mappable to mtdcore.c) forgot to 'git rm'
> these files.
> 
> Cc: Joern Engel <joern@logfs.org>
> Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
> ---
>   0 files changed, 0 insertions(+), 0 deletions(-)
>   delete mode 100644 drivers/mtd/internal.h
>   delete mode 100644 drivers/mtd/mtdbdi.c
> 
> diff --git a/drivers/mtd/internal.h b/drivers/mtd/internal.h
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/drivers/mtd/mtdbdi.c b/drivers/mtd/mtdbdi.c
> deleted file mode 100644
> index e69de29..0000000

Jeff Garzik just sent a pull request which takes care of this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
