Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoNi7-0001I1-AH
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 10:13:32 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2005011110132709603
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jan 2005 10:13:27 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351813AD@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Jan 2005 10:13:04 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: INFTL Endless loop in chain error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I have been getting my DOC 128 Mbytes to work.  I was able to get it going
using Docboot and a fix to inftlcore that was provided to me.  I had been
using ext3 file system just till I got things right.  I then tried to get
jffs2 working.  I reapplied the mtd patch that I had been using I pulled Nov
of 2004 (fairly recent) and told it to update jffs2.  This cause the kernel
build to fail.  I had multiple definitions of rb_prev and rb_next.  I pulled
out the ones in rbtree.c.  I was able to get the kernel to build but now I
am getting the error INFTL endless loop in virtual chain xxxx:Unit xxxx.
What has happened and how can I fix this.  The srtucts rb_next and rb_prev
where already in the kernel.

Thanks
John
