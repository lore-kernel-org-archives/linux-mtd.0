Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15s2PF-0006ft-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2001 14:31:17 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id PAA09185
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2001 15:39:07 +0200
Date: Fri, 12 Oct 2001 15:40:29 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Bug in __get_mtd_device()
Message-ID: <20011012154029.A15073@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi!

Correct me, if I am wrong, but there seems to be a bug in
__get_mtd_device() in drivers/mtd/mtdcore.c.

The following line seems to be dangerous:
	} else if (num < MAX_MTD_DEVICES) {

num has type int (signed) and is not checked against negative values.
You could either use this hack:
  } else if ((unsigned)num < MAX_MTD_DEVICES) {

which might break if some platform doesn't use a two's complement for
negative numbers or do the long check:
  } else if (num >= 0 && num < MAX_MTD_DEVICES) {

I would prefer the latter, correctness is more important than
performance.

Another fix that changes the semantics slightly would be to use this
line:
	if (num < 0) {

instead of:
	if (num == -1) {

Jörn

-- 
If you have the right attitude, interesting problems will find you.
