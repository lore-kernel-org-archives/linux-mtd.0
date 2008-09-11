Received: from rv-out-0708.google.com ([209.85.198.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kdti3-0007vi-KG
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 21:28:16 +0000
Received: by rv-out-0708.google.com with SMTP id b17so655035rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Sep 2008 14:28:13 -0700 (PDT)
Message-ID: <8bd0f97a0809111428o168053a8n6dac603529ad3d23@mail.gmail.com>
Date: Thu, 11 Sep 2008 17:28:12 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: fundu_1999@yahoo.com
Subject: Re: Flash Mapping and gpio
In-Reply-To: <306578.90559.qm@web63402.mail.re1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <306578.90559.qm@web63402.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 11, 2008 at 16:52, Fundu wrote:
> I trying to access 256mb flash from a pripheral that can only access 128 mb.
> flash are in x16 mode and interleaved.
> A gpio is connected to A25 pin of the flash parts.
>
> Such that any of the two 128mb "areas" can be accessed.
>
> I'm trying to configure the mtd drivers such that i can do the following
>
> so when ofs 00000000 -> 07ffffff, A25(gpio)= 0
> ofs 08000000 -> 0fffffff, A25(gpio) =1
>
>
> i have added helper the following function in include/linux/cfi.h

you shouldnt go mucking about in common code.  this is what flash
mapping drivers are for.

ive already written a generic gpio one to do exactly what you want
(but it's only been tested on nommu/Blackfin so far):
http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=blob_plain;f=drivers/mtd/maps/gpio-addr-flash.c;hb=HEAD
-mike
