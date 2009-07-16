Received: from e8.ny.us.ibm.com ([32.97.182.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRP2V-0008SZ-Fi
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:22:26 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e8.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6GBLxxu020692
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 07:21:59 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6GBM8Qx238904
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 07:22:08 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6GBM7Ns022447
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 07:22:08 -0400
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1247742765.11353.114.camel@localhost.localdomain>
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
	<1247640750.11353.6.camel@localhost.localdomain>
	<4A5E1D1A.3090705@s5r6.in-berlin.de>
	<1247738232.11353.90.camel@localhost.localdomain>
	<1247742274.5572.8.camel@subratamodak.linux.ibm.com>
	<1247742765.11353.114.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 16 Jul 2009 16:51:49 +0530
Message-Id: <1247743313.5572.10.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-16 at 14:12 +0300, Artem Bityutskiy wrote:
> On Thu, 2009-07-16 at 16:34 +0530, Subrata Modak wrote:
> > Correct. There has been other warning fixes i have sent to LKML, where i
> > have tweaked the code to fix the compilation, but, code tweaking may not
> > be possible in this case. However , i would  still investigate.
> 
> I do not think that in _general_ it is a good idea to tweak code just
> to have gcc pleased, granted the code is correct. In this case it is
> more preferable to shut it up, e.g., using 'unitialized_var()'.

Great. I would write more description in the patch then. Thanks.

Regards--
Subrata

> 
