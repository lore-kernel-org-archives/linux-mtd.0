Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178LRl-0003WX-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 14:37:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <006401c1fcde$bc00e8c0$0200010a@WT0136> 
References: <006401c1fcde$bc00e8c0$0200010a@WT0136>  <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> 
To: "Ho-Kuo Chan" <hchan@wavesat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trouble indetifying FLASH part 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 14:37:32 +0100
Message-ID: <9456.1021556252@redhat.com>
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
>  I have also tried replacing the ioremap call in init)physmap with
> ioremap_nocache() but with no byte swapping. Should I try it with
> LE_BYTE_SWAP? 

Yes, that could be useful -- although I don't think you should have got a 
cached mapping by default, it's worth a try.

Can you make it print the contents of the region at 0x8000000 and check it
matches what you expect to be in the flash chip? Are you sure that's
supposed to be 0x8000000 and not 0x80000000?

--
dwmw2
