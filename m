Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17B0NY-0001ga-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 22:44:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <007401c2029f$8c95ac30$0200010a@WT0136> 
References: <007401c2029f$8c95ac30$0200010a@WT0136>  <009c01c1fce9$4415bf60$0200010a@WT0136> <008101c1fce3$ae6588b0$0200010a@WT0136> <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> <14029.1021558521@redhat.com> <19099.1021561319@redhat.com> 
To: "Ho-Kuo Chan" <hchan@wavesat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trouble indetifying FLASH part 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 May 2002 22:44:10 +0100
Message-ID: <14563.1022190250@redhat.com>
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
> Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 8
> Calling cfi_probe_chip with bus width 2, interleave 2 and device_type 16

What you have is a single chip, isn't it?

Why does it never probe for bus width 2, interleave 1 and device_type 16?

--
dwmw2
