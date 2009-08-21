Received: from mail-pz0-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeNg9-0007Vv-2B
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 06:32:54 +0000
Received: by pzk2 with SMTP id 2so49636pzk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Aug 2009 23:32:46 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Aug 2009 12:02:46 +0530
Message-ID: <630851df0908202332ma1b7e15s9c3dda3cadeb0180@mail.gmail.com>
Subject: significance of 'oobofs' field in MTD_OOB_AUTO mode!!!
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, can anyone explain me what is the significance of sending the
'oobofs' filed otherthan '0' in 'MTD_OOB_AUTO' mode.
Because in mtd tests, one of the test case (mtd_oobtest.c) is trying
to send different 'oobofs' filed set other than '0' in AUTO mode.

I feel 'oobofs' is significant in only 'MTD_OOB_PLACE' mode.

I appreciate for your help.


-- 
Thanks & Regards,
Murali N
