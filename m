Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iHCu-0001uq-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 15:50:28 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000b01c1c455$cee06040$0101a8c0@dellc800> 
References: <000b01c1c455$cee06040$0101a8c0@dellc800> 
To: "Mark Meade" <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: msys process 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Mar 2002 16:01:50 +0000
Message-ID: <12115.1015344110@redhat.com>
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

mark@lakeshoremicro.com said:
>  If I may ask a (possibly dumb) question, does this UnitSizeFactor
> issue with different versions of M-Sys firmware even matter anymore
> when the M-Sys IPL/SPL is replaced with Grub?

Yes. It's related to the format of NFTL on the DiskOnChip, not to the 
bootloader/firmware.

--
dwmw2
