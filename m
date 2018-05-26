Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMV2X-0007kd-Mm
 for linux-mtd@lists.infradead.org; Sat, 26 May 2018 08:59:07 +0000
Date: Sat, 26 May 2018 10:58:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross
 <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 13/16] mtd: rawnand: qcom: minor code reorganization
 for bad block check
Message-ID: <20180526104900.139dd19b@xps13>
In-Reply-To: <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
 <1527250904-21988-14-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Abhishek,


> @@ -2141,12 +2127,10 @@ static int qcom_nandc_block_bad(struct mtd_info *=
mtd, loff_t ofs)
>  		goto err;
>  	}
> =20
> -	bbpos =3D mtd->writesize - host->cw_size * (ecc->steps - 1);
> -
> -	bad =3D nandc->data_buffer[bbpos] !=3D 0xff;
> +	bad =3D bbm_bytes_buf[0] !=3D 0xff;

BTW, as there are host->bbm_size bytes that can inform on the block
state, don't we need to check all of them?

> =20
>  	if (chip->options & NAND_BUSWIDTH_16)
> -		bad =3D bad || (nandc->data_buffer[bbpos + 1] !=3D 0xff);
> +		bad =3D bad || (bbm_bytes_buf[1] !=3D 0xff);
>  err:
>  	return bad;
>  }

Thanks,
Miqu=C3=A8l
