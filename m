Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154o8B-0006vP-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 19:22:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D99546E@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D99546E@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Found a potential bug in MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 May 2001 19:26:22 +0100
Message-ID: <26652.991160782@redhat.com>
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

fgiasson@mediatrix.com said:
> 
> 	I compiled and tested the change with my board, and it works OK.  It
> also make sense since CFI_DEVICETYPE_X8 is an hardcoded value for 8
> bits type devices, and cfi->device_type holds the buswidth specified
> in xconfig. 

The addr_unlock values set in cfi_probe_chip() are supposed to compensate
for that. We can't do it by shifting by the device_type, because sometimes 
we need to put an odd address value on the bus for 16-bit chips. 

But the actual _detection_ of CFI chips shouldn't be affected by that 
anyway, unless it's falling back to the JEDEC probe.

--
dwmw2
