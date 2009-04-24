Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxG1C-0004x6-7Q
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 07:40:30 +0000
Subject: RE: [resending][PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimalsingh@ti.com
In-Reply-To: <19F8576C6E063C45BE387C64729E739404321C6025@dbde02.ent.ti.com>
References: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
	,<1238580110.20906.73.camel@localhost.localdomain>
	,<19F8576C6E063C45BE387C64729E73940427A869F3@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739404321C6025@dbde02.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Apr 2009 10:39:57 +0300
Message-Id: <1240558797.22645.1.camel@localhost.localdomain>
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

Hi,

On Fri, 2009-04-24 at 12:02 +0530, Singh, Vimal wrote:
> It looks like Frans is not active to this list, now a days...
> so can some one else review this patch:
> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025094.html


It did not apply. Please, send patches which can be applied.

Please, fix you e-mail. Is your address really
"IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com" ?

But I fixed both - your patch and your e-mail. Please, check your other
patches and re-send them if they are corrupted. Please, take a look at
Documentation/SubmittingPatches

I've amended your patch a little. Instead of using 'uint32_t', I
made it to be 'int'. I do not see any reason to limit the compiler
and CPU by 32 bits. I do not appreciate unreasonable usage of these
'uint32_t' and similar types, and I think 'int' is perfectly fine
in your case. Could you please verify this? It is here:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=e3b8cec094d12aabbfd77c462b1932537e1c239e

Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
