Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178M2M-0003Zm-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 15:15:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <008101c1fce3$ae6588b0$0200010a@WT0136> 
References: <008101c1fce3$ae6588b0$0200010a@WT0136>  <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> 
To: "Ho-Kuo Chan" <hchan@wavesat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trouble indetifying FLASH part 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 15:15:21 +0100
Message-ID: <14029.1021558521@redhat.com>
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

hchan@wavesat.com said:
> I tried printk("HKC: Raw output of flash address =0x%x\n", *(unsigned
> int*)0x8000000) but resulted in kernel panic. I'm starting to think
> this is a virtual memory problem. Do I need a TLB entry for the
> device?

Yes. That's what ioremap() does for you. But the map driver will already be
setting that up -- just call the map->copy_from function in the chip probe,
to read the first 0x40-odd bytes into a buffer, and then print them and
compare with what you expected to see.

--
dwmw2
