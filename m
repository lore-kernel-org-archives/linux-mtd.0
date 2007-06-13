Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HyRI0-0007dD-VK
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 12:45:31 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5DBjErI032724
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2007 07:45:14 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5DBjETR218826
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2007 05:45:14 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5DBjElj008790
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2007 05:45:14 -0600
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 13 Jun 2007 06:44:12 -0500
Message-Id: <1181735052.7065.57.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-13 at 11:53 +0200, Joakim Tjernlund wrote:
> Figured I should send this on its own.
> 
> Stracing a process using /dev/mtd shows that
> it sometimes hangs for a long time when pdflush is erasing
> sectors. /dev/mtd* close method calls the mtd->sync method
> which can hang for a long time(minutes).
> 
> Futher, the sync method "syncs" all flash chips. It should
> only sync the chips that a /dev/mtd* spans.
> Also, the mtdchar/mtdblock drivers does not need to
> call sync for readonly mappings.

So were you going to submit a separate patch for those issues?

josh
