Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzly4-0002ZG-3D
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 07:16:01 +0000
Subject: Re: [PATCH] [ubifs] add update vfs super block infomation when
	remount to ro mode.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: ZhangJieJing <kzjeef@gmail.com>
In-Reply-To: <r2icf7b913c1004080000t3f7c8c15yb6cea17f0d0496b1@mail.gmail.com>
References: <r2icf7b913c1004080000t3f7c8c15yb6cea17f0d0496b1@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 10:13:11 +0300
Message-ID: <1270710791.6754.92.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-04-08 at 15:00 +0800, ZhangJieJing wrote:
> If some read/write error happens(eg.CRC error), ubifs make self a read
> only mode,
> but the vfs infomation still not update.
> This patch add this also make /proc/mounts update.
> 
> Signed-off-by: zhangjiejing <kzjeef@gmail.com>
> 
> Change-Id: I709ada21d1f6168d2e785eac389510e2b5edb2a4
> ---
>  fs/ubifs/io.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Could you please re-send this patch with CC to
linux-fsdevel@vger.kernel.org


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
