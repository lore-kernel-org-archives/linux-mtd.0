Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HAQmo-0004yG-Bs
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 08:06:41 -0500
Message-ID: <63525.212.184.22.162.1169816792.squirrel@www.tglx.de>
In-Reply-To: <1169811593.4198.1.camel@zod.rchland.ibm.com>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
	<1169656229.3609.4.camel@sauron>
	<39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
	<1169811593.4198.1.camel@zod.rchland.ibm.com>
Date: Fri, 26 Jan 2007 14:06:32 +0100 (CET)
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: bene@linutronix.de
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, bene@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 2007-01-26 at 12:00 +0100, bene@linutronix.de wrote:
> What version of GCC is this with?
It is a ARM-Toolchain:
arm-unknown-linux-gnu-gcc (GCC) 3.4.3 (release) (CodeSourcery ARM Q3cvs 2004)
GNU ld version 2.16.91 20050627

> And do you have UBI debug enabled?
No.

#
# UBI - Unsorted block images
#
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_RESERVE=1
CONFIG_MTD_UBI_GLUEBI=y

#
# UBI debugging options
#
# CONFIG_MTD_UBI_DEBUG is not set

Bene
