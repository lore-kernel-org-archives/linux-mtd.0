Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2HeF-0000dB-PN
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 05:29:56 +0000
To: "Deon Carr" <Deon.Carr@Aviatnet.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: selecting UBI boot partition on startup
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn>
References: <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn>
Date: Thu, 15 Apr 2010 07:29:50 +0200
Message-Id: <20100415052950.5224CEEE8D8@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear "Deon Carr",

In message <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn> you wrote:
> 
> What is the best method of selecting UBI volume to boot from in uboot?

Store the information in U-Boot environment variables.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
If the car industry behaved like the computer industry over the  last
30  years, a Rolls-Royce would cost $5, get 300 miles per gallon, and
blow up once a year killing all passengers inside.
