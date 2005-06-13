Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhndo-0006AJ-2N
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 08:02:11 -0400
Date: Mon, 13 Jun 2005 14:02:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sean Young <sean@mess.org>
Message-ID: <20050613120204.GA30868@wohnheim.fh-wedel.de>
References: <20050613104818.GB24387@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050613104818.GB24387@atlantis.8hz.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: inftl major number
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 June 2005 12:48:18 +0200, Sean Young wrote:
> 
> According to Documentation/devices.txt and 
> http://www.lanana.org/docs/device-list/devices-2.6+.txt the major number 
> of the inftl is 96; however the driver uses 94. 94 is already in use by 
> another driver (IBM S/390 DASD block storage). Can this by applied?
> 
> 
> Sean
> 
> diff -u -r1.6 inftl.h
> --- include/linux/mtd/inftl.h   30 Jun 2004 14:49:00 -0000      1.6
> +++ include/linux/mtd/inftl.h   13 Jun 2005 10:47:19 -0000
> @@ -20,7 +20,7 @@
>  #include <mtd/inftl-user.h>
> 
>  #ifndef INFTL_MAJOR
> -#define INFTL_MAJOR 94
> +#define INFTL_MAJOR 96
>  #endif
>  #define INFTL_PARTN_BITS 4

Looks sane.  Do you have cvs commit rights?

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
