Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16K7bl-0002PT-00
	for <linux-mtd@lists.infradead.org>; Sat, 29 Dec 2001 00:44:18 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <adam.wozniak@comdev.cc>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: patch for 64 bit wide flash
Date: Fri, 28 Dec 2001 16:47:35 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFCEBCDDAA.acurtis@onz.com>
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

When we did our 64 bit patch we did not use 64 bit variables. Everything
thing was accomplished with the existing functions but making sure that the
commands issues affected all banks. The only exception to this was
do_writewords() (I think that was it). In that case the value to be written
was passed as a u32 value instead of a pointer. In that case we added
another parameter "u32 datum2" which was only used with 64 bit mode. Not
sure if this is useful but it reduced the overall impact on the code.
