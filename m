Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9rTA-0004pB-Hu
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 00:28:35 +0000
To: Adrian Bunk <bunk@kernel.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [2.6 patch] remove broken MTD drivers
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Wed, 02 Jan 2008 01:11:40 +0200."
	<20080101231140.GF27566@does.not.exist>
Date: Wed, 02 Jan 2008 01:28:26 +0100
Sender: wd@denx.de
Message-Id: <20080102002826.574C324889@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20080101231140.GF27566@does.not.exist> you wrote:
>
> The header of ppchameleonevb.c claims it comes from info@wawnet.biz 

Argh. That's indeed ancient code.

So what should I do to fix this? Wait for Thomas' response, or port
patches here?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
A Chairman was as necessary to a Board planet  as  the  zero  was  in
mathematics, but being a zero had big disadvantages...
                         - Terry Pratchett, _The Dark Side of the Sun_
