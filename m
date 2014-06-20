Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxvOS-0004j3-I0
 for linux-mtd@lists.infradead.org; Fri, 20 Jun 2014 09:46:01 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ted Juan <ted.juan@gmail.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: devices: elm: fix elm_context_save() and
 elm_context_restore() functions
Date: Fri, 20 Jun 2014 09:45:32 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF6607@DBDE04.ent.ti.com>
References: <1403255516-28413-1-git-send-email-ted.juan@gmail.com>
 <1403256725-28983-1-git-send-email-ted.juan@gmail.com>
In-Reply-To: <1403256725-28983-1-git-send-email-ted.juan@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Liu, Yan" <yan-liu@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Ted Juan [mailto:ted.juan@gmail.com]
>
> These two function's switch case lack the 'break' that make them always r=
eturn error.
>
>Signed-off-by: Ted Juan <ted.juan@gmail.com>
>---
> drivers/mtd/devices/elm.c |    2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
>index 7df8694..b4f61c7 100644
>--- a/drivers/mtd/devices/elm.c
>+++ b/drivers/mtd/devices/elm.c
>@@ -475,6 +475,7 @@ static int elm_context_save(struct elm_info *info)
> 					ELM_SYNDROME_FRAGMENT_1 + offset);
> 			regs->elm_syndrome_fragment_0[i] =3D elm_read_reg(info,
> 					ELM_SYNDROME_FRAGMENT_0 + offset);
>+			break;
> 		default:
> 			return -EINVAL;
> 		}
>@@ -520,6 +521,7 @@ static int elm_context_restore(struct elm_info *info)
> 					regs->elm_syndrome_fragment_1[i]);
> 			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_0 + offset,
> 					regs->elm_syndrome_fragment_0[i]);
>+			break;
> 		default:
> 			return -EINVAL;
> 		}
>--
>1.7.9.5

Thanks for fixing this. Apologies, my bad, I didn't test this nicely.
Also, marking it for stable, as it might break transition to low-power mode=
s

CC: <stable@vger.kernel.org> # 3.12.x+
Acked-by: Pekon Gupta <pekon@ti.com>

with regards, pekon
