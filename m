Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jobV-0003Se-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 22:09:57 +0100
Received: from mail.bustech.com ([199.190.209.11] helo=BTIBURMAIL01.bustech.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15johQ-00018Y-00
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2001 22:16:05 +0100
Message-ID: <002a01c14150$66554d20$26e8b2c6@hawk>
From: "Mike Hill" <mhill@bustech.com>
To: <linux-mtd@lists.infradead.org>
Subject: RO permission on odd numbered MTD devices?
Date: Wed, 19 Sep 2001 17:16:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Can anyone tell me why the odd numbered MTD character devices are ReadOnly?

I see the code in MTDCHAR.C, but I have no idea what it was setup this way.


 /* You can't open the RO devices RW */
 if ((file->f_mode & 2) && (minor & 1))
  return -EACCES;

Thanks for any understanding you can provide...
-Mike

===========================================
Michael Hill - Systems Developer

Bus-Tech, Inc.
Email: mhill@bustech.com
Phone: (919) 847-7859   Fax: (919) 847-0182
===========================================

Say "boolah boolah boolah" out loud three times,
wave a dead chicken, and reboot.
Works for me...
