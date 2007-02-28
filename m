Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMWzC-0006kX-MG
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 22:09:27 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1SM92Wf004172
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 17:09:02 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1SM8seR125076
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 17:08:54 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1SM8rbM014853
	for <linux-mtd@lists.infradead.org>; Wed, 28 Feb 2007 17:08:54 -0500
Subject: Re: UBI Tools - problem with multiple ubi devices.
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Alexander Schmidt <alexs@linux.ibm.com>
In-Reply-To: <200702281029.34799.alexs@linux.vnet.ibm.com>
References: <Pine.LNX.4.33.0702272101240.7726-100000@arrows.demon.co.uk>
	<200702281029.34799.alexs@linux.vnet.ibm.com>
Content-Type: text/plain
Date: Wed, 28 Feb 2007 23:08:52 +0100
Message-Id: <1172700532.3904.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: John Smith <john@arrows.demon.co.uk>, linux-mtd@lists.infradead.org,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex & John,

thanks for taking care. I included it in my git. I also reworked my git
to be based on the mtd-utils.git again. I will start there now to use
the ubi branch for the changes we want to try out before Josh can take
them into the offical mtd-utils.git/ubi.

On Wed, 2007-02-28 at 10:29 +0100, Alexander Schmidt wrote:
> On Tuesday 27 February 2007, John Smith wrote:
> > In
> > GIT:      users/haver/mtd-utils.git
> > File:     ubi-utils/src/libubi.c
> > Function: get_ubi_info
> > 
> > The code counts the number of UBI volumes by looking for files called
> > 
> >   /sys/class/ubi0, /sys/class/ubi1, ...
> > 
> > but the files are actually
> > 
> >   /sys/class/ubi/ubi0, ...
> > 
> > The count starts from 1 (probably also wrong), so is usable if there is a
> > single UBI device. But if there is more than one UBI device, tools like
> > ubimkvol fail.

John, thanks for pointing this out. Feel free to send us a patch in
addition to your bug-report. If it works we can immediately include it.
Pleaes let us know if it works for you now.

> 
> Hi John,
> 
> thanks for pointing this out.

> Frank, please review and commit.
> 
Thanks, looks good to me, included.

Frank
