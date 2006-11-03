Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfoK9-00017U-D0
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 20:58:32 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA31wKaR024074
	for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2006 20:58:20 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA31wKtu284188
	for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2006 20:58:20 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA31wJXN005495
	for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2006 20:58:19 -0500
Subject: Re: [PATCH] OneNAND: interrupt based wait support
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: kyungmin.park@samsung.com
In-Reply-To: <5140638.14681162513323363.JavaMail.weblogic@ep_ml21>
References: <5140638.14681162513323363.JavaMail.weblogic@ep_ml21>
Content-Type: text/plain; charset=utf-8
Date: Thu, 02 Nov 2006 19:59:13 -0600
Message-Id: <1162519153.23288.9.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-03 at 00:21 +0000, 박경민 wrote:
> MTD: OneNAND: interrupt based wait support
> 
>   We can use the two methods to wait.
>   1. polling: read interrupt status register
>   2. interrupt: use kernel ineterrupt mechanism
> 
>   To use interrupt method, you first connect onenand interrupt pin to your platform and configure interrupt properly

Just curious, but do you have an example platform you've tested this on?
It would be good to get the platform code for that as an example if
possible.

josh
