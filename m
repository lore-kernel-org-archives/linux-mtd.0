Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8BTY-00008v-KF
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 13:11:49 +0000
Received: by wyb28 with SMTP id 28so3768708wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 06:11:46 -0700 (PDT)
Subject: Re: [PATCH v4] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
References: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 16:08:58 +0300
Message-ID: <1302268138.2834.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-07 at 10:40 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, exponentially back off on the size of
> the requested kernel transfer buffer until it succeeds or until the
> requested transfer buffer size falls below the page size.
> 
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
> 
>   v2: Incorporated coding style and comment feedback from Artem.
>   v3: Incorporated more feedback from Artem. Retargeted patch against
>       l2-mtd-2.6.
>   v4: Incorporated feedback from Artem about compilation on 64-bit
>       architectures.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>
> ---
>  drivers/mtd/mtdchar.c   |   50 +++++++++++++++++++++-------------------------
>  drivers/mtd/mtdcore.c   |   41 ++++++++++++++++++++++++++++++++++++++
>  fs/jffs2/scan.c         |   19 ++++++++++-------
>  include/linux/mtd/mtd.h |    2 +
>  4 files changed, 77 insertions(+), 35 deletions(-)

Ideally, you should have split this on 3 patches and send a series, but
well, I already kind of said that were the last requests, so I do not
push for this. I've just taken this to my l2-mtd-2.6.git.

But if you can, please split the patch on 3 patches:

1. Introduces mtd_kmalloc_up_to - explain the reasons we need this func.
2. Start using it in mtdcore
3. Start using it in JFFS2

This is nicer way.

But if you do not do this, I do not mind. Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
