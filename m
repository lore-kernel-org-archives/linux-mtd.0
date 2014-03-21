Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR3Qg-0005YM-8l
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 17:40:27 +0000
Message-ID: <1395423599.24683.56.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBI: block: Remove __initdata from ubiblock_param_ops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 21 Mar 2014 19:39:59 +0200
In-Reply-To: <1395225803-25037-1-git-send-email-richard@nod.at>
References: <1395225803-25037-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 ezequiel.garcia@free-electrons.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-03-19 at 11:43 +0100, Richard Weinberger wrote:
> You cannot mark these parameters as __initdata.
> Otherwise the data is gone upon module exit.
> 
> Fixes:
> [  172.045465] BUG: unable to handle kernel paging request at ffffffffa001db38
> [  172.046020] IP: [<ffffffff81067aa4>] destroy_params+0x24/0x50
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
