Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft23q-0006MP-6l
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 08:44:11 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LChqGD006834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:43:52 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k5LChql5281006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:43:52 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k5LChqI0020665
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 08:43:52 -0400
Subject: Re: [UBI] Remove autotools from ubi-utils
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
References: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 21 Jun 2006 14:43:47 +0200
Message-Id: <1150893827.6049.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I removed automake and autoconf. libubi is in this version no real
library anymore. We can change that later on. Artem said, that he
wanted to improve/rewrite the library anyhow. Now he can do without
using automake, autoconf. ubiwritevol is now renamed to ubiupdatevol.

http://git.infradead.org/?p=users/haver/mtd-utils.git;a=commit;h=a985bce4176b201d10d22036ea6b5f6d0f539e70

On Wed, 2006-06-14 at 23:02 -0500, Josh Boyer wrote:
> Take a look at the 'haver' branch of my mtd-utils tree.  It contains
> the ubi-tools import that Frank did, and the start of removing the
> autotools crap from them.
> 
> http://git.infradead.org/?p=users/jwboyer/mtd-utils;a=shortlog;h=haver
> 
> Next step would be to finish the standalone Makefiles, then add a
> couple toplevel Makefiles so that the ubi tools get built with the
> rest of the mtd-utils.

Frank
