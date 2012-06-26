Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjVxi-00047T-R0
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 13:37:47 +0000
Received: by wibhm11 with SMTP id hm11so3204544wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 06:37:44 -0700 (PDT)
Date: Tue, 26 Jun 2012 16:37:38 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 7/8] mtd: nand_bbt: use string library
Message-ID: <20120626163738.14201df3@pixies.home.jungo.com>
In-Reply-To: <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-8-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, 22 Jun 2012 16:35:44 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>  static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
>  {
> -	int i, end = 0;
> +	int end = 0;
>  	uint8_t *p = buf;
>  
>  	if (td->options & NAND_BBT_NO_OOB)
>  		return check_pattern_no_oob(buf, td);
>  
>  	end = paglen + td->offs;
> -	if (td->options & NAND_BBT_SCANEMPTY) {
> -		for (i = 0; i < end; i++) {
> -			if (p[i] != 0xff)
> -				return -1;
> -		}
> -	}
> +	if (td->options & NAND_BBT_SCANEMPTY)
> +		if (memchr_inv(p, 0xff, end))
> +			return -1;
>  	p += end;
>  

A question regarding the original code:
Why the region validated for 0xff is [0 , paglen+td->of) ?
I assume this buffer region contains the inband data. Why verify inband
data is all 0xff?
Shouldn't the region validated be [paglen , paglen+td->of) ?

Regards,
Shmulik
