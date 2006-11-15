Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk9Wb-0006Uh-5O
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 20:25:20 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAF1PAML011289
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 20:25:10 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay02.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAF1P9pI502254
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 18:25:09 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAF1P9XC027635
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 18:25:09 -0700
Subject: RE: Mkfs.jffs2 source download....
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: KokHow.Teh@infineon.com
In-Reply-To: <5049F8BE55F36348A315EFBE6CF3438697FD3E@sinse301.ap.infineon.com>
References: <5049F8BE55F36348A315EFBE6CF3438697FD3E@sinse301.ap.infineon.com>
Content-Type: text/plain
Date: Tue, 14 Nov 2006 19:26:33 -0600
Message-Id: <1163553993.19697.31.camel@crusty.rchland.ibm.com>
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

On Wed, 2006-11-15 at 09:09 +0800, KokHow.Teh@infineon.com wrote:
> Hi;
> 
> >On Wed, 2006-11-15 at 08:56 +0800, KokHow.Teh@infineon.com wrote:
> >> Hi;
> >> 	I try to download jffs2 related source tree from
> cvs.infradead.org 
> >> server and I have the following error while trying to log into the 
> >> server:
> 
> >CVS is dead.  Use the git trees.  See
> >http://linux-mtd.infradead.org/source.html
> 
> >The kernel tree is mtd-2.6.git and the mtd-utils tree is mtd-utils.git
> 
> >josh
> 
> I am using RedHat 9.0 host and haven't installed git yet. (BTW, which
> git version should I use on RedHat 9.0?) So, apart from git, is there
> any other way that I could get the source of mkfs.jffs2?

I'm not if git will run on RH 9.  You should download it from git.or.cz
and compile it to try.  As for an alternative download location for
mtd-utils:

ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.0.1.tar.gz

josh
