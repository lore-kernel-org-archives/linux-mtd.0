Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbME-0001VV-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:42:14 +0100
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: 64-bit support..what happened? 
Date: Wed, 4 Sep 2002 07:41:13 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFOEKHDLAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <31730.1031149412@redhat.com>
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

> > 2. drivers/mtd/maps/physmap.c - attempts to reference __raw_readll()
> > and __raw_writell() when in 64-bit mode. These functions/macros do not
> > exist. They would appear in include/asm/io.h. Nothing exists in the
> > MTD tree to patch this file or otherwise provide these functions.
>
> Correct. Again, this is platform-specific and you need to provide
> it. Some
> people have to play tricks with transferring all 64 bits into a
> FP register
> and storing form there, etc. It's probably best to take the stuff in
> physmap.c as merely an example, and provide your own map driver.

As you mentioned, although my architecture has a 64-bit bus, the only way to
perform a 64-bit bus access is through the floating point processor. Do you
see any reason why I couldn't just perform 2 32-bit operations?

I will take physmap.c as an example and make our own version. However good
sample code would include the proper headers if they reference conditional
defines. (slight jab...sorry) I believe that there are 3 files under map
that include the conditional compile and none of them include the proper
header file. Perhaps this just indicates that the conditional should be
moved to another file or change to use the autoconfig defines?
