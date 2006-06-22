Received: from bay110-f20.bay110.hotmail.com ([65.54.229.30] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtRBM-0000oc-HG
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 11:33:34 -0400
Message-ID: <BAY110-F20A54D6CF34E7C6E9F3338BC850@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 vs. NAND OOB.
Date: Thu, 22 Jun 2006 08:15:32 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm wondering if I can make JFFS2 not to use the OOB area on the NAND, 
because in my case, the OOB is all used by the h/w ECC. Any suggestions?

Thanks,
Han
