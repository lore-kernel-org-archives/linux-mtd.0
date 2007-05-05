Received: from an-out-0708.google.com ([209.85.132.240])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HkMxg-00010K-NU
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 12:18:21 -0400
Received: by an-out-0708.google.com with SMTP id d17so21465and
	for <linux-mtd@lists.infradead.org>;
	Sat, 05 May 2007 09:18:19 -0700 (PDT)
Message-ID: <a1e50e4b0705050918j73dfc01cnd9fdb667f19b31f1@mail.gmail.com>
Date: Sat, 5 May 2007 21:48:18 +0530
From: "Sudeep K N" <sudeep.holla@gmail.com>
To: dwmw2@infradead.org, rpurdie@openedhand.com
Subject: Spare area access information from JFFS2
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

       We are working on Nand Flash Controller which does not support
       ECC protection during Spare_Only Operation, rather it supports
       ECC protection for both Main_and_Spare area. In this regard,
       before to implement any workaround in my nand driver we want to
       know "Spare Area and Spare + Main area access sequence" from
       JFFS2 filesystem perspective during any JFFS2 operation.

       Proceeding further to observe JFFS2 Spare area access we found the
       the following:

       1. During Mount: scans the block, [erases], and writes "0x20031985"
               into the spare area on start of every block followed by another
               18 bytes which spans across multiple pages because free bytes in
               spare area is only 4
       2. Later during main page program operation our nand controller
               updates spare area ECC bytes, during this sequence we are not
               clear whether JFFS2 perform any spare operation to updates it
               meta data.
       3. Also, we want know, later the above sequence, does JFFS2 performs
               any spare only program operations.


Regards,
Sudeep
