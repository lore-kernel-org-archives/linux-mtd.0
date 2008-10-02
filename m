Received: from el-out-1112.google.com ([209.85.162.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KlDU9-0003p7-8r
	for linux-mtd@lists.infradead.org; Thu, 02 Oct 2008 02:00:09 +0000
Received: by el-out-1112.google.com with SMTP id y26so223702ele.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Oct 2008 19:00:08 -0700 (PDT)
Message-ID: <8f6e22a70810011900x188b2d85j90d125a707a0cf09@mail.gmail.com>
Date: Thu, 2 Oct 2008 10:00:08 +0800
From: "zheng shi" <neversetsun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2] Request help on EBS option in Linux-2.6.21.5
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using JFFS2 in linux-2.6.21.5.

When I enabled JFFS2 summary support (EXPERIMENTAL) option, the EBS
mechanism did promote mount time.
But unfortunately files (size>10k) couldn't be written on flash
permanently, i.e., though cp was done, but when remount the file just
copied disappeared.

I have tried -o sync with mount option.

Is there anyone who has encountered the same problem?

BTW, my flash is 2k-page NAND flash.

-- 
Regards, neversetsun
