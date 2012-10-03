Received: from mail.bmail.ru ([194.67.1.203] helo=sovam.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJUjP-0003ol-18
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2012 19:35:43 +0000
Received: from 95-27-144-207.broadband.corbina.ru (account bas@bmail.ru
 [95.27.144.207] verified)
 by mail-fe04.sovam.com (CommuniGate Pro SMTP 5.2.20)
 with ESMTPSA id 141939798 for linux-mtd@lists.infradead.org;
 Wed, 03 Oct 2012 23:30:31 +0400
Date: Wed, 3 Oct 2012 23:30:29 +0400 (MSK)
From: kyak <bas@bmail.ru>
To: linux-mtd@lists.infradead.org
Subject: output file cannot be in the UBIFS root directory check is not
 working quite well
Message-ID: <alpine.LNX.2.02.1210032322590.1375@bas>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Consider the following sequence of commands:

cd ~
mkdir -p /tmp/wtf/wtf1
chmod u-r /tmp/wtf
mkfs.ubifs -m 4096 -e 516096 -c 4095 -d /tmp/wtf/wtf1 -o mytest.img
Error: output file cannot be in the UBIFS root directory

mytest.img is not inside /tmp/wtf/wtf1, but mkfs.ubifs fails because 
/tmp/wtf is not readable.
It seems that implementation of in_path(..) in mkfs.ubifs.c is not quite 
correct to handle this type of situations.

If you are wondering, my /home is not readable, and this prevents me from 
building any ubifs image inside of /home/user.

Thanks in advance.
