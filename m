Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2QjR-0000Qz-Ul
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 16:16:27 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1Q2QjQ-0001cW-CO
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 17:16:24 +0100
Received: from p4ff04ab4.dip.t-dialin.net ([79.240.74.180])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2011 17:16:24 +0100
Received: from dzu by p4ff04ab4.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2011 17:16:24 +0100
To: linux-mtd@lists.infradead.org
From: Detlev Zundel <dzu@denx.de>
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
Date: Wed, 23 Mar 2011 17:16:09 +0100
Message-ID: <m2zkolx16e.fsf@ohwell.denx.de>
References: <4D797E23.6070409@emcraft.com> <4D7F1CF3.5010301@tqsc.de>
Mime-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Markus,

> what type of chips are causing your problems?

Two 16-bit Spansion S29GL512P interleaved into 32-bit bus width.

> AFAIK in cfi_cmdset_0002 the use of max timouts from cfi query struct
> is missing (support in the per chip struct is prepared). This should
> be done first (I think).

I don't think we have this problem.  As can be seen by the link provided
in my other mail, we are suffering from recovery problems after a reset,
everything else looks normal.

> Regarding the handling of status bits you can use MERGESTATUS /
> cfi_merge_status (from linux/mtd/cfi.h)
>
> Would it be useful to send rough patches for 2.6.34 for the max timout?

It is always uselful to post patches that solve problems for some of us,
so yes please! ;)

Best wishes
  Detlev Zundel

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-40 Fax: (+49)-8142-66989-80 Email: dzu@denx.de
