Received: from [61.135.145.20] (helo=sohumx05.sohu.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17oEmV-0006tZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2002 04:00:07 +0100
Received: from mail.sohu.com (unknown [192.168.41.41])
	by sohumx05.sohu.com (Postfix) with ESMTP id 650FE576A1
	for <linux-mtd@lists.infradead.org>; Mon,  9 Sep 2002 10:59:59 +0800 (CST)
Message-ID: <2522300.1031540399081.JavaMail.postfix@mailsrv1.mail.sohu.com>
Date: Mon, 9 Sep 2002 10:59:59 +0800 (CST)
From: <jay.s@sohu.com>
To: <linux-mtd@lists.infradead.org>
Subject: re:DOC 2000 and GRUB
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
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

well, I've met the same problem as you before. I have choosed not to include the --enable-diskonchip-biosnetboot since there's no option for me to use in my bios.

later I redo the firmware with this option enabled, and I still have the problem, but I plug out the doc and boot the system from hd, when I saw the lilo option I plug in the doc and fdisk/format the doc, cp the software needed into doc. 

now I can boot the doc alone without problem, but I can't get it work along with hd, when they met, usually the grub take the first to boot and hangs.

I don't know why the problem exists, because I have another doc(someone else made it for me) which can work properly with the hd. so there's no concern about the bios, it must be concerned with the grub firmware I built. but what's wrong. yet it can work well alone.
