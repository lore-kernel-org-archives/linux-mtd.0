Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FebaT-0003QK-GA
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 13:38:10 -0400
Date: Fri, 12 May 2006 19:38:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Message-ID: <20060512173802.GC17520@wohnheim.fh-wedel.de>
References: <E1Fea2h-0003HZ-RA@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1Fea2h-0003HZ-RA@pentafluge.infradead.org>
Cc: Jarkko Lavinen <lavinen@pentafluge.infradead.org>
Subject: Re: OneNAND: One-Time Programmable (OTP) support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 May 2006 16:59:03 +0100, Linux-MTD Mailing List wrote:
>
> +		block_cmd = 1;

[...]

> -		if (cmd == ONENAND_CMD_ERASE) {
> +		if (cmd == block_cmd) {

s/1/ONENAND_CMD_ERASE/ ?

> +			size_t tmp_retlen;
> +			int size = len;
> +
> +			ret = action(mtd, from, len, &tmp_retlen, buf);
> +
> +			buf += size;
> +			len -= size;
> +			*retlen += size;

Why do you bother declaring tmp_retlen, if you ignore its value?

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
