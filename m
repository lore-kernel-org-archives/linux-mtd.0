Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTZm2-0004pA-JG
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:23:19 +0000
Received: by fxm14 with SMTP id 14so3535540fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 06:23:16 -0700 (PDT)
Subject: Re: [PATCHv2 6/6] mtd/denali: support for cmdline partitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-7-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-7-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 16:18:58 +0300
Message-ID: <1307366338.3112.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 11:32 +0100, Jamie Iles wrote:
> Add support for command line partitioning.  This is favoured over
> platform data based partitions.
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  drivers/mtd/nand/denali.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)

I've just taken a set of patches from "Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com>" which simplify the way to use just cmdlinepart
parser, please, take a look - it is in the l2 tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
