Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6Y8W-0001Y1-A8
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 12:59:53 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j22HxojI030424
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 12:59:50 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j22HxoLP053112
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 12:59:50 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j22HxoCU016339
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 12:59:50 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
In-Reply-To: <44BDAFB888F59F408FAE3CC35AB470410153FFCB@orsmsx409>
References: <44BDAFB888F59F408FAE3CC35AB470410153FFCB@orsmsx409>
Content-Type: text/plain
Date: Wed, 02 Mar 2005 11:59:03 -0600
Message-Id: <1109786344.7801.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: unable to boot JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-02 at 09:54 -0800, Keshavamurthy, Anil S wrote:
> Hi,
> 	I am trying to boot JFFS3 after applying the latest patches from
> the CVS and I am not able to boot. I am seeing
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(32,2).
> 
> Do I need to do any thing special or am I missing any thing here?
> However I am able to boot jffs2 from the same CVS tarball.

Are you using rootfstype=jffs2 on the kernel command line?  If so,
you'll need to change it to rootfstype=jffs3...

josh
