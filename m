Received: from dell6.sinamail.com ([210.68.8.9] helo=sinamail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16HM6j-0008LL-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2001 09:36:49 +0000
Message-ID: <20011221093158.4758.qmail@sinamail.com>
From: "=?big5?B?cmVnaWdhbw==?=" <regigao@sinamail.com>
Subject: =?big5?B?SkZGUyBjb21waWxlIGVycm9yIA==?=
To: <linux-mtd@lists.infradead.org>
Date: Fri, 21 Dec 2001 17:31:58 +0800
Content-Type: text/plain;charset="big5"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Make an empty file called include/linux/completion.h and make sure you've 
> got the latest version from CVS of include/linux/mtd/compatmac.h, which 
> should define it for you.

I am sure I've got the latest code from CVS .
After I create an empty file called include/linux/completion.h
I still get an error message like this
  /include/linux/jffs.h:191: field `gc_thread_comp' has incomplete type
And my kernel is 2.4.2 
Thanks !
==================================================================
新浪網．免費電子信箱  http://www.sinamail.com
