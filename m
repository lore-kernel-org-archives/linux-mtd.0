Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16LNDY-00083a-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Jan 2002 11:36:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1009664975.9699.2.camel@planck.gaussian-it.com> 
References: <1009664975.9699.2.camel@planck.gaussian-it.com> 
To: Krist van Besien <krist@vanbesien.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Which major/minor for DOC2000? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 Jan 2002 11:47:06 +0000
Message-ID: <5952.1009885626@redhat.com>
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

krist@vanbesien.org said:
>  I have been digging in the kernel Documentation and found some
> indication that I need a block device, with major 31 and minor 16. So
> I made one in the /dev/ directory on my initrd image. 

mknod /dev/nftla b 93 0
mknod /dev/nftla1 b 93 1
mknod /dev/nftla2 b 93 2

> But upon mounting I get a "device not initialised" error. I do get a
> lot of messages (repeatedly) like .... seems to be a DiskOnChip... or
> something. They scroll away to fast. And I do not get to the point
> that I can cal them back using dmesg... 

Use a serial console, or a video camera. Can you show me the config options 
you used to build the kernel?

--
dwmw2
