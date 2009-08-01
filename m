Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MX8u4-0008Kz-5C
	for linux-mtd@lists.infradead.org; Sat, 01 Aug 2009 07:21:20 +0000
To: coffee_4@infoseek.jp
From: Wolfgang Denk <wd@denx.de>
Subject: Re: =?iso-2022-jp?B?cGFydGlhbCB3cml0ZSBvZiBOT1I=?=
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <20090801115434.coffee_4@infoseek.jp>
References: <20090801115434.coffee_4@infoseek.jp>
Date: Sat, 01 Aug 2009 09:21:07 +0200
Message-Id: <20090801072107.F3DBA832E416@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear coffee_4@infoseek.jp,

In message <20090801115434.coffee_4@infoseek.jp> you wrote:
> Are there any command for partial write of NOR flash memories?
> How can i write one part of NOR flash memories?

dd if=... of=/dev/mtd... seek=...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
COBOL is for morons.                                 -- E.W. Dijkstra
