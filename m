Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdRSQ-00043L-Ko
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 14:09:11 +0100
Date: Fri, 27 Oct 2006 15:09:46 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: mtd-utils/nandwrite: what if write fails?
In-Reply-To: <1161099240.2975.3.camel@zod.rchland.ibm.com>
Message-ID: <Pine.LNX.4.64.0610271507460.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171609400.25906@lnxricardw.se.axis.com>
	<1161099240.2975.3.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 17 Oct 2006, Josh Boyer wrote:

> pwrite can fail because of a transient error.  NAND can get soft bit
> flips that can be cleared by erasing the block.  So to mark a block bad
> without at least trying to write to it a couple of times seems a bit
> drastic.

What if erase were integrated into nandwrite (controlled by an option, not=
=20
by default), so that blocks were erased immediately prior to writing? In=20
that case a failed erase or write would really indicate a bad block.

Or have there been cases where a block fails to erase or write, but=20
recovers after a couple of erase operations? Surely such a block would be=
=20
deemed to uncertain to contain data, and should be discarded (=3D marked=20
bad) ?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
