Received: from dell6.sinamail.com ([210.68.8.9] helo=sinamail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16HK5d-0008DT-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Dec 2001 07:27:34 +0000
Message-ID: <20011221072938.5457.qmail@sinamail.com>
From: "=?big5?B?cmVnaWdhbw==?=" <regigao@sinamail.com>
Subject: =?big5?B?SkZGUyBjb21waWxlIGVycm9y?=
To: <linux-mtd@lists.infradead.org>
Date: Fri, 21 Dec 2001 15:29:38 +0800
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

Hi !
I have downloaded the latest mtd code from CVS.
And I patch it into my kernel source ( 2.4.2 )
Whenever I try to compile the kernel , I get the error message
/include/linux/jffs.h:24:30: linux/completion.h: No such file or directory
/include/linux/jffs.h:191: field `gc_thread_comp' has incomplete type
make[3]: *** [jffs_fm.o] Error 1
I know the completion.h is not included until kernel 2.4.8.
How do I resolve the question ?

Thanks !
==================================================================
新浪網．免費電子信箱  http://www.sinamail.com
