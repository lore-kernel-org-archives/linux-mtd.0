Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Brhno-0008E1-CA
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2004 14:44:53 -0400
Received: from smartlink.ee (mail.smartlink.ee [213.180.16.242])
	(authenticated bits=0)
	by kiire.colleduc.ee (8.12.11/8.12.10) with ESMTP id i72IiiYr003472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 2 Aug 2004 21:44:45 +0300
Message-ID: <410E8B9B.3050607@smartlink.ee>
Date: Mon, 02 Aug 2004 21:44:43 +0300
From: Kalev Lember <kalev@smartlink.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DOCBoot and Millennium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I wanted to let you know that I have added support for the Diskonchip 
Millennium Plus to DOCBoot and also some minor enhancments:

1) added an option to build a BIOS extension
2) added an option to force specific DOC address

Currently is works only on Millennium Plus 16 MB devices. Support for 32 
MB is planned.

-- 
Kalev Lember
