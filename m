Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 151onT-0007mk-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2001 13:28:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010521142827.A4829@psionic.de> 
References: <20010521142827.A4829@psionic.de> 
To: psionic@psionic.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: erase / interrupts 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 May 2001 13:32:34 +0100
Message-ID: <21422.990448354@redhat.com>
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


psionic@psionic.de said:
> I have two questions. First of all, what happens to the interrupts
> during an erase? Are they disabled?

That's entirely dependent on the driver. In general, interrupts _shouldn't_ 
be disabled. They aren't disabled in the cfi_cmdset_000[12] drivers.

The erase method may sleep. And it may return immediately, calling the 
erase completion callback later, from a timer. That isn't implemented yet. 
Of course, it's entirely permitted to do both.

> The other one is, what happens if the power fails during a erase/write.
> Does the init-code handle the reset of the chip?

Yes, it should do. It's up the the application to work out the the sector 
in question was partially erased and erase it properly. See the marker 
nodes in JFFS2. 

--
dwmw2
