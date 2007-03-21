Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU0p9-0003gk-0J
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 13:25:57 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2LDPnVM018853
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 09:25:49 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2LDPmZ6056888
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 07:25:48 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2LDPmEH009209
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 07:25:48 -0600
Subject: Re: supporting flash that powers up locked
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20070319084410.GA3802@enneenne.com>
References: <20070319084410.GA3802@enneenne.com>
Content-Type: text/plain
Date: Wed, 21 Mar 2007 08:25:38 -0500
Message-Id: <1174483538.3416.38.camel@zod.rchland.ibm.com>
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

On Mon, 2007-03-19 at 09:44 +0100, Rodolfo Giometti wrote:
> Hello,
> 
> I noticed that this topic has been issued several times during last
> years. I found several solutions but no one has been reported into the
> main line.

Actually, there was one recently.  The MTD_STUPID_LOCK flag was added,
and if the chip driver sets that for a particular chip the core will
unlock them when add_mtd_device is called.

> Can you please tell me current work around? I'm using strataflash
> Intel P30.

You'd need to add a fixup to cfi_cmdset_0001.c for P30 to set that flag.
See the fixup_use_amtel_lock function in cfi_cmdset_0002.c for an
example.

josh
