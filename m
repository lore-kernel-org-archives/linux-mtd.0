Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxfjR-0002gj-HT
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 12:44:30 +0000
Received: by bwz19 with SMTP id 19so6102876bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 05:44:28 -0700 (PDT)
Subject: Re: [PATCH 0/2] mtd: add BLKPG API based repartition support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1284719502-24183-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 15:42:37 +0300
Message-ID: <1284986557.5258.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-17 at 13:31 +0300, Roman Tereshonkov wrote:
> Add support for mtd repartition based on the block
>     device BLKPG interface:
>     BLKPG_ADD_PARTITION - for partition creation;
>     BLKPG_DEL_PARTITION - for partition delete
> 
>     The usage is based on BLKPG ioctl called with
>     struct blkpg_ioctl_arg argument. This structure includes the
>     reference to struct blkpg_partition discribing the
>     partition name, offset and length for partition creation
>     and partition number for its deletion.
> 
>     Disadvantage: there is no implementation for mtd
>     flags control. The flags are always borrowed from
>     the master device.
> 
> Roman Tereshonkov (2):
>   mtd: prepare partition add and del functions for ioctl requests
>   mtd: add BLKPG API based repartition support
> 
>  drivers/mtd/mtdchar.c          |   62 ++++++++++++++++-
>  drivers/mtd/mtdpart.c          |  154 +++++++++++++++++++++++++++++++++++-----
>  include/linux/mtd/partitions.h |    5 ++
>  3 files changed, 201 insertions(+), 20 deletions(-)

The patches look good. Pushed to the l2-mtd-2.6.git tree with my
signature, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
