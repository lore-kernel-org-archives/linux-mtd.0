Received: from fmfdns01.fm.intel.com ([132.233.247.10] helo=calliope1.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Zyw0-0001iM-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 19:10:28 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by calliope1.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.41 2001/07/09 21:06:22 root Exp $) with SMTP id SAA23168
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 18:16:23 GMT
Message-ID: <31223C0C0949D211AC3F00A0C9840935047CF084@hasmsx40.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
        "'jffs-dev@axis.com'" <jffs-dev@axis.com>
Subject: redboot partition editing
Date: Thu, 23 Aug 2001 21:16:16 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

Does anyone know of a utility/library to edit the redboot partition table
(FIS Directory) from Linux?
You see it as just another partition, so it shouldn't be very difficult to
edit it.
Getting the kernel to reread it while running off flash might be a problem
though. Any thoughts?

Thanks,
Kreso
