Received: from [203.199.60.6] (helo=Mailout.ltindia.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxqnU-0002yM-I8
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 13:33:57 -0400
Received: (from EMAIL [192.168.172.1])
	by LNTMAIL.LNTMAIL.LTINDIA.COM (SAVSMTP 3.1.2.35) with SMTP id
	M2004081923035029237
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 23:03:50 +0530
Message-Id: <s1253243.044@EMAIL>
Date: Thu, 19 Aug 2004 23:05:20 +0530
From: "Raghav K" <raghavk@myw.ltindia.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Subject: Mouting JFFS2 parition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings all,

Hi, I'm a novice at using flash chips and MTD, so please bear with me if =
this is a trivial=20
question.

I am able to mount my completely erased parition, "without" copying an =
image on to it.
The memory dump of the partition after umounting the same, shows some data =
being
written to this parition.  I have a couple of questions in this regard.

Is it a necessary to copy an JFFS2 image to an MTD parition before using =
the same?=20
Is this an acceptable way of using the parition?=20

Thanks and Regards,
-raghav-
--------------------------------------------
Purpose is everything, purpose is all.
