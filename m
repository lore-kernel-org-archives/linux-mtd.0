Received: from web15303.mail.bjs.yahoo.com ([202.3.77.178])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q12G-0001uV-CD
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 09:32:49 +0100
Message-ID: <20030611083240.66885.qmail@web15303.mail.bjs.yahoo.com>
Date: Wed, 11 Jun 2003 16:32:40 +0800 (CST)
From: =?gb2312?q?Yy=20Yy?= <yy_hust@yahoo.com.cn>
To: linux-mtd@lists.infradead.org
In-Reply-To: <mailman.61.1055319954.2179.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Subject: Ask a question about Intel 28F128J3A flash chip.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a question about 28F128J3A chip driver.
Whether we need to erase a block of the chip before
write something on it.
In mtdchar.c, when we write a word on the flash, the
driver doesn't erase a block.



_________________________________________________________
Do You Yahoo!? 
流连网络世界的“你”是谁？
http://cn.rd.yahoo.com/mail_cn/tag/?http://cn.surveys.yahoo.com/cn_user_profile_study_may2003
