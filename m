Subject: Re: [PATCH] cfi_cmdset_0001.c: quirk for PF38F4476.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
In-Reply-To: <1242558137.26769.7.camel@brutus>
References: <1242558137.26769.7.camel@brutus>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 May 2009 09:03:55 +0300
Message-Id: <1242713035.15206.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>,
	openezx-devel <openezx-devel@lists.openezx.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-05-17 at 08:02 -0300, Daniel Ribeiro wrote:
> This chip reports CFI 1.3, but the CFI PRI is like CFI 1.1. Add a quirk
> to pass probe on this chip.
> (This patch depends on "cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1")
> (sent again with CC to Nicolas Pitre)
> 
> Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>

I've pushed both to l2-mtd-2.6.git. The patches did not cleanly apply,
probably because they were against an older linux code-base. Please,
verify:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
