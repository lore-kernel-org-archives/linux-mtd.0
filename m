Received: from over.ny.us.ibm.com ([32.97.182.150])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Duebx-0006PS-2x
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2005 19:01:34 -0400
Received: from e1.ny.us.ibm.com ([192.168.1.101])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id j6ILf9MJ011744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2005 17:41:09 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j6ILeie8018681
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2005 17:40:44 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j6ILehod245832
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2005 17:40:43 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j6ILehKl015984
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2005 17:40:43 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: rolf liu <rolfliu@gmail.com>
In-Reply-To: <2db32b72050718135560ae235c@mail.gmail.com>
References: <2db32b72050718135560ae235c@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 18 Jul 2005 16:40:34 -0500
Message-Id: <1121722834.20907.0.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: boot error using /dev/mtdblock0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-18 at 13:55 -0700, rolf liu wrote:
> I am using /dev/mtdblock0 as the root, and put a jffs2 image on it.
> but when the kernel boots up, it panic:
> 
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(31,0)
> 
> Any suggestion?

Put this on your kernel command line:

rootfstype=jffs2

We really need to update the FAQ with that.  *sigh*

josh
