Received: from host242-133.pool80206.interbusiness.it ([80.206.133.242]
	helo=dns.ctsgroup.it)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4HJG-0006Gq-M6
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 11:00:46 +0100
Received: from Massimo (dyn225.ctsgroup.it [192.6.1.225])
	by dns.ctsgroup.it (8.11.6/8.11.6) with SMTP id h8U9xt113285
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 11:59:55 +0200
Message-ID: <001501c38739$e17ff190$e10106c0@Massimo>
From: =?iso-8859-1?Q?Massimo_Cal=F2?= <m.calo@ctsgroup.it>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 30 Sep 2003 12:01:56 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Couldn't find erase block to garbage collect!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

    I have done the following command :

        />eraseall /dev/mtd2                        (mtd2 is JFFS2)

When I reboot I receive the following message:

        /> /bin/reboot
        jffs2: No clean _or_ dirty blocks to GC from! Where are they all?

        jffs2: Couldn't find erase block to garbage collect!

        Restarting system.


I think that this is a warning, but how can I solve this message?
Is it possible to do some command like "format" to erase the mtd2 partition
without giving any problem to GC?

Thanks!

Massimo.
