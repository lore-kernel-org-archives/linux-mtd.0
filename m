Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2IPh-0004Xg-Vp
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 06:18:59 +0000
To: "Deon Carr" <Deon.Carr@Aviatnet.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: selecting UBI boot partition on startup
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <0687C69BF96AF349833719247B11C1CE76ED80@exchtxus2.HSTX.global.vpn>
References: <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn>
	<20100415052950.5224CEEE8D8@gemini.denx.de>
	<0687C69BF96AF349833719247B11C1CE76ED80@exchtxus2.HSTX.global.vpn>
Date: Thu, 15 Apr 2010 08:18:54 +0200
Message-Id: <20100415061854.B7757EEE8D8@gemini.denx.de>
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

please jkeep the mailing list on Cc: - others might be interested in
the answers as well.

In message <0687C69BF96AF349833719247B11C1CE76ED80@exchtxus2.HSTX.global.vpn> you wrote:
> 
> >> What is the best method of selecting UBI volume to boot from in
> >> uboot?
> 
> >Store the information in U-Boot environment variables.
> 
> This was my initial thought however I was put off by the chance of the
> environment variables getting corrupted due to power loss while writing
> to U-Boot. I guess its possible to mirror the environment variables to
> another part of flash and restore it if the crc32 check fails on
> start-up.

Redundant environment is a standard feature in U-Boot. It covers
exactly the issue you have in mind - if you have a reset or power loss
while writing the environment, U-Boot will automatically fall back to
the redudant copy and use the previously used settings.

All you have to do is to enable this feature in your board config
file.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
They say a little knowledge is a dangerous thing,  but it is not  one
half so bad as a lot of ignorance.   - Terry Pratchett, _Equal Rites_
