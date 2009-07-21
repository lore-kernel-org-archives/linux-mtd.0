Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTIhF-0008CZ-My
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 17:00:14 +0000
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly13a.srv.mailcontrol.com (MailControl) with ESMTP id
	n6LH06J3030230
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2009 18:00:07 +0100
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 21 Jul 2009 19:00:05 +0200
Subject: UBI FS mounting time
Message-ID: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6s to =
mount.

We'd like to have the data available at least read-only earlier than that.

We know UBI on principle needs to read the map of all blocks in order to re=
build the logical view of the memory, but maybe there's another way around =
it to make it available earlier...

Someone know how?

Thank you.



  Daniele Bosi
