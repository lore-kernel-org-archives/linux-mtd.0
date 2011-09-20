Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R67T5-0005TP-20
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 21:03:03 +0000
Received: by eyd9 with SMTP id 9so626276eyd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 14:02:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
References: <CAFDOyVAzYULUuJMCTAcaFjkxxnzJRudGc9219zNLH7urpCiJAw@mail.gmail.com>
Date: Tue, 20 Sep 2011 14:02:59 -0700
Message-ID: <CAN8TOE8s-DbYNWuDht0KhU3wbW-4owNHxgvv-m_mftRReUzhRg@mail.gmail.com>
Subject: Re: measuring the flash usage
From: Brian Norris <computersforpeace@gmail.com>
To: Folkert van Heusden <folkert.van.heusden@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Sep 20, 2011 at 4:22 AM, Folkert van Heusden
<folkert.van.heusden@gmail.com> wrote:
> For an embedded system I'm working on I'd like to monitor the health
> of the flash memory.
> On regular Linux systems one can look at /proc/diskstats to see how
> often the system writes to a disk. It seems though that (at least
> kernel 2.6.19) for flash these counters are not updated.

I don't have much experience with the /proc/diskstats but for me, it
at least lists the mtdblockX devices I have on my system (which I
don't use). If you use those (for instance, for JFFS2?), then I would
imagine that Linux will track stats as with other block devices. Is
this not your experience?

> So I was wondering: are there any other ways?
> E.g. will the kernel log a message when it has problems writing
> to/reading from the flash memory? Are there any other counters
> anywhere?

Generally, MTD is pretty good at printing important messages, which
should get logged by your system. Also, bitflips/ECC errors can be
tracked with ioctl(ECCGETSTATS). This info is retrieved, for example,
by nanddump.

Others can probably comment better on other methods for tracking
health. Hope this helps.

Brian
