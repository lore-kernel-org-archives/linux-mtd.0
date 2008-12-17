Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCvw7-0001Mi-4R
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 12:55:35 +0000
Received: from [10.9.9.161] (helo=patch.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LCvw8-0005jU-H6
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:55:36 +0100
Received: from [74.94.155.177] (helo=[192.168.12.139])
	by patch.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63) id 1LCvw5-0007sK-Bc
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:55:33 +0100
Message-ID: <4948F6C2.4070006@runbox.com>
Date: Wed, 17 Dec 2008 07:55:30 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs: Inconsistency detected by ld.so: rtld.c: 1213: dl_main:
	Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I can move data on and off the ubifs ok, but when I try to execute something,
I get the following error.

What's wrong?

Inconsistency detected by ld.so: rtld.c: 1213: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

Cal Page
