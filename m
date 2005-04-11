Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DL4Nq-0005CV-Fn
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 15:15:43 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j3BJFiRx011452
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 15:15:44 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j3BJFiTw110754
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 15:15:44 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j3BJFiCo012498
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2005 15:15:44 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0504111509070.26633@localhost.localdomain>
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
	<f96d234e050411035522064e02@mail.gmail.com>
	<Pine.LNX.4.61.0504110725540.6265@localhost.localdomain>
	<1113238871.7520.3.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0504111509070.26633@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 11 Apr 2005 14:15:41 -0500
Message-Id: <1113246941.7520.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-11 at 15:09 -0400, Robert P. J. Day wrote:
> On Mon, 11 Apr 2005, Josh Boyer wrote:
> 
> > See drivers/mtd/maps/mphysmap.c
> 
> ah, there is no such map file in my kernel source tree 2.6.11.7, so
> that's obviously new.  CVS?

Yep.  IIRC, it should be in the latest -mm too.

josh
