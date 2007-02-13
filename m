Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGzNi-0006Tr-Un
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 10:15:51 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1DFBSvx016022
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 10:11:28 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1DFBROh289860
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 10:11:27 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1DFBRdl006058
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 10:11:27 -0500
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Frank Haverkamp <haver@vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1171032000.17314.4.camel@sauron>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
	<1171026729.4884.177.camel@zod.rchland.ibm.com>
	<1171032000.17314.4.camel@sauron>
Content-Type: text/plain
Date: Tue, 13 Feb 2007 16:11:24 +0100
Message-Id: <1171379484.4094.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTDML <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, 2007-02-09 at 16:40 +0200, Artem Bityutskiy wrote:

> They should be updated because they should generate unique numbers to
> the sqnum field, do not use old 'leb_ver' stuff, because leb_ver stuff
> will go away eventually, say, in a year. Also boot-loaders should be
> eventually updated.

The 64bit nature could complicate the compare code a little, and
we are limited to those 4KiB as you know. Mhm. It should be than
a comparission of a 64bit value instead of a 32bit one.

For us it is dangerous to exchange that code, since it is in NAND
block 0 and where an interrupted write process would kill our system.
It would be good to keep the old field for backward-compatibility
reasons, so that we do not have to update this piece of the boot-code.

Frank
