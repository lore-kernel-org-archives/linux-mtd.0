Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGDxo-0006pl-Sc
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 10:24:17 +0100
Received: from localhost ([127.0.0.1] helo=auriga.ru)
	by mail.auriga.ru with esmtp (Exim 4.30)
	id 1BGEAC-0005BH-VQ
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 13:37:04 +0400
Message-ID: <40863DC6.4010707@auriga.ru>
Date: Wed, 21 Apr 2004 13:24:22 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: AMD & Fujitsu CFI driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

    I have troubles with current AMD & Fujitsu CFI driver. When it works 
with 2 x16 devices in 32-bit mode, it fails to correctly detect ending 
of erasure operation. Looks like that when one device reports the end of 
operation by setting all 16 its bits in 1, the other device is not done 
yet, and the code in chip_status() returns CHIP_TIMEDOUT because it 
doesn't consider such a situation.

    I wonder if there's a fix for this issue already or anybody's gonna 
fix it soon.

wbr, Dmitry
