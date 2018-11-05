Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJg2e-0002Ka-TE
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 14:39:50 +0000
Date: Mon, 5 Nov 2018 15:39:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Danzberger <daniel@dd-wrt.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: allow multiple -(name) parts on cmdline.
Message-ID: <20181105153937.041c4dd4@bbrezillon>
In-Reply-To: <20181105133752.27480-1-daniel@dd-wrt.com>
References: <20181105133752.27480-1-daniel@dd-wrt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Rafal for the subpartition stuff

Hi Daniel,

On Mon,  5 Nov 2018 14:37:52 +0100
Daniel Danzberger <daniel@dd-wrt.com> wrote:

> This allows to specify multiple -(name) SIZE_REMAINING partitions on the
> commandline parser.
> 
> Example:
> mtdparts=physmap-flash.0:256k(uboot),128k(params),-(firmware),1966080(kernel),-(rootfs)

Now that Rafal introduced sub-partitioning support I'd prefer to go for
this solution. If I take your example, that would give something like:

mtdparts=physmap-flash.0:256k(uboot),128k(params),-(firmware);firmware:1966080(kernel),-(rootfs)

I'm not entirely sure, but I think all you'd have to do to support that
is add "cmdline" to the default_subpartition_type[] array [1] (or
simply use default_partition_type since default_subpartition_type and
default_partition_type would be the same after this change).

Regards,

Boris

[1]https://elixir.bootlin.com/linux/latest/source/drivers/mtd/mtdpart.c#L800
