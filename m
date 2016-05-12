Received: from twosheds.infradead.org ([2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0wK6-0008O3-A9
 for linux-mtd@lists.infradead.org; Thu, 12 May 2016 19:31:02 +0000
Message-ID: <532adb9f7253c35c284a55994bebbedf.squirrel@twosheds.infradead.org>
In-Reply-To: <1463081155-7961-1-git-send-email-salah.triki@acm.org>
References: <1463081155-7961-1-git-send-email-salah.triki@acm.org>
Date: Thu, 12 May 2016 19:31:00 -0000
Subject: Re: [PATCH] fs: jffs2: initialize the field fs_flags
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Salah Triki" <salah.triki@acm.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, salah.triki@acm.org
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> jffs2 requires device, so the field fs_flags of the structure
> file_system_type must be initialized to FS_REQUIRES_DEV.

No, it doesn't require a device. Or even CONFIG_BLOCK.

-- 
dwmw2
