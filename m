Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HKjr-0007gH-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 09:13:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C6BA@neptune.kirkland.local> 
References: <43CB1396676FD4119F03001083FD299401A1C6BA@neptune.kirkland.local> 
To: Paul Nash <paulnash@wildseed.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Restart problems after writing to mtdblock? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Nov 2002 09:44:08 +0000
Message-ID: <20628.1038476648@passion.cambridge.redhat.com>
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

paulnash@wildseed.com said:
>   On our StrongARM board at the moment, we don't have nRESET_OUT fed
> into the flash chip.  We're investingating that, but I would like to
> knoew the root cause.

This kind of thing is usually caused by inappropriate use of drugs on the
part of the hardware designer, AFAICT.


paulnash@wildseed.com said:
> Partially answering my question, it looks like I was partly correct.
> It appears that MTD is setup to lazily delay a reset to read array
> mode until an actual read request comes along.  In my case, this is
> fatal.

> I'm wondering if a reasonable solution is to do something like install
> a reboot_notifier so I can guarantee the chip is back in Read Array
> mode. Where would be a good place to do such a thing, or if this is a
> bad idea, what is a better one?  Thanks... 

It's been discussed before. IIRC the conclusion that it wouldn't be 100% 
reliable, and it was better to fix the hardware and confiscate the drugs.

--
dwmw2
