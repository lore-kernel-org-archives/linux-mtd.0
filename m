Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfTRv-0005vA-Ar
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 13:21:52 +0000
Message-ID: <5523D9D5.1020109@dave-tech.it>
Date: Tue, 07 Apr 2015 15:21:25 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [MLC NAND]: data pattern sensivity
References: <551E615D.3090804@dave-tech.it>	<0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>	<5523B1EE.1050906@dave-tech.it>
 <20150407131928.350ee827@bbrezillon>
In-Reply-To: <20150407131928.350ee827@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 07/04/2015 13:19, Boris Brezillon ha scritto:
> Hi,
> 
> On Tue, 07 Apr 2015 12:31:10 +0200
> Andrea Scian <rnd4@dave-tech.it> wrote:
> 
>> Il 03/04/2015 19:20, Jeff Lauruhn (jlauruhn) ha scritto:
>>> I'm always glad to help out. I'm not sure I quite understand the meaning of "data pattern sensivity", but when I read it seem related to ECC code word size and Cyclicdesign.com is a good resource and in particular http://cyclicdesign.com/whitepapers/Cyclic_Design_NAND_ECC.pdf.  
>>
>> Thanks for pointing out the whitepaper
> 
> I haven't read this paper yet, but according to the title I doubt it is
> related to the "repeated/systematic data pattern" issue.
> 
>>
>>> If I'm off track let me know and I will keep looking.
>>
>> I don't really know, but, IIUC, is something related to NAND technology
>> and its impact is dependent from the specific MLC implementation.
>> For sure Boris can help us in have a better understanding of this issue :-)
> 
> Actually this problem was mentioned in the Micron document I pointed
> out in a previous thread ([1] page 14).

Thanks for linking this again.
I think that Jeff can help us in understanding this further.
The documents is pretty old (2009) and is about TLC only.
Does it mean that MLC are less (or not at all) affected by this issue?

> I also found a paper describing the benefit of data scrambling on MLC
> chips [2].

This one is really interesting, thanks.
IIUC, what they say is that data scrambling is always useful in NAND
flash to increase endurance (and also decrease RBER).
At the beginning I tough that it was a requirement of some specific NAND
technology

BR,

-- 

Andrea SCIAN

DAVE Embedded Systems
