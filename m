Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIU3w-0006tY-Ca
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2004 15:59:56 +0100
Received: from localhost ([127.0.0.1] helo=auriga.ru)
	by mail.auriga.ru with esmtp (Exim 4.30)
	id 1BIU3r-0003L3-Ab
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2004 18:59:51 +0400
Message-ID: <408E752B.5010802@auriga.ru>
Date: Tue, 27 Apr 2004 18:58:51 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

    nand_erase doesn't invalidate pagebuf member of nand_chip struct. It 
causes data incoherence.

wbr, Dmitry.
