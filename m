Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oc0IR-0007v4-Pn
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2010 18:15:04 +0000
Received: by ewy9 with SMTP id 9so3591927ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jul 2010 11:15:02 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 Jul 2010 11:14:54 -0700
Message-ID: <AANLkTilV0_Ya6fSC4m7jX2kMqnNMDD8-RcampJxxwcDU@mail.gmail.com>
Subject: Mounting JFFS2 partitions as read-only and CRC failures
From: j ram <buggyballs@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have a question.
I've encountered JFFS2 CRC errors on the lines of
Name CRC failed on node at 0x00b620c8: Read 0x640c8ca3, calculated 0x795111fe

According to http://www.linux-mtd.infradead.org/faq/jffs2.html#L_messages,
JFFS2 CRC failure messages could mean node corruption caused by media
corruption or unclean reboots.

If the JFFS2 partition is mounted as read-only, is it safe to conclude
that node corruption is unlikely?

Appreciate any insight

Regards,
Iyer
