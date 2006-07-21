Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G3okc-0007xk-UC
	for linux-mtd@lists.infradead.org; Fri, 21 Jul 2006 07:44:44 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6L6gHLv004272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2006 02:42:18 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k6L6gJoK166296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2006 02:42:19 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k6L6gIBt026909
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2006 02:42:18 -0400
Subject: Re: how to use jff2 on UBI layer?
From: Frank Haverkamp <haver@vnet.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060720094558.GA30897@wohnheim.fh-wedel.de>
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-15
Date: Fri, 21 Jul 2006 08:42:17 +0200
Message-Id: <1153464137.5736.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, 'Marteo Tim' <tim.marteo@gmail.com>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joern,

On Thu, 2006-07-20 at 11:45 +0200, Jörn Engel wrote:

> What I
> used was a glue layer, called gluebi, that converts the UBI interface
> into an MTD interface.  But in its current form, that is still
> unacceptable, so I'm working on changing the code.

do you have an idea when you have something to try?

The change from Thomas Gleixner which enables us to write mulitple times
to a NAND page would also be very helpful too. We can put the UBI EC
header (for the erase count) and the VID hdr (volume information header)
into the same page.

If we would have those two changes, others like Kyungmin and Marteo
could start making use of UBI. I really hope that we get those changes
in the ubi-2.6.git as soon as possible.

Frank
