Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xifo-0001N4-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 14:28:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020725131457.GA19796@wohnheim.fh-wedel.de> 
References: <20020725131457.GA19796@wohnheim.fh-wedel.de>  <3D3FEE24.49D26D61@sgi.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Steven Hein <ssh@sgi.com>, linux-mtd@lists.infradead.org
Subject: Re: Integrating new MTD/jffs2 into 2.4.18 kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 14:28:40 +0100
Message-ID: <600.1027603720@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

joern@wohnheim.fh-wedel.de said:
>  My guess is that you need the zlib stuff in the kernel lib, you
> should have linux/lib/zlib_inflate and linux/lib/zlib_deflate in your
> source plus some modifications in arch/<yours>/config.in, lib/Makefile
> and include/linux/zlib.h. Roughly. 

ftp://ftp.??.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/linux-2.4.19-pre10-shared-zlib.bz2

And I think you may need to copy fs/jffs2/crc32.h to include/linux/crc32.h
or something similar.

--
dwmw2
