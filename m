From: "Gupta, Pekon" <pekon@ti.com>
To: Wolfram Sang <wsa@the-dreams.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: elm: compile suspend/resume only with PM_SLEEP
Date: Wed, 23 Apr 2014 06:00:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC497C@DBDE04.ent.ti.com>
References: <1397720349-5825-1-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1397720349-5825-1-git-send-email-wsa@the-dreams.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Wolfram Sang <wsa@sang-engineering.com>
>
>Fixes:
>drivers/mtd/devices/elm.c:480:12: warning: 'elm_suspend' defined but not u=
sed [-Wunused-function]
>drivers/mtd/devices/elm.c:488:12: warning: 'elm_resume' defined but not us=
ed [-Wunused-function]
>
>Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
>---
> drivers/mtd/devices/elm.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
>index 1fd4a0f77967..0a037b15c11b 100644
>--- a/drivers/mtd/devices/elm.c
>+++ b/drivers/mtd/devices/elm.c
>@@ -418,6 +418,7 @@ static int elm_remove(struct platform_device *pdev)
> 	return 0;
> }
>
>+#ifdef CONFIG_PM_SLEEP
> /**
>  * elm_context_save
>  * saves ELM configurations to preserve them across Hardware powered-down
>@@ -509,6 +510,7 @@ static int elm_resume(struct device *dev)
> 	elm_context_restore(info);
> 	return 0;
> }
>+#endif
>
> static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
>
>--
>1.9.1
>
Acked-by: Pekon Gupta <pekon@ti.com>

I think it's safe to mark it for stable also
CC: <stable@vger.kernel.org> # 3.12.x+

with regards, pekon
