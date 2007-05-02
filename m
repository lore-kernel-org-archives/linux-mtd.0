Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjO3g-0001fX-Dx
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 19:16:29 -0400
Subject: Re: [PATCH rslib] Support non-canonical GF representations
From: Thomas Gleixner <tglx@linutronix.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
In-Reply-To: <20070502101841.B420B7F7FAB@schermpje.krocht>
References: <20070502101841.B420B7F7FAB@schermpje.krocht>
Content-Type: text/plain
Date: Thu, 03 May 2007 01:18:50 +0200
Message-Id: <1178147931.2340.40.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: david@woodhou.se, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-02 at 12:18 +0200, Segher Boessenkool wrote:
> +	if (gfpoly) {
> +		sr = 1;
> +		for (i = 0; i < rs->nn; i++) {
> +			rs->index_of[sr] = i;
> +			rs->alpha_to[i] = sr;
> +			sr <<= 1;
> +			if (sr & (1 << symsize))
> +				sr ^= gfpoly;
> +			sr &= rs->nn;
> +		}
> +	} else {
> +		sr = gffunc(0);
> +		for (i = 0; i < rs->nn; i++) {
> +			rs->index_of[sr] = i;
> +			rs->alpha_to[i] = sr;
> +			sr = gffunc(sr);
> +		}
>  	}

Hmm, please check for 

	if (!gffunc)

instead of

	if (gfpoly)

Please fix that up and add my 

Acked-by: Thomas Gleixner <tglx@linutronix,de>

	tglx
