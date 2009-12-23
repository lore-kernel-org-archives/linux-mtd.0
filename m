Received: from [212.18.0.10] (helo=mail-out.m-online.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NNKmg-0000MT-7p
	for linux-mtd@lists.infradead.org; Wed, 23 Dec 2009 06:33:26 +0000
To: Lauren Del Giudice <lauren@wyplay.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: UBI - exclude bootloader blocks from wear levelling 
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <4B2FA658.6010407@wyplay.com>
References: <4B2FA658.6010407@wyplay.com>
Date: Wed, 23 Dec 2009 07:32:42 +0100
Message-Id: <20091223063242.B63923F6EF@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Lauren Del Giudice,

In message <4B2FA658.6010407@wyplay.com> you wrote:
> I'm new to UBI... I understood that static wear levelling is applied
> accross the whole device (a NAND device in my case); If so, how can
> I exclude blocks reserved for the bootloader from wear levelling?

Why would you want to do that? You should be happy that UBI also
applies wear levelling to the bootloader storage, as this prevents
your device from bricking when read errors develop there. Keep in mind
that NAND blocks will develop read errors even if you only read them
(i. e. there is not only a limit on the number of erase cycles of such
a device, but also on the number of read cycles).

It is a great benefit if your boot loader gets loaded from a UBI
partition instead of raw NAND.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Even if you aren't in doubt, consider the mental welfare of the  per-
son who has to maintain the code after you, and who will probably put
parens in the wrong place.          - Larry Wall in the perl man page
