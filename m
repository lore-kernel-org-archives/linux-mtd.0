Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rVwQ-0002kV-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 04:55:54 +0100
Message-ID: <005601c25ec7$0b5f8f30$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 filesystem
Date: Wed, 18 Sep 2002 11:53:43 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

Hi! all,
    I have a problem about the jffs2 file system. Pls. refer below message.
If the i/o error occur in eraseall process, is the jffs2 fs corrupted if i
copy the jffs2 image to /dev/mtd1 ? Does the "dd" or "cp" take care the i/o
error? thanks.


Paul

****************************************************************************
***
bash-2.04# eraseall /dev/mtd1
Erasing 16 Kibyte @ f0000 --  9 % compnand_erase: attempt to erase a bad
block a
t page 0x00003d20
Erasing 16 Kibyte @ 1a4000 -- 16 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erased 10240 Kibyte @ 0 -- 100% complete.
bash-2.04# dd if=jffs2.img of=/dev/mtd1 bs=1k
dd: writing `/dev/mtd1': Bad address
3607+1 records in
3607+0 records out
bash-2.04#

****************************************************************
