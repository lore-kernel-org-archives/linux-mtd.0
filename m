Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VtYI-0007CR-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 13:13:56 +0000
Received: from willem.sanpeople.com ([192.168.4.3] helo=sanpeople.com)
	by za-gw.sanpeople.com with esmtp (Exim 3.33 #2)
	id 18VuAm-0002Ye-00
	for linux-mtd@lists.infradead.org; Tue, 07 Jan 2003 15:53:40 +0200
Message-ID: <3E1ADA96.7000308@sanpeople.com>
Date: Tue, 07 Jan 2003 15:48:06 +0200
From: Willem Myburgh <willem@sanpeople.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Meaning of "DQ5 raised while program operation was in progress" ?
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

Hi there

I'm using an ATMEL AT49BV1614 Flash chip and the physical memory mapping 
driver. I've patched linux-2.4.19-rmk4 with the latest mtd sources on

anoncvs@cvs.infradead.org


I get this warning in the kernel log while I'm writing to a jffs2 fs:
"DQ5 raised while program operation was in progress, however operation 
completed OK".

Is this a problem? What can I do to solve it?


--Willem
