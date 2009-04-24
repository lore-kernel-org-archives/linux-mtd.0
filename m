Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxHks-00072E-MZ
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 09:31:42 +0000
Subject: RE: [resending][PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Singh,
	Vimal" <IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739404321C6027@dbde02.ent.ti.com>
References: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
	,<1238580110.20906.73.camel@localhost.localdomain>
	,<19F8576C6E063C45BE387C64729E73940427A869F3@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739404321C6025@dbde02.ent.ti.com>
	,<1240558797.22645.1.camel@localhost.localdomain>
	<19F8576C6E063C45BE387C64729E739404321C6027@dbde02.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Apr 2009 12:31:01 +0300
Message-Id: <1240565461.22645.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-04-24 at 13:57 +0530, Singh, Vimal wrote:
> > in your case. Could you please verify this? It is here:
> > http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=e3b8cec094d12aabbfd77c462b1932537e1c239e
> 
> I still do not see this change in commit, this is still 'uint32_t'.

Fixed.

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=bb36f87562cb8941aec7d132351f60b8d93b93b3

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
