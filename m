Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Ffxj-0002B3-00
	for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2001 18:24:36 +0000
Received: from nt40server ([192.168.1.101])
	by Dual166.localdomain (8.9.3/8.9.3) with SMTP id KAA24781
	for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2001 10:34:44 -0800
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: 64-bit bus support for Strata
Date: Sun, 16 Dec 2001 10:28:42 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFMENODCAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have been looking through the archives and have found references to
patches
to support 64-bit buses. Where can I find them? While I was looking I also
noticed messages that indicated the cfi_cmdset_0001.c only supported 32 bits
buses. Is this true?

(I started with the MTD/JFFS from MontaVista)
Originally I thought that I could get this to work by manipulating the
cfi_private structure. It looks like it is going to be a little more
difficult than this. Any help would be appreciated.

PS: Our hardware configuration has 4 Intel 128Mb Stradas Flash in x16 mode.
I
just downloaded the latest version from CVS but I do not think it fixes this
problem.
