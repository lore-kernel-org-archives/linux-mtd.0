Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcFhn-0000TY-IN
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 11:46:48 +0000
Received: by iyn15 with SMTP id 15so2263679iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 04:46:41 -0700 (PDT)
Subject: Re: [PATCH 5/6] nand_flash_detect_onfi propagate busw info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Thu, 30 Jun 2011 14:47:33 +0300
In-Reply-To: <1309105616-3609-5-git-send-email-matthieu.castet@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-5-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309434458.23597.173.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> there is a bug in nand_flash_detect_onfi, busw need to be passed
> by pointer to return it.
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

Pushed this patch to the l2 tree. It did not apply cleanly, though,
would be nice if your patches were based on l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy
