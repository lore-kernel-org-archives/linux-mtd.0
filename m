Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJSvV-0008SE-IE
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 06:13:31 -0500
Subject: Re: Why is PEB not erased before writing???
From: Thomas Gleixner <tglx@linutronix.de>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0702200311k6e063b46ia6e659277c082434@mail.gmail.com>
References: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
	<1171964069.30834.220.camel@localhost.localdomain>
	<44602.172.16.0.34.1171964998.squirrel@webmail.calsoftinc.com>
	<1171968259.30834.229.camel@localhost.localdomain>
	<6b5362aa0702200311k6e063b46ia6e659277c082434@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 20 Feb 2007 12:17:50 +0100
Message-Id: <1171970271.30834.231.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, brijesh.singh@calsoftinc.com
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-20 at 16:41 +0530, Brijesh Singh wrote:
> > Did you enable CONFIG_MTD_USERSPACE_IO ? If yes, then the behaviour is
> > clear. This is a _DEBUG_ option and bypasses the normal update
> > procedure.
>
> Yes I did enable this CONFIG_MTD_UBI_USERSPACE_IO  option.We can't
> write the device if this flag is not enabled.UBI treats the device as
> readonly.
> This  is the usual way to write UBI device,I guess.

No. It is not. It is a _DEBUG_ option. UBI has an update mechanism. See
documentation.

	tglx
