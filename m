Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECFRG-0001v6-26
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2005 07:47:09 -0400
From: David Jander <david.jander@protonic.nl>
To: Leon Zhang <leoncamel@gmail.com>
Date: Mon, 5 Sep 2005 13:46:53 +0200
References: <1125888149.24477.32.camel@Vigor4>
	<200509050845.00348.david.jander@protonic.nl>
	<ad39a30f05090501553458af6e@mail.gmail.com>
In-Reply-To: <ad39a30f05090501553458af6e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200509051346.54202.david.jander@protonic.nl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mounting large JFFS2 causes other process to stop running!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 05 September 2005 10:55, Leon Zhang wrote:
> Hi. there.
> I confirm this bug.
> My kernel is linux-2.4.29-vrs1-pxa1-intc4-col1. and my board CPU is PXA27x,
> and the flash is on board flash.

I can't make up the MTD version out of your kernel version. Would it be the 
last CVS for 2.4.x from March 2005, or older?

> I am burned a minimum jffs2 rooffs. about 2M, only a busybox in it.
> But, if a burned a 10M size rootfs. The console respone slowly first, and
> after a while, the console will respone nonthing.

Can you turn debug-level to 1 in the jffs2 (and mtd) driver and post (relevant 
parts of) console output here? I'm not sure if I can help, but MTD developers 
might want to see what the kernel is busy with for so long.
I personally want to know if it has any relation with the architecture you are 
running on. I have had problems in the past with 2.4.x on PowerPC and older 
versions of MTD. Since I changed to CVS-march2005 I have not had any trouble, 
but I want to know more, and I need to be as sure as possible that I will not 
have any more trouble. The problem is, this kernel version is not officially 
supported anymore by mtd developers, so we are a little bit left out in the 
cold if there is trouble.

Best regards,

-- 
David Jander
Protonic Holland.
