Received: from [207.164.182.47] (helo=hermes.cbnco.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhBIK-0005vv-Dy
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2004 17:28:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by hermes.cbnco.com (Postfix) with ESMTP id 85BC9164E
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jan 2004 12:26:22 -0500 (EST)
Received: from vdoukhan (porcuswine.cbnco.com [207.164.182.8])
	by hermes.cbnco.com (Postfix) with ESMTP id CBE14D5F
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jan 2004 12:26:21 -0500 (EST)
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: VD <vdoukhan@cbnco.com>
Content-Type: text/plain; format=flowed; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 15 Jan 2004 12:25:53 -0500
Message-ID: <opr1tupfh3lvf4sg@localhost>
Subject: cfi_cmdset_0002.c kaput
Reply-To: vdoukhan@cbnco.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I’m working with 2.4.20 and 2.4.23 kernels, AMD29LV641DL flash on Hitachi 
7750R processor.

Last well working version of cfi_cmdset_0002.c is 1.91 (2.4.20 or 2.4.23 
kernels)

With the latest cfi_cmdset_0002.c I have a following problem:
Kernel fails to mount JFFS2 file system:

“Chip not ready after erase suspended: status = 0x1985”

Any thoughts?

Thanks,
Vlad
