Received: from dns.possio.com ([62.95.65.150] helo=master.possio.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JZVL-0007oD-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 13:23:55 +0000
Received: from [62.95.65.76] by master.possio.com (NTMail 7.00.0018/NT0065.00.5d386785) with ESMTP id bzwnaaaa for linux-mtd@lists.infradead.org; Wed, 4 Dec 2002 14:54:23 +0100
Message-ID: <3DEE0882.75037D4E@possio.com>
Date: Wed, 04 Dec 2002 14:52:02 +0100
From: Stefan Thomasson <stefan.thomasson@possio.com>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Question about protection registers in intel strataflash
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

The calculation of ofs_factor does not seem to be
correct, at least not for the setup I'm using,
One 28F128j3a in word mode.

ofs_factor = cfi->interleave * cfi->device_type;
interleave is 1 (1 chip) and device_type is 2 (16 bit)

Which will lead to reads from 2*(ProtRegAddr+1) in
my case 0x202 but I know its located at 0x102.

Is the ProtRegAddr supposed to be a byte address
which need to be multiplied or is it a word address?
In 28f128j3a manual tables 20 and 21 it looks like
the same address should be used.

So I think only the cfi->interleave should be used.
