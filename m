Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwhkF-0003tb-Iv
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 09:14:28 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j13EDnXB030529
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2005 09:13:49 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j13EDncP266134
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2005 09:13:49 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j13EDmHC000462
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2005 09:13:49 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107429877.19262.258.camel@hades.cambridge.redhat.com>
References: <20050202110715.GH27015@axis.com> <20050203095842.GA20345@axis.com>
	<1107426233.12383.46.camel@localhost.localdomain>
	<20050203105505.GB20345@axis.com>
	<1107429877.19262.258.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Thu, 03 Feb 2005 08:13:41 -0600
Message-Id: <1107440021.7780.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Device ID collision in amd_flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-03 at 11:24 +0000, David Woodhouse wrote:
> On Thu, 2005-02-03 at 11:55 +0100, Jonas Holmberg wrote:
> > It would be quite nice with a 2.4-branch that we can commit bugfixes 
> > to that could be sent to Marcelo regularly.  But if I'm the first to 
> > ask, we probably don't need it.
> 
> We have one for JFFS2. For the MTD code we probably don't need it.

Unless you finally get around to removing all the inter_module_* stuff
and use symbol_{get,put}... ;)

josh
