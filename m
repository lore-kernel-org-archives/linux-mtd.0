Received: from bay10-f7.bay10.hotmail.com ([64.4.37.7] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuoK8-0003xy-Iu
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 05:23:47 -0400
Message-ID: <BAY10-F7554CA2A8F9F17162D496E8D40@phx.gbl>
From: =?gb2312?B?1dQgtrm2uQ==?= <zhao_fusheng@hotmail.com>
To: tglx@linutronix.de
Date: Tue, 19 Jul 2005 17:03:30 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: A question about flash_eraseall
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, tglx

I noticed that current flash_eraseall haven't taken data_flash into
consideration. The clean_marker_size of data_flash is 0. Do we need
to modify flash_eraseall to support data_flash?

Thanks,
Forrest

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn  
