Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmHKS-0006o1-1l
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 18:41:45 -0400
Received: by ug-out-1314.google.com with SMTP id m2so530399uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 15:41:42 -0700 (PDT)
From: borasah@gmail.com
To: tglx@linutronix.de
Subject: Re: NAND flash write goes wrong
Date: Fri, 11 May 2007 01:42:05 +0300
References: <200705102150.31171.borasah@gmail.com>
	<200705110037.08480.borasah@gmail.com>
	<1178835314.22481.24.camel@localhost.localdomain>
In-Reply-To: <1178835314.22481.24.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="Iso-8859-9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705110142.05663.borasah@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

> On Fri, 2007-05-11 at 00:37 +0300, borasah@gmail.com wrote:
> > jffs2: Erase block size too small (16KiB). Using virtual blocks size
> > (32KiB)
>
> ---------------------------------------------------^^^^^^^
>
> The virtual block support was removed two years ago.

Oops...

> Please use an up to date kernel.
> http://www.linux-mtd.infradead.org/source.html#kernelversions

I am using 2.6.11. Is this valid for it? 

Or I can use older mtd-utils?

--
Bora SAHIN
