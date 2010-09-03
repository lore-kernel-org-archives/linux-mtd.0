Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ora9Y-0000us-Mw
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2010 17:34:21 +0000
Received: from mail69-am1 (localhost.localdomain [127.0.0.1])	by
	mail69-am1-R.bigfish.com (Postfix) with ESMTP id 5A51A628126	for
	<linux-mtd@lists.infradead.org>; Fri,  3 Sep 2010 17:34:14 +0000 (UTC)
Received: from am1ehsmhs001.bigfish.com (unknown [10.3.201.250])	by
	mail69-am1.bigfish.com (Postfix) with ESMTP id 0642B118156	for
	<linux-mtd@lists.infradead.org>; Fri,  3 Sep 2010 17:34:01 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o83HXep6008832	for <linux-mtd@lists.infradead.org>;
	Fri, 3 Sep 2010 10:33:45 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	o83HjsV2014528	for <linux-mtd@lists.infradead.org>;
	Fri, 3 Sep 2010 12:45:54 -0500 (CDT)
Date: Fri, 3 Sep 2010 12:33:38 -0500
From: Scott Wood <scottwood@freescale.com>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH 2/3][MTD] P4080/nand: Only make elbc nand driver detect
	nand flash partitions
Message-ID: <20100903123338.0884a761@schlenkerla.am.freescale.net>
In-Reply-To: <20100903114357.GC11847@oksana.dev.rtsoft.ru>
References: <1281063096-26598-1-git-send-email-tie-fei.zang@freescale.com>
	<1281063096-26598-2-git-send-email-tie-fei.zang@freescale.com>
	<20100903114357.GC11847@oksana.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: B25806@freescale.com, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	Roy Zang <tie-fei.zang@freescale.com>, B11780@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Sep 2010 15:43:57 +0400
Anton Vorontsov <cbouatmailru@gmail.com> wrote:

> On Fri, Aug 06, 2010 at 10:51:35AM +0800, Roy Zang wrote:
> [...]
> >  
> > +static struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl;
> > +
> 
> Are you sure that you want it as a global var? A bit scary change.
> 
> Oh, you probably don't need it, as you can get it from
> fsl_lbc_ctrl_dev->nand?
> 
> I wonder if Scott saw these patches? Cc'ed.

I saw many iterations of these patches. :-)

I had the same reaction to this, but during internal review it did not
seem to be the most pressing concern to focus on.

In practice, there will only be one eLBC, and properly handling multiple
devices and binding the right one across this new boundary would have
been unnecessary complexity.

-Scott
