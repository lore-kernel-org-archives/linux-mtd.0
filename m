From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Artem Bityutskiy'" <dedekind@infradead.org>,
	<linux-mtd@lists.infradead.org>
References: <20070201075719.15000.50015.sendpatchset@localhost.localdomain>
Subject: RE: [RFC] [PATCH take 2] JFFS2: use MTD_OOB_AUTO
Date: Fri, 2 Feb 2007 11:17:57 +0900
Message-ID: <004301c74670$60a0a250$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <20070201075719.15000.50015.sendpatchset@localhost.localdomain>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

>  
> -#define NR_OOB_SCAN_PAGES	4
> +#define NR_OOB_SCAN_PAGES 4
> +
> +/* For historical reasons we use only 12 bytes for OOB clean 
> marker */ 
> +#define OOB_CM_SIZE 12
> +
> +static struct jffs2_unknown_node oob_cleanmarker = {
> +	.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK),
> +	.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
> +	.totlen = cpu_to_je32(8)
> +};

Looks good, how about make it const?

-
> -	n.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
> -	n.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
> -	n.totlen = cpu_to_je32 (8);
> -	p = (unsigned char *) &n;
> -	b = c->oobbuf + c->fsdata_pos;
> +	p = (unsigned char *)&oob_cleanmarker;
> +	b = c->oobbuf;
>  
> -	for (i = c->fsdata_len; i; i--) {
> -		if (*b++ != *p++)
> +	for (i = 0; i < cmlen; i++)
> +		if (*b++ != *p++) {
>  			ret = 1;
> -	}
> +			break;
> +		}

Why we compare it with character pointer? just use memcmp

if (memcmp(p, b, cmlen))
	ret = 1;

Are there any reasons?

Thank you,
Kyungmin Park
