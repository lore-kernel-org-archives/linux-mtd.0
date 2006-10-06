Received: from mtagate3.de.ibm.com ([195.212.29.152])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVkZV-0003mK-B7
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 03:56:57 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id k967uOsr086394
	for <linux-mtd@lists.infradead.org>; Fri, 6 Oct 2006 07:56:24 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id k967wbFD1495132
	for <linux-mtd@lists.infradead.org>; Fri, 6 Oct 2006 09:58:37 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k967uO4S011979
	for <linux-mtd@lists.infradead.org>; Fri, 6 Oct 2006 09:56:24 +0200
Subject: Re: UBI fixes
From: Frank Haverkamp <f.haverkamp@web.de>
To: dedekind@infradead.org
In-Reply-To: <1159956864.13696.25.camel@sauron>
References: <1159888850.13696.13.camel@sauron>
	<1159956864.13696.25.camel@sauron>
Content-Type: text/plain
Date: Fri, 06 Oct 2006 09:56:19 +0200
Message-Id: <1160121379.5460.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for the proposal you made available at:
> On Tue, 2006-10-03 at 18:20 +0300, Artem Bityutskiy wrote:
> > http://www.infradead.org/~dedekind/fix_and_rewrite_gluebi_and_co/

Here is my view on the changes you sent:

The idea with the command line which solves the initialization order
issue looks very good to me. We should add a kernel config option to set
a default. In my case it would the MTD named "content" which
needs to be UBInized.

It is good, that the MTD emulation (gluebi) is now a part of UBI. I
think I won't miss the notifier mechanism, nor the additional
interfaces.

I was astonished that you managed to support JFFS2/UBI with so few 
changes to the original JFFS2 code. I saw that you introduced a new
mtd->type of MTD_UBIVOLUME for the MTDs created be UBI to accomplish
this.

Nevertheless the original JFFS2/UBI support from Joern had some
important advantages which we should keep:

The gluebi-MTD supported the put_block() operation to pass blocks
back to the UBI layer. One reason for doing it was to eliminate the need
for JFFS2 to care about erasing blocks (Joern, Thomas if there were
more, please comment). If JFFS2 needs a block, it gets one from UBI, if
it wants to get rid of it, it passes it back to UBI, which can do now to
whatever is best e.g. apply wearleveling mechanisms. UBI knows best what
to do with blocks which are due to erasure. However this mechanism
introduced some more changes to JFFS2 at all the spots where blocks were
to be deleted.

The put_block() feature of an MTD is of general nature, I think. We
should probably not ty it to UBI. If an MTD has this feature JFFS2 can
exploit it in the way Joern showed in his example. Let's keep it, but
let us remove any UBI naming in that code:

	if (jffs2_has_put_block(c)) {
		jffs2_put_block(c, jeb);
		...

Let's do some discussion on the details in the chat. After we are all on
the same page, I will go ahead and change my reference platform code to
do the testing, before we officially publish the modfied changes in the
ubi-2.6.git.

Frank
