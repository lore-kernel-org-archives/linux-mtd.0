Received: from mtagate3.de.ibm.com ([195.212.29.152])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IbAVF-0007ir-5o
	for linux-mtd@lists.infradead.org; Fri, 28 Sep 2007 08:43:18 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id l8S7g8TC212458
	for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2007 07:42:08 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l8S7g8l12256952
	for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2007 09:42:08 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l8S7g7lg026916
	for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2007 09:42:08 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org, haver@vnet.ibm.com
Subject: Re: [PATCH 2/4 try2] ubi-utils: migrate ubimirror
Date: Fri, 28 Sep 2007 09:41:38 +0200
References: <200709271952.06870.alexs@linux.vnet.ibm.com>
	<200709272014.35040.alexs@linux.vnet.ibm.com>
	<1190917677.14666.5.camel@august>
In-Reply-To: <1190917677.14666.5.camel@august>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709280941.38303.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank,

thanks you for taking a look at the code.

> On Thu, 2007-09-27 at 20:14 +0200, Alexander Schmidt wrote:
> > +#define MAXPATH          1024
> > 
> 
> Would it make sense to use PATH_MAX from limits.h? It is not 1024 I
> think but I guess it should serve the same purpose.
> 
> man limits.h:
> 
>        {PATH_MAX}
>               Maximum number of bytes in a pathname, including the 
>               terminating null character.

That makes sense, I will resend when I've figured out how to send
patch series which don't bounce from the mtd-list...

Regards,
Alex
