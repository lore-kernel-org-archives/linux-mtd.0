Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JtRz-0002PU-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 11:09:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F252EE46074AB645B4F44947EEAD572730B5D7@mvebe001.NOE.Nokia.com> 
References: <F252EE46074AB645B4F44947EEAD572730B5D7@mvebe001.NOE.Nokia.com> 
To: Srinivasan.Ramasubramaniam@nokia.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI interface ! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 11:09:20 +0100
Message-ID: <20804.1024308560@redhat.com>
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

Srinivasan.Ramasubramaniam@nokia.com said:
> I am little confused about the CFI interface. As for as i could
> understand, it the interface for the hardware device (chip driver).
> But why is that need to different CFI file like cfi_cmdset_0001.c,
> cfi_cmdset_0002.c etc. Could anybody shed light on it. Thanks in
> advance.  

CFI only defines a common interface for _identifying_ flash. The actual 
command set used to drive writes/erases/etc is still the same for each 
manufacturer as it always was -- so the CFI standard gives them all 
'command set' numbers, and we have generic code for probing CFI-compliant 
chips, which then passes control to the _real_ commandset-specific 
drivers.

Note that because the command sets used now are identical to those of older
pre-CFI chips, we actually probe older non-CFI chips in the old way and then
just pass them into the appropriate CFI command set driver too.

--
dwmw2
