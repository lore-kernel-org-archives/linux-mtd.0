Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfcZx-0005Vo-5r
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 07:49:10 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j57Bn6Ek018079
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jun 2005 07:49:06 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j57Bn6sn250212
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jun 2005 07:49:06 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j57Bn6Ci020122
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jun 2005 07:49:06 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Munira Ahmed <munira.ahmed@radixs.com>
In-Reply-To: <1118136773.11408.50.camel@server11>
References: <1118136773.11408.50.camel@server11>
Content-Type: text/plain
Date: Tue, 07 Jun 2005 06:49:37 -0500
Message-Id: <1118144977.4821.15.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mk.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-07 at 17:32 +0800, Munira Ahmed wrote:
> Is there any manual page or tutorial on mk.jffs2 on the net. it seems
> that everything is inherently known to the community without proper
> documentation or manuals. I can't find any decent document that could
> give me a start.
> 

There isn't a man page that I know of.  And the mtd-utils "packages"
that some distributions like SuSE have aren't really packages.  They are
just tarballs of a CVS snapshot that have been put into package form.
They are almost always out of date.  The best place to get the MTD
utilities is from CVS.

As for general information about JFFS2, take a look at the following
websites:

http://sourceware.org/jffs2/
http://linux-mtd.infradead.org
http://linux-mtd.infradead.org/faq/jffs2.html

josh
