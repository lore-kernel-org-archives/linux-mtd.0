Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvm8X-00083b-PZ
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 19:43:25 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j110hIZW012711
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 19:43:18 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j110hIa6122582
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 19:43:18 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j110hILQ003714
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 19:43:18 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107217171.783.332.camel@baythorne.infradead.org>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<20050131163919.GH6694@wohnheim.fh-wedel.de>
	<1107217171.783.332.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 31 Jan 2005 18:43:08 -0600
Message-Id: <1107218589.20084.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-01 at 00:19 +0000, David Woodhouse wrote:
> On Mon, 2005-01-31 at 17:39 +0100, Jörn Engel wrote:
> > This allows different people with different taste to specify numbers
> > in various simple formats.  If you think you can improve on this,
> > please send me a patch.
> 
> It is wrong to interpret 'k' 'M' and 'G' as anything other than 10^3,
> 10^6 or 10^9 respectively. If you have to do it to support a legacy
> interface like slram, that's vaguely acceptable. No more, though.
> 

Why is slram still around?  Isn't phram supposed to replace it?  I think
once a better replacement driver has been written, the old one should be
marked deprecated and eventually removed.

josh
