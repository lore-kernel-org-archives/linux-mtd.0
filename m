Received: from [211.233.29.62] (helo=smail-107.hanmail.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15LCKu-0002pX-00
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 00:27:04 +0100
From: "=?EUC-KR?B?wMzA58jG?=" <kingseft@hanmail.net>
Reply-To: "=?EUC-KR?B?wMzA58jG?=" <kingseft@hanmail.net>
To: <linux-mtd@lists.infradead.org>
Subject: [Question] cp result.txt  /dev/mtd0 problem
Date: Sat, 14 Jul 2001 08:28:17 +0900 (KST)
Message-Id: <20010714082817.HM.F0000000002ETLk@www16.hanmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: 8bit
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

 Hi Developers,

 I got latest MTD source code in CVS.
 and I successfully got kernel boot message from MTD .

 after booted, I tried MKDEDEV, 
 at that time, everyting is OK.

 when I followed the step in FAQ manual.
 I tried 

 cp /tmp/jffs.image  /dev/mtd0

 I got 

 cp: /dev/mtd0  Read only file system.

 I don't know how to overcome this problem..

 Could anyone suggest any tips or helps?
 Any comments will help us.

 thanks.

 kingseft@samsung.co.kr


==================================================
우리 인터넷, Daum
평생 쓰는 무료 E-mail 주소 한메일넷
지구촌 한글 검색서비스 Daum검색
http://www.daum.net
