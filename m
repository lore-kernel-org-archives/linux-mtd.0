Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178MlU-0003fh-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 16:02:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <009c01c1fce9$4415bf60$0200010a@WT0136> 
References: <009c01c1fce9$4415bf60$0200010a@WT0136>  <008101c1fce3$ae6588b0$0200010a@WT0136> <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> <14029.1021558521@redhat.com> 
To: "Ho-Kuo Chan" <hchan@wavesat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Trouble indetifying FLASH part 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Thu, 16 May 2002 16:01:59 +0100
Message-ID: <19099.1021561319@redhat.com>
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
>  The result was a continuous stream of 0xf0's. In VxWorks I get
> 0x1303434953463900 which is "..CIS59.". Does this tell you anything?

Yeah. It really does look like the chip isn't where you think it is.

Can you get Linux to boot anyway, with NFSroot or something? 

od -A x -t x1 /dev/mem | grep "13 03 43 49 53 46 39 00"

Or you could code the equivalent in the kernel.

--
dwmw2
