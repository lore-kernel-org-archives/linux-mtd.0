Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfRXx-0008Um-0p
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 11:19:58 +0000
Date: Tue, 7 Apr 2015 13:19:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Scian <rnd4@dave-tech.it>
Subject: Re: [MLC NAND]: data pattern sensivity
Message-ID: <20150407131928.350ee827@bbrezillon>
In-Reply-To: <5523B1EE.1050906@dave-tech.it>
References: <551E615D.3090804@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
 <5523B1EE.1050906@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

On Tue, 07 Apr 2015 12:31:10 +0200
Andrea Scian <rnd4@dave-tech.it> wrote:

> Il 03/04/2015 19:20, Jeff Lauruhn (jlauruhn) ha scritto:
> > I'm always glad to help out. I'm not sure I quite understand the meaning of "data pattern sensivity", but when I read it seem related to ECC code word size and Cyclicdesign.com is a good resource and in particular http://cyclicdesign.com/whitepapers/Cyclic_Design_NAND_ECC.pdf.  
> 
> Thanks for pointing out the whitepaper

I haven't read this paper yet, but according to the title I doubt it is
related to the "repeated/systematic data pattern" issue.

> 
> > If I'm off track let me know and I will keep looking.
> 
> I don't really know, but, IIUC, is something related to NAND technology
> and its impact is dependent from the specific MLC implementation.
> For sure Boris can help us in have a better understanding of this issue :-)

Actually this problem was mentioned in the Micron document I pointed
out in a previous thread ([1] page 14).
I also found a paper describing the benefit of data scrambling on MLC
chips [2].

Best Regards,

Boris

[1]http://www.bswd.com/FMS09/FMS09-T2A-Grunzke.pdf
[2]http://soc.yonsei.ac.kr/Abstract/International_journal/pdf/106_Data%20Randomization%20Scheme%20for%20Endurance%20Enhancement%20and%20Interference%20Mitigation%20of%20Multilevel%20Flash%20Memory%20Devices.pdf

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
