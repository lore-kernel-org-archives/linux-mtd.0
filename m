Received: from dns.kernelconcepts.de ([212.60.202.194]
	helo=gateway.kernelconcepts.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVqMX-0000XN-45
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 07:26:22 -0400
From: Florian Boor <florian.boor@kernelconcepts.de>
To: elvin@masteria.com.tw
In-Reply-To: <OFEAD3BCB5.CEF27553-ON48256EA8.003D7F5E@com.tw>
References: <OFEAD3BCB5.CEF27553-ON48256EA8.003D7F5E@com.tw>
Content-Type: text/plain
Message-Id: <1086261995.737.17.camel@thunder>
Mime-Version: 1.0
Date: Thu, 03 Jun 2004 13:26:36 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SAMSUNG NAND Flash (K9F1208X0B) driver support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,


>       I am porting SAMSUNG K9F1208x0b serious nand flash on my platform,
> which is arm922-based platform.
> I am using 2.4.18 arm linux kernel. I cannot find any driver in the
> driver/mtd/nand directory for nand flash of this kind.
> I am wondering if I could get driver support for the flash of this type
> from somewhere?

it is quite easy to use drivers from CVS. There is a script in CVS
repository that helps patching in latest drivers from CVS. If you intend
to use jffs2 don't forget to add the new drivers too. 

Greetings

Florian
-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: 0271-771091-14 
and the reality of tomorrow.            Fax: 0271-771091-19 
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de 

6C 44 30 4C 43 20 6B 61  16 07 0F AA E6 97 70 A8
