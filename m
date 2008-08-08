Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KRaug-0006LU-SI
	for linux-mtd@lists.infradead.org; Fri, 08 Aug 2008 22:58:27 +0000
To: jwboyer@linux.vnet.ibm.com
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [U-Boot] U-Boot and UBI
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Fri, 08 Aug 2008 14:26:56 EDT."
	<1218220016.2328.109.camel@localhost.localdomain>
Date: Sat, 09 Aug 2008 00:58:24 +0200
Sender: wd@denx.de
Message-Id: <20080808225824.138D3248BF@gemini.denx.de>
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org, arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Josh,

in message <1218220016.2328.109.camel@localhost.localdomain> you wrote:
> 
> As has been stated before by various people, IBM has added some form of
> UBI support to an older version of U-Boot.  While we would love to be
> able to forward port this to the latest version of U-Boot, we have
> simply not found the time and don't see that being the case in the near
> future.
> 
> So as an alternative, I have cleaned up the code slightly and pushed out
> a version that applies to U-Boot 1.1.6.  This way there is at least some
> form of code release that people can use as a reference.  I am not
> pushing this for inclusion into the current U-Boot, as we are well aware
> of the need for further adaptation and cleanup.
...
> The git tree can be found here:
> 
> git fetch git://git.infradead.org/users/jwboyer/u-boot.git ubi
> 
> http://git.infradead.org/users/jwboyer/u-boot.git?a=shortlog;h=refs/heads/ubi

Thanks a lot.

I guess we will pick up this work ASAP.

If anybody else has intentions to work in this area, I'd appreciate if
you contact me so we can coordinate efforts.

Thanks again.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Lead me not into temptation... I can find it myself.
