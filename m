Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ewdfn-0004N7-9w
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 05:57:51 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1Ewdfh-0004gH-Gv
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 11:57:41 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2006011111574103332
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2006 11:57:41 +0100
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1Ewdfh-0004hb-BO
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 11:57:41 +0100
Message-ID: <43C4E4A2.9050500@inf.u-szeged.hu>
Date: Wed, 11 Jan 2006 11:57:38 +0100
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Mount problem on latest mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All!

I think we found reason of the previous mount problem! The problem is in
scan.c, where the jffs2_fill_scan_buf was replaced by
jffs2_read_flash_safe and during the replacement the 'ofs' paramater is
changed to 'buf_ofs' which is wrong.

Here is the URL where you can download the patch:
http://www.inf.u-szeged.hu/jffs2/jffs2-scan-fix.patch

If nobody complains Ferenc can commit the patch into the CVS.

Zoltan
