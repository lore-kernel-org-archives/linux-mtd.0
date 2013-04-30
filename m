From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH V4 5/9] mtd: replace the hardcode with the onfi_feature()
Date: Tue, 30 Apr 2013 10:04:25 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-6-git-send-email-b32955@freescale.com>
In-Reply-To: <1366967337-5534-6-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -	*busw =3D 0;
> -	if (le16_to_cpu(p->features) & 1)
> -		*busw =3D NAND_BUSWIDTH_16;
> +
> +	*busw =3D (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS) ?
> +			NAND_BUSWIDTH_16 : 0;

Is this really needed ? you have already checked the 'onfi_version' above i=
n
nand_flash_detect_onfi() ..
	if (!chip->onfi_version) {
		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
		return 0;
	}

with regards, pekon
