Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eByqy-0001yr-P5
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 08:03:27 +0000
From: Richard Weinberger <richard@nod.at>
To: Roy Franz <rfranz@cavium.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, roy.franz@cavium.com,
 linux-mtd@lists.infradead.org, "goliath@sigma-star.at" <goliath@sigma-star.at>
Subject: Re: [PATCH] mtd: docs: Add mention of patchwork to patch submission
 section
Date: Tue, 07 Nov 2017 09:03:14 +0100
Message-ID: <53936249.URCduXZjNS@blindfold>
In-Reply-To: <20171107030755.17822-1-roy.franz@cavium.com>
References: <20171107030755.17822-1-roy.franz@cavium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 7. November 2017, 04:07:55 CET schrieb Roy Franz:
> Mention that patches submitted to the mailing list are tracked in
> the MTD patchwork system.
> 
> Signed-off-by: Roy Franz <roy.franz@cavium.com>
> ---
>  source.xml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/source.xml b/source.xml
> index a557a23..991e861 100644
> --- a/source.xml
> +++ b/source.xml
> @@ -137,7 +137,9 @@ use git if you make a habit of it.</P>
> 
>  <p>If you are sending patches to the <a href="mail.html">mailing list</a>,
>  please remember to base them on the appropriate tree listed above, not
> Linus' -tree.</p>
> +tree.  Patches submitted to the mailing list are tracked in
> +<A
> HREF="https://patchwork.ozlabs.org/project/linux-mtd/list/">Patchwork</A>.<
> /p> +
> 
>  <h3>Patch Format Guidelines</h3>
>  <p>

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
