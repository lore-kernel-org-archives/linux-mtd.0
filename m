Received: from smtpauth00.csee.onr.siteprotect.com ([64.26.60.144])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KV8E5-0002w7-8m
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 17:09:05 +0000
Message-ID: <48A9ACA8.2010009@boundarydevices.com>
Date: Mon, 18 Aug 2008 10:08:56 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>	
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>	
	<1218789997.3184.64.camel@pmac.infradead.org>	
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>	
	<1218793271.3184.77.camel@pmac.infradead.org>	
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>	
	<1218795140.3184.84.camel@pmac.infradead.org>	
	<48A5D154.2000409@boundarydevices.com>	
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>	
	<48A8B486.5070900@boundarydevices.com>
	<ac9c93b10808172340u69e24296le1bf141939cc7491@mail.gmail.com>
In-Reply-To: <ac9c93b10808172340u69e24296le1bf141939cc7491@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frans Meulenbroeks wrote:
> 2008/8/18, Troy Kisky <troy.kisky@boundarydevices.com>:
>>> +     if (nr_bits == 11) {    /* correctable error */
>>
>> This is a necessary, but NOT sufficient condition to
>>  determine that it is a 1 bit error.
> 
> The test for 11 bits is in accordance to the ST datasheet I used
> (http://www.st.com/stonline/books/pdf/docs/10123.pdf, see section
> 3.4).
> What other check do you feel should be needed.

The original check. I'll try to send you a program to demonstrate
the difference after I get off work.

Troy
