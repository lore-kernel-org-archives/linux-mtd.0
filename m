Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM147-00064i-Aq
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:22:28 +0000
Received: by bwz5 with SMTP id 5so2062300bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 08:22:26 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: nand: add check for out of page read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Liu <r64343@freescale.com>
In-Reply-To: <1290156045-11719-1-git-send-email-r64343@freescale.com>
References: <1290156045-11719-1-git-send-email-r64343@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:21:53 +0200
Message-ID: <1290788513.2552.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-19 at 16:40 +0800, Jason Liu wrote:
> When run mtd_oobtest case, there will be one error for step(4),
> which turned out it need add one check for out of page read in
> nand_do_read_oob just like mtd_do_write_oob did it already.
> This commit also fix one typo error for comments in mtd_do_write_oob
> 
> Signed-off-by: Jason Liu <r64343@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
