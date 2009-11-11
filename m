Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N88Bw-0007bz-2l
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 08:04:40 +0000
Subject: Re: [PATCH v2 1/1] MTD OneNAND OMAP2/3: allow giving partition
	layout as module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1257841355-5773-2-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1257841355-5773-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1257841355-5773-2-git-send-email-ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Nov 2009 10:04:29 +0200
Message-Id: <1257926669.21596.884.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vimal.newwork@gmail.com, linux-mtd@lists.infradead.org,
	adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-10 at 10:22 +0200, Mika Korhonen wrote:
> Add module parameter "parts" to omap2-onenand driver. Parameter format is
> the same as for cmdlinepart except mtd-id must not be specified - it
> gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
> 
> This allows one to repartition the OneNAND chip and is useful for flashing
> applications that do the partitioning from scratch or want to backup and
> update the partitioning.
> 
> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>

Re-partitioning should really be an /dev/mtd0 ioctl, not a driver module
parameter. The partitioning in the mtd subsystem is bad, and needs some
re-work as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
