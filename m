Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060626220215.GI23314@stusta.de>
References: <20060626220215.GI23314@stusta.de>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:49:00 +0100
Message-Id: <1151416141.17609.140.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: juha.yrjola@solidboot.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-27 at 00:02 +0200, Adrian Bunk wrote:
> This patch makes the needlessly global mtdpart_setup() static.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> --- linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c.old 2006-06-26 23:18:39.000000000 +0200
> +++ linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c     2006-06-26 23:18:51.000000000 +0200
> @@ -346,7 +346,7 @@
>   *
>   * This function needs to be visible for bootloaders.
>   */
> -int mtdpart_setup(char *s)
> +static int mtdpart_setup(char *s) 

Patch lacks sufficient explanation. Explain the relevance of the comment
immediately above the function declaration, in the context of your
patch. Explain your decision to change the behaviour, but not change the
comment itself.

Think. Or you will be replaced with a small shell script.

-- 
dwmw2
