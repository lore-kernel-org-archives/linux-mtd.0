Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EubOK-00060I-1Q
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 15:07:23 -0500
Message-ID: <43BD7C8E.3070708@mvista.com>
Date: Thu, 05 Jan 2006 12:07:42 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Juha_Yrj=F6l=E4?= <juha.yrjola@nokia.com>
References: <1136235272.8963.21.camel@two.research.nokia.com>
In-Reply-To: <1136235272.8963.21.camel@two.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Juha Yrjölä wrote:
> +	for (i = 0; i < oob_nr; i++) {
> +		int j;
> +
> +		for (j = 0; j < oob_size; j++) {
> +			if (data_len && is_within_clean_marker_area(c, j)) {
>  				data_len--;
>  				continue;
>  			}
> -			if (buf[i*oob_size+j] != 0xFF) {
> +			if (buf[i * oob_size + j] != 0xff) {
>  				ret = 1;

Just found a reason to use AUTOPLACE info to avoid unavailable bytes 
when checking for 0xFF in the non-cleanmarker/EBH bytes as well: there's 
at least one NAND H/W controller that generates non-0xFF ECC bytes for 
writes of all 0xFF (not sure if that's a bug), and its handy to have 
such writes continue to look like an empty page.  Anyhow, holding out 
hope for Vitaly's solution, but can send a patch if this is messing 
anybody up in the meantime.

-- 
Todd
