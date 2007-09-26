From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>,
	"'David Woodhouse'" <dwmw2@infradead.org>
References: <1190382415.14370.207.camel@sauron>
	<1190388606.14370.212.camel@sauron>
Subject: RE: [PATCH try 2] MTD: OneNAND: fix numerous races
Date: Thu, 27 Sep 2007 08:50:48 +0900
Message-ID: <00fa01c80098$152a45a0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
In-reply-to: <1190388606.14370.212.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry for late replying.
Look good to me except one typo.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

> @@ -2052,7 +2063,12 @@ static int do_otp_write(struct mtd_info *mtd, loff_t from, size_t len,
>  	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
>  	this->wait(mtd, FL_OTPING);
> 
> -	ret = mtd->write(mtd, from, len, retlen, pbuf);
> +	ops.len = len;
> +	ops.ooblen = 0;
> +	ops.databuf = pbuf;

It should be ops.datbuf.

> +	ops.oobbuf = NULL;
> +	ret = onenand_write_ops_nolock(mtd, to, &ops);
> +	*retlen = ops.retlen;
