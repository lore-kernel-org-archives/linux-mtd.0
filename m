Received: from a143.sina.com.tw ([210.200.138.143] helo=sina.com.tw)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRRWc-0007Jm-2n
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 03:38:51 -0500
Message-ID: <20041109083203.11121.qmail@sina.com.tw>
From: "" <mjabe@sina.com.tw>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Date: Tue, 09 Nov 2004 16:32:02 +0800
Subject: combine 2 mtds into a single mtd device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The follow is my MTD partition:

 +-------------+             

 |    MTD1     | (size 3M)

 +-------------+

 | Bootloader  | (size 128K)

 +-------------+

 |    MTD2     | (size 3M)

 +-------------+

 |    MTD3     |

 +-------------+



How to combine MTD1 and MTD2 into a single mtd device?

So if I have a image(5M), wehn I do "dd" command, mtd driver

will copy 3M into MTD1 and copy 2M into MTD2.

Thanks.

===================================================================

新浪任你郵：免費 10MB 信箱+相簿+個人網頁



http://mp.sina.com.tw/help/help.html 


===================================================================
