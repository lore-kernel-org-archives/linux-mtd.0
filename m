Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaWtF-0005v7-L5
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 16:38:58 +0000
Received: by fxm3 with SMTP id 3so2062257fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 09:38:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Improved BB Scanning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1279059181-29300-1-git-send-email-norris@broadcom.com>
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 19:38:52 +0300
Message-Id: <1279471132.16247.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 15:12 -0700, Brian Norris wrote:
> This is a two-patch correction and update to my previous attempt
> to address a few issues with bad block scanning. Overall, they should
> help renovate some incorrect and unwieldy code.
> 
> I included the top few maintainers from get_maintainers.pl. Sorry if these
> were incorrect addressees.
> 
> Brian Norris (2):
>   mtd/nand, BB detect: factory marker in page 1, 2, last and byte 1 or 6
>   mtd/nand: More BB Detection, dynamic scan options
> 
>  drivers/mtd/nand/nand_base.c |   38 ++++++++++++++++--
>  drivers/mtd/nand/nand_bbt.c  |   89 +++++++++++++++++++++++++++++------------
>  include/linux/mtd/bbm.h      |    4 ++
>  3 files changed, 101 insertions(+), 30 deletions(-)

I did not _really_ review this, it the patches look good. How did you
test them? Did you test on both large and small page NANDs?

I pushed your patches to my l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
