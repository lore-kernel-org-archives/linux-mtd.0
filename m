Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTnq2-0001FW-29
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 04:24:22 +0000
Received: by eyh6 with SMTP id 6so1931253eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 21:24:19 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd: add a flags for partitions which should just
	leave smth. after them
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307369056-29319-2-git-send-email-dbaryshkov@gmail.com>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
	<1307369056-29319-2-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 07:20:02 +0300
Message-ID: <1307420402.11104.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
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

On Mon, 2011-06-06 at 18:04 +0400, Dmitry Eremin-Solenikov wrote:
> +			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
> +				part->name,
> +				master->size - slave->offset, slave->mtd.size);
> +			/* register to preserve ordering */

Tweaked this patch a tiny bit, and push all 3 to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
