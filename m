Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lw8vu-0005H4-Lj
	for linux-mtd@lists.infradead.org; Tue, 21 Apr 2009 05:54:33 +0000
Subject: Re: [PATCH] [MTD][NAND] fix section error in plat_nand
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thomas Chou <thomas@wytron.com.tw>
In-Reply-To: <1240288054-11396-1-git-send-email-thomas@wytron.com.tw>
References: <1240288054-11396-1-git-send-email-thomas@wytron.com.tw>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Apr 2009 08:53:51 +0300
Message-Id: <1240293231.14298.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nios2 development list <nios2-dev@sopc.et.ntust.edu.tw>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-21 at 12:27 +0800, Thomas Chou wrote:
> With CONFIG_HOTPLUG=n, the following eror occurred during link:
> local symbol 0: discarded in section `.devexit.text' from
> drivers/built-in.o
> 
> It was caused by improper section reference. The __devexit_p()
> should be added to the .remove function.
> 
> Signed-off-by: Thomas Chou <thomas@wytron.com.tw>

Taken to l2-mtd tree, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
