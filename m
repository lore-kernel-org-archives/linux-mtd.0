Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170pbP-0008R2-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 21:12:27 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 170pRw-0005r8-00
	for linux-mtd@lists.infradead.org; Thu, 25 Apr 2002 14:02:40 -0600
Message-ID: <3CC862ED.5030007@yottayotta.com>
Date: Thu, 25 Apr 2002 14:11:25 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Booting from /dev/mtdblock/0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I'm trying to boot from /dev/mtdblock/0 (root=/dev/mtdblock/0 in cmdline 
options)

When I boot from nfs, I can mount /dev/mtdblock/0 no problem from 
command line & unmount etc.

But if I pass it as the root= option, while booting it gets stuck.

With mtd debug level to 3 I see that it tries mtdblock_open twice... 
which it shouldnt..

"mtdblock_open
ok
mtdblock_open
mtdblock_release"

Then it hangs here for a long time.
What could be the cause?

Murtada
