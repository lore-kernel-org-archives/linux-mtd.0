Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eC21o-00062J-I4
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 11:27:05 +0000
Subject: Re: [PATCH] mtd: docs: Add mention of patchwork to patch submission
 section
To: Roy Franz <rfranz@cavium.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, roy.franz@cavium.com
References: <20171107030755.17822-1-roy.franz@cavium.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c58ae260-8661-0ead-a631-6f188ae9a39c@wedev4u.fr>
Date: Tue, 7 Nov 2017 12:26:20 +0100
MIME-Version: 1.0
In-Reply-To: <20171107030755.17822-1-roy.franz@cavium.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 07/11/2017 à 04:07, Roy Franz a écrit :
> Mention that patches submitted to the mailing list are tracked in
> the MTD patchwork system.
> 
> Signed-off-by: Roy Franz <roy.franz@cavium.com>
Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

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
>  please remember to base them on the appropriate tree listed above, not Linus'
> -tree.</p>
> +tree.  Patches submitted to the mailing list are tracked in
> +<A HREF="https://patchwork.ozlabs.org/project/linux-mtd/list/">Patchwork</A>.</p>
> +
>  
>  <h3>Patch Format Guidelines</h3>
>  <p>
> 
