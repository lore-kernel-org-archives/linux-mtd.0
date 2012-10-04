Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJZA7-0002jU-Q1
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 00:19:36 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: RFC : attach ubi in readonly mode
Date: Thu, 4 Oct 2012 02:18:25 +0200
References: <4F2BE3C1.8000104@parrot.com>
In-Reply-To: <4F2BE3C1.8000104@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210040218.25801.marex@denx.de>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Matthieu CASTET,

> Hi,
> 
> it could be interesting to attach ubi in read-only mode (for example
> getting ubi volume info without altering flash).
> 
> A solution to do that could be to add an argument to UBI_IOCATT ioctl.
> 
> Another solution should be to have a way to switch MTD_WRITEABLE flags.
> 
> What do you think a that ?
> 
> 
> PS : attached a proof of concept for solution 1

Did you get any further with this patches? Is it now possible to safely mount 
UBIFS in read-only mode in some way please?

Thanks!

Best regards,
Marek Vasut
