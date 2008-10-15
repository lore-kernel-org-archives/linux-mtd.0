Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kq5mq-0004Qk-UE
	for linux-mtd@lists.infradead.org; Wed, 15 Oct 2008 12:47:37 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2626982rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Oct 2008 05:47:30 -0700 (PDT)
Message-ID: <8f6e22a70810150547w268b8485g6ee83888b8f6bc2c@mail.gmail.com>
Date: Wed, 15 Oct 2008 20:47:30 +0800
From: "zheng shi" <neversetsun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2]Will be Centralized Summary(CS) available in the future?
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

Hi all,
Can anybody tell me which one is better for mount time, CS or EBS?
If CS wins, will it be merged?

On my ARM board, a 68M file system size takes about 4sec for mounting
when EBS enabled.
Is this speed alright?
Here's myy nand flash configuration:
NAND controller r/w cycle -- 40ns
access delay for page read -- 60us

-- 
Regards, neversetsun
