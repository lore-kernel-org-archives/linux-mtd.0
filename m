Received: from e33.co.us.ibm.com ([32.97.110.131])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D47LM-0003AX-Rp
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2005 19:59:05 -0500
Received: from westrelay03.boulder.ibm.com (westrelay03.boulder.ibm.com
	[9.17.195.12])
	by e33.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j1O0x00D585474
	for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2005 19:59:00 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay03.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j1O0wx1V103710
	for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2005 17:58:59 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j1O0wxoZ012013
	for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2005 17:58:59 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
In-Reply-To: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
References: <44BDAFB888F59F408FAE3CC35AB47041014F9285@orsmsx409>
Content-Type: text/plain
Date: Wed, 23 Feb 2005 18:58:19 -0600
Message-Id: <1109206700.8215.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: xattr support  for JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-23 at 15:31 -0800, Keshavamurthy, Anil S wrote:
> Hi,
> 	I am new to this mailing list but would like to contribute to
> xattr for flash file system. While looking at the archive seems like
> jffs2 is just a bug fix only and any new feature development should go
> to jffs3. So here is my question.

xattr support seems to be a popular topic these days.  You might want to
take a look at this thread on the lkml:

http://lkml.org/lkml/2005/2/22/85

Lorenzo already has something started.  Perhaps the two of you could
work together.

> 1) Is JFFS3 a completely rewritten file system? If true, what stage are
> we w.r.t JFFS3? 

No, JFFS3 is a clone of JFFS2 with some minor changes and a new node
type.  The code bases will begin to differ as new features are added to
JFFS3.

> 2) Where can I find the sources for JFFS3? Sorry, if this is a stupid
> question.

It can be found in the MTD CVS tree.  It's also available in the nightly
tarballs.  See http://linux-mtd.infradead.org

josh
