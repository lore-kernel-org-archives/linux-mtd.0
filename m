Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOqu-00015M-5J
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:31:37 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so4877324pde.14
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:31:14 -0800 (PST)
Date: Sat, 22 Feb 2014 18:31:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/5] mtd: nand: support the JEDEC compliant nand.
Message-ID: <20140223023112.GH11836@norris-Latitude-E6410>
References: <1392961181-20693-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392961181-20693-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 21, 2014 at 01:39:36PM +0800, Huang Shijie wrote:
> Some vendors support the JEDEC standard only, such as Toshiba.
> We can get all the information for the JEDEC parameter page, just like
> we did with the ONFI parameter page.
> 
> This patch set adds the support for the JEDEC compliant nand chips.
> 
> You can download the JEDEC standard about the NAND in the:
>     www.jedec.org
> 
> My code references to the JESD230A, August 2013, revision 1.
> 
> Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
> (Unfortuately, this ECC info of its JEDEC parameter page is zero,
>  TOSHIBA FAE confirmed that they will fix it in future.)
> 
> v2 --> v3:
> 	[1] add more comment for the new fields.
> 	[2] follow Brian's suggestions to change the parsing code.
> 
> v1 --> v2:
> 	[1] use the read_byte to replace the read_buf.

Pushed the series to l2-mtd.git. Thanks!

Brian
