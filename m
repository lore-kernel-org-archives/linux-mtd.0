Received: from wsip68-15-115-9.ok.ok.cox.net ([68.15.115.9] helo=mail.forestsidingsupply.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178mWo-0006LV-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 19:32:34 +0100
Date: Fri, 17 May 2002 13:32:32 -0500
To: linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what will?
Message-ID: <20020517133232.A30435@ns2.forestsidingsupply.com>
References: <3.0.32.20020517110807.0072a470@mail.i-bucks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3.0.32.20020517110807.0072a470@mail.i-bucks.com>; from jr@i-bucks.com on Fri, May 17, 2002 at 11:08:28AM -0700
From: mike@forestsidingsupply.com (Mike Mattice)
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 10:08 AM 5/17/02 -0700, Russ Dill wrote:
>there are DOC devices that plug into IDE

On Fri, May 17, 2002 at 11:08:28AM -0700, john riehl wrote:
> These are called DiskonModule  (as opposed to diskonchip).  

> The idea is that they act like an ide hard drive.   I havent used one.  I
> dont know what needs to be done, driver-wise, to actually use one.

ide-hd support in the kernel is pretty much all it needs.
use lilo or grub or whatever tickles your fancy.  it just looks
like a small hard drive.

Mike
