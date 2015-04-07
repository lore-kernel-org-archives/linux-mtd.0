Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfQn8-0002nU-JG
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 10:31:35 +0000
Message-ID: <5523B1EE.1050906@dave-tech.it>
Date: Tue, 07 Apr 2015 12:31:10 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: [MLC NAND]: data pattern sensivity
References: <551E615D.3090804@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 03/04/2015 19:20, Jeff Lauruhn (jlauruhn) ha scritto:
> I'm always glad to help out. I'm not sure I quite understand the meaning of "data pattern sensivity", but when I read it seem related to ECC code word size and Cyclicdesign.com is a good resource and in particular http://cyclicdesign.com/whitepapers/Cyclic_Design_NAND_ECC.pdf.  

Thanks for pointing out the whitepaper

> If I'm off track let me know and I will keep looking.

I don't really know, but, IIUC, is something related to NAND technology
and its impact is dependent from the specific MLC implementation.
For sure Boris can help us in have a better understanding of this issue :-)

BR,

-- 

Andrea SCIAN

DAVE Embedded Systems


>
>
> Jeff Lauruhn
> NAND Application Engineer
> Embedded Business Unit
> Micron Technology, Inc
>
> -----Original Message-----
> From: Andrea Scian [mailto:rnd4@dave-tech.it] 
> Sent: Friday, April 03, 2015 2:46 AM
> To: mtd_mailinglist
> Cc: Boris Brezillon; Jeff Lauruhn (jlauruhn)
> Subject: [MLC NAND]: data pattern sensivity
>
>
> Dear All,
>
> I was looking inside Boris presentation at latest ELC (nice work!) and trying to understand a bit deeper the systematic data pattern problem.
> I also did some research on this ML, looking for some details about this topic, finding not so much more the original RFC thread:
>
> http://thread.gmane.org/gmane.linux.drivers.devicetree/72230/
>
> I search for this kind of information inside various MLC NAND datasheets that I've available on my desk but I cannot find any reference on this, maybe is called in a different way or maybe I'm looking to the wrong devices (e.g. I'm currently working with some Micron NANDs MT29F32G08CBADA, MT29F32G08CBACA..)
>
> I CCed Boris and Jeff directly because maybe they can help me in better understanding the impact of this problem on some real device.
>
> TIA & BR,
>
