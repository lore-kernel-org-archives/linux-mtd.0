Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bLPb-0001Y8-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2001 13:22:39 +0100
Message-Id: <5.1.0.14.0.20010827074036.00a6f970@mail.spewey.com>
Date: Mon, 27 Aug 2001 07:43:01 -0500
To: wrs122@psu.edu,linux-mtd@lists.infradead.org
From: Vipin Malik <mtd-linux@embeddedlinuxworks.com>
Subject: Re: DOC2000 Linux Boot Error
In-Reply-To: <01082622441000.07707@nrl1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 10:45 PM 8/26/2001 -0400, wrs122@psu.edu wrote:
>I've been working through trying to get linux to boot from a DOC2000 chip.
>I'm running kernel 2.4.9. I get an error "kernel panic: no init found". I
>have no idea where to look to solve this problem... any ideas?

"normally", I've seen this message when the kernel could not mount its root fs.
Of course, maybe there really is no init file to run after the kernel 
mounts the fs.

Do you have a /sbin/init?

Like the David said, to determine the source of the problem you need to detail
a bit more (what are you trying to do, any relevant boot messages etc.).

Vipin
