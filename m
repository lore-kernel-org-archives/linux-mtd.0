Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuNq7-0005Ld-M4
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 12:06:20 +0000
Received: by yxk8 with SMTP id 8so2363040yxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 05:06:16 -0700 (PDT)
Subject: Re: [PATCH v3] drivers/mtd/nand/bcm_umi_nand.c: clean up error
	handling code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
Date: Fri, 19 Aug 2011 15:08:00 +0300
In-Reply-To: <1312964054-25266-1-git-send-email-julia@diku.dk>
References: <1312964054-25266-1-git-send-email-julia@diku.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313755685.6607.53.camel@sauron>
Mime-Version: 1.0
Cc: Scott Branden <sbranden@broadcom.com>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jiandong Zheng <jdzheng@broadcom.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-10 at 10:14 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Convert error handling code to use gotos.  At the same time, this adds
> calls to kfree and iounmap in a few cases where they were overlooked.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk> 

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
