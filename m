Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D66A4-0003j4-IQ
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 07:07:37 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D665C-0006Se-2U
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 13:02:34 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2005 13:02:34 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2005 13:02:34 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Tue, 01 Mar 2005 13:07:03 +0100
Message-ID: <d01lkf$v0d$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

After removing a directory containing a lot of files, I get lots of the 
following messages on reboot (one for each of the files I removed):

Cannot remove child "file10.txt", ino #13, because it doesn't exist

It keeps returning even after rebooting...

How much should be put into this?
And how to "fix" it...

BR,
  Martin Egholm
