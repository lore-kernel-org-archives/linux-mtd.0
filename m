Received: from rv-out-0910.google.com ([209.85.198.185])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ii5DR-0003Rm-GT
	for linux-mtd@lists.infradead.org; Wed, 17 Oct 2007 10:29:27 +0100
Received: by rv-out-0910.google.com with SMTP id c24so1747973rvf
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Oct 2007 02:29:11 -0700 (PDT)
Message-ID: <81885c0a0710170229h2fb17f2ey656985131e39375@mail.gmail.com>
Date: Wed, 17 Oct 2007 14:59:11 +0530
From: "Rajanikanth H.V" <rajanikanthhv@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Need information: JFFS2 mounting problem
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hello,

I am working on Intel Strata(M18 ) flash, using JFFS2 on one of the
NOR partition ceated.

During mounting, i come accross to see warning message as:
"MTD point returned len too short: 29 instead of 405"

Any inputs to debug on this issue or
Is it safe to ignore this warning message?, because file operations
are working as expected.

Regards,
Raj
