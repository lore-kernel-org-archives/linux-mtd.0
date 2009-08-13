Received: from smtp-vbr16.xs4all.nl ([194.109.24.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbUVI-0006KZ-7W
	for linux-mtd@lists.infradead.org; Thu, 13 Aug 2009 07:13:44 +0000
Received: from adesys.nl (a80-126-23-145.adsl.xs4all.nl [80.126.23.145])
	by smtp-vbr16.xs4all.nl (8.13.8/8.13.8) with ESMTP id n7D7DZ6U029462
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Aug 2009 09:13:36 +0200 (CEST) (envelope-from teun@adesys.nl)
Received: from [192.168.10.106] (teun.ads.local [192.168.10.106])
	by adesys.nl (Postfix) with ESMTP id 4C0B37A4A34
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Aug 2009 09:13:35 +0200 (CEST)
Message-ID: <4A83BD1F.6070806@adesys.nl>
Date: Thu, 13 Aug 2009 09:13:35 +0200
From: Teun Grinwis <teun@adesys.nl>
MIME-Version: 1.0
To: Mtd List <linux-mtd@lists.infradead.org>
Subject: flash section set to 0x0 on jffs2 filesystem
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I use Freescale Coldfire M5208, uClinux  2.6.21, jffs2 file system.
Flash chip: spansion S29GL064A

We store an executable (z-flat) on this file system. After a certain time of successful usage, the exec
will not startup anymore and uclinux comes with following error

INFMT_FLAT: reloc outside program 0x6c006800 (0 - 0x54fa14/0x4b0b40), killing OIP-1.2.4!
OIP-1.2.4[62] killed because of sig - 11

We upload the exec, and did a hex diff with the original bin file. Discovered that a region (section) in the faulty exec. file has changed to the value 0x00.

My concern, is this an error in the Flash chip or jffs2 file system??

Question:
Are there tools/howto to check a jffs2 partition.

Suggestions are welcome. Thanks in advance for your info.

-- 

Met vriendelijke groeten / With kind regards,

Teun Grinwis
