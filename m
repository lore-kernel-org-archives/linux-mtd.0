Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6NES-00017e-Ju
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 10:07:09 +0000
Received: by rv-out-0708.google.com with SMTP id b17so4080076rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2008 03:07:07 -0700 (PDT)
Message-ID: <bae050c10806110238g515e426am83149b436cc81af0@mail.gmail.com>
Date: Wed, 11 Jun 2008 17:38:38 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Andre Puschmann" <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
In-Reply-To: <g2o5oo$fqe$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <g2o39t$703$1@ger.gmane.org> <484F92E5.2080207@cetrtapot.si>
	<g2o5oo$fqe$1@ger.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/11/08, Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de> wrote:
> # mount -t jffs2 /dev/mtdblock5 /mnt/flash
> mount: mounting /dev/mtdblock5 on /mnt/flash failed: Invalid argument
>
>
> But it seems like it has to do something with the block device driver
> mapping:
>
> $ head -n 2 /dev/mtdblock5 | hexdump -C
> head: /dev/mtdblock5: No such device or address

$ls linux-2.6.21/drivers/mtd/*.o
is there displaying  mtd_blkdev.o and mtdblock.o? if no, you must add
it in your .config file.


-- 
Best wishes,
Nancy
