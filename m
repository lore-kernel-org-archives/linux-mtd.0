Subject: Re: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
References: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 10:30:16 +0300
Message-Id: <1239953416.3390.243.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-08 at 22:52 -0700, Kevin Cernekee wrote:
> New MEMERASE/MEMREADOOB/MEMWRITEOOB ioctls are needed in order to support
> 64-bit offsets into large NAND flash devices.
> 
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
> 

Kevin, are you going to re-send patches 2-4, taking into account
Arnd's and Andrew's suggestions?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
