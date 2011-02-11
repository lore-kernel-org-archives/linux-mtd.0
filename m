Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pntna-0007Ik-Ep
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:16:39 +0000
Received: by wwb17 with SMTP id 17so2565175wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:16:37 -0800 (PST)
Subject: Re: [PATCH] mtd/nand: move pointer dereferencing after the actual
	check in verify_bbt_descr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stanislav Fomichev <kernel@fomichev.me>
In-Reply-To: <4d505a9f.918acc0a.1584.ffffbfd6@mx.google.com>
References: <4d505a9f.918acc0a.1584.ffffbfd6@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:15:28 +0200
Message-ID: <1297433728.2760.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-07 at 23:48 +0300, Stanislav Fomichev wrote:
> Signed-off-by: Stanislav Fomichev <kernel@fomichev.me>
> ---
>  drivers/mtd/nand/nand_bbt.c |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c

Thanks, although the descriptions had a small issue - you put everything
to the subject and made it too long. I amended it a little and pushed to
l2-mtd-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
