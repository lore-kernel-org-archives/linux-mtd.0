Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T521O-0006p9-Fd
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 22:06:31 +0000
Received: by wibhm2 with SMTP id hm2so1957979wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 15:06:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5030363F.3010505@xenotime.net>
References: <5030363F.3010505@xenotime.net>
Date: Fri, 24 Aug 2012 15:06:27 -0700
Message-ID: <CAN8TOE_+SgouYYzzCS+cdt0WzWeC-TXnkFO3ydAe_0Bv9+FQbw@mail.gmail.com>
Subject: Re: [PATCH] MTD: fix kernel-doc warning in include/linux/mtd/nand.h
From: Brian Norris <computersforpeace@gmail.com>
To: Randy Dunlap <rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 18, 2012 at 5:41 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> Fix kernel-doc warning in <linux/mtd/nand.h>:
>
> Warning(include/linux/mtd/nand.h:659): No description found for parameter 'read_byte'
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc:     David Woodhouse <dwmw2@infradead.org>
> Cc:     linux-mtd@lists.infradead.org

Acked-by: Brian Norris <computersforpeace@gmail.com>
