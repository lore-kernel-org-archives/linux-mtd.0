Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.epico.si)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoiAN-0002wc-Mi
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 11:45:28 -0400
Received: from [192.168.0.3] (telperion.ee.epico.si [192.168.0.3])
	by lorien.ee.epico.si (8.12.11.20060308/8.12.11) with ESMTP id
	l4HFjCcd016408
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 17:45:13 +0200
Message-ID: <464C788A.8020209@users.sourceforge.net>
Date: Thu, 17 May 2007 17:45:14 +0200
From: Savin Zlobec <savinz@users.sourceforge.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problems with ST NAND512W3A nand flash
References: <464B17F3.9040804@users.sourceforge.net>
In-Reply-To: <464B17F3.9040804@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Savin Zlobec wrote:
> Hi All!
> 
> I am working on a AT91RM9200 based board with ST NAND512W3A2B flash.
> Kernel version is 2.6.19.7 with patches from maxim.org.za/at91_26.html.
> Everything works perfectly, except for boot time NAND chip
> identification which fails every once in a while. NAND signature
> is 0x20 0x76, but sometimes I get 0x20 0x20. My first guess was
> timing problems, but I've double checked everything and all signals
> are inside the specs. I've also tested the chip with shorter and
> longer setup, hold and pulse times for read and write, but without
> any success. Trying different kernels didn't help either.

After some debugging I found what it looks like a silicon bug
in ST NAND512W3A2B. It looks like this particular chip doesn't
handle well the ALE and CLE transitions (no R or W) when in the
middle of READID command - other commands seem not affected.
I have the nand wired to AT91RM9200 according to the datasheet -
ALE and CLE go to A21 and A22. AT91RM9200 errata #34 states that
the address bus is continuously active, even if the address is
an internal one - so A2[12] toggle often. Sometimes it happens
that signature reading gets interrupted and if there is an
transition on A2[12] ... BOOOM - No NAND device found!!!

Regards,
savin
