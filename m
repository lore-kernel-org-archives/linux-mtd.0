Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQGUV-0002oA-Hx
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 13:25:08 +0000
Date: Wed, 19 Mar 2014 10:24:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/2] UBI: block: Remove __initdata from ubiblock_param_ops
Message-ID: <20140319132426.GB529@arch.cereza>
References: <1395225803-25037-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395225803-25037-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 19, Richard Weinberger wrote:
> You cannot mark these parameters as __initdata.
> Otherwise the data is gone upon module exit.
> 
> Fixes:
> [  172.045465] BUG: unable to handle kernel paging request at ffffffffa001db38
> [  172.046020] IP: [<ffffffff81067aa4>] destroy_params+0x24/0x50
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks for the fix!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
