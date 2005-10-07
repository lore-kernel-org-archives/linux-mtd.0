Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENrT0-00024q-VB
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2005 08:37:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id F09025E49C7
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Oct 2005 14:36:45 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B285C4.dip0.t-ipconnect.de
	[84.178.133.196])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 0998F5E4181
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Oct 2005 14:36:45 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 7A7B61E014A
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Oct 2005 14:36:12 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 7 Oct 2005 14:36:09 +0200
References: <200510051437.11856.hs4233@mail.mn-solutions.de>
	<200510051701.54776.hs4233@mail.mn-solutions.de>
	<4344038C.3040506@mvista.com>
In-Reply-To: <4344038C.3040506@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510071436.09694.hs4233@mail.mn-solutions.de>
Subject: Re: Bug: Flash writing & suspending
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> In the meantime, get the struct mtd_info's ->resume routine called
> somehow at resume time.

Thanks, that solved my problem.


> If that's accepted, I'll send a common PXA2xx platform driver for mtd that
> adds the PM suspend/resume callbacks as discussed here recently.

Do you mean something like the sa1100-flash.c file?  Can't you re-use this 
file?
