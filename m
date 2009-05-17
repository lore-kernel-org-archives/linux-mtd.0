Subject: Re: [PATCH] cfi_cmdset_0001.c: quirk for PF38F4476.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
In-Reply-To: <1242474072.30413.32.camel@brutus>
References: <1242474072.30413.32.camel@brutus>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 May 2009 10:32:58 +0300
Message-Id: <1242545578.27996.267.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	openezx-devel <openezx-devel@lists.openezx.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-05-16 at 08:41 -0300, Daniel Ribeiro wrote:
> This chip reports CFI 1.3, but the CFI PRI is like CFI 1.1. Add a quirk
> to pass probe on this chip.
> (This patch depends on "cfi_cmdset_0001.c: CFI 1.0 and CFI 1.1")
> 
> Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>

Would be good to CC Nicolas Pitre <nico@cam.org> when sending these
patches.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
