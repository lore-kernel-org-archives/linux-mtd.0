Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZVTK-0001vX-3X
	for linux-mtd@lists.infradead.org; Thu, 05 Apr 2007 13:10:07 -0400
Received: by ug-out-1314.google.com with SMTP id m2so981992uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Apr 2007 10:10:03 -0700 (PDT)
Message-ID: <e81bc78a0704051010sbd13f7as3512eec13bef5f0e@mail.gmail.com>
Date: Thu, 5 Apr 2007 12:10:03 -0500
From: "Kevin Zhang" <kzhang01mail@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Is there a minimal size requirement for oobfree area?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi,

I am trying to understand if there is a size requirement for the
oobfree area. For the 512-byte nand flash, does the oobfree area have
to be at least 8 bytes?

Thanks a lot,
Kevin
