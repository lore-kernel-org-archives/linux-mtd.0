Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XedGk-0008IK-J1
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 05:06:35 +0000
Message-ID: <543F5244.1010408@free-electrons.com>
Date: Thu, 16 Oct 2014 07:06:12 +0200
From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] mtd: orion_nand: fix error code path in probe
References: <1413296198-29486-1-git-send-email-michael.opdenacker@free-electrons.com>
 <20141014213503.GD5331@lunn.ch>
In-Reply-To: <20141014213503.GD5331@lunn.ch>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: jg1.han@samsung.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/14/2014 11:35 PM, Andrew Lunn wrote:
>
>  
>  	if (pdev->dev.of_node) {
>  		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
>  					GFP_KERNEL);
>  		if (!board) {
> -			ret = -ENOMEM;
> -			goto no_res;
> +			return -ENOMEM;
>  		}
> Doesn't this now break the coding style? No need to have the {} since
> it is a single statement.

Right, I've checked Documentation/CodingStyle, and this is just
recommended, not absolutely required. That could be the reason why
check_patch.pl didn't complain.

My v2 changes this.

Thanks!

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098
