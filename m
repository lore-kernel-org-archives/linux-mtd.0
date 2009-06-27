Subject: Re: [PATCH] UBIFS: Fix integer overflow warnings
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <3f15c0091535d0ab4a1d45cbc9eb3667@localhost>
References: <3f15c0091535d0ab4a1d45cbc9eb3667@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 27 Jun 2009 14:37:09 +0300
Message-Id: <1246102629.9487.85.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-26 at 17:10 -0700, Kevin Cernekee wrote:
> This warning was observed on MIPS32 using 2.6.31-rc1 and gcc-4.2.0:
> 
> fs/ubifs/io.c: In function 'ubifs_wbuf_init':
> fs/ubifs/io.c:860: warning: integer overflow in expression
> fs/ubifs/io.c:860: warning: integer overflow in expression
> fs/ubifs/io.c:860: warning: integer overflow in expression
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Thanks for the patch,

however we there is already a fix for this. I'll send it to
Linus soon.

http://git.infradead.org/ubifs-2.6.git?a=commit;h=4804e8b700504978eb4b9397f818ba7ba1227a15

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
