Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJQtY-0003o0-E7
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 13:20:53 +0000
Received: by bwz5 with SMTP id 5so3975864bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Nov 2010 05:20:50 -0800 (PST)
Subject: Re: [patch] UBI: release locks in check_corruption()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20101118035804.GM31724@bicker>
References: <20101118035804.GM31724@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 19 Nov 2010 15:20:23 +0200
Message-ID: <1290172823.4768.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-18 at 06:58 +0300, Dan Carpenter wrote:
> Commit 45aafd32996e27 "UBI: tighten the corrupted PEB criteria"
> introduced some return paths that didn't release the ubi->buf_mutex;
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c

Thank you, pushed to ubi-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
