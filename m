Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYckq-0003v1-T9
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 10:30:25 +0000
Subject: Re: [PATCH] mtd: return -1 if verify failed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4C2D12C1.3000801@gmail.com>
References: <4C2D12C1.3000801@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 13:24:58 +0300
Message-ID: <1279016698.31639.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-07-02 at 00:12 +0200, Roel Kluin wrote:
> It should return -1 if the verify failed.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> I think this needed, correct?
> 
> diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
> index 6bc1b82..7414888 100644
> --- a/drivers/mtd/tests/mtd_pagetest.c
> +++ b/drivers/mtd/tests/mtd_pagetest.c
> @@ -358,7 +358,7 @@ static int erasecrosstest(void)
>  		printk(PRINT_PREF "verify failed!\n");
>  		errcnt += 1;
>  		ok = 0;
> -		return err;
> +		return -1;
>  	}

Yeah, I changed your patch a bit and removed the 'ok' variable
altogether. Pushed to l2-mtd-2.6.git, please, check:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/4e2ef8529d9bc2e2b96f18a1a2917bda5475f0e4

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
