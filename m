Received: from [203.199.60.6] (helo=Mailout.ltindia.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By8QQ-0006Jj-3D
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 08:23:19 -0400
Received: (from EMAIL [192.168.172.1])
	by LNTMAIL.LNTMAIL.LTINDIA.COM (SAVSMTP 3.1.2.35) with SMTP id
	M2004082017375120168
	for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2004 17:37:51 +0530
Message-Id: <s126375d.036@EMAIL>
Date: Fri, 20 Aug 2004 17:39:08 +0530
From: "Raghav K" <raghavk@myw.ltindia.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Subject: Raw Flash Writes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings all,

My system has the flash interleaved to give me an  effective sector=20
size of 256kB;

A write to an entire erased sector of flash causes  my  kernel to =
crash,=20
however the writes to the same in smaller chunks with a small delay=20
seems to work fine.

Is there some sort of limit in "write-chuck" size or any timeout placed=20
on a write operation considering that it is  "synced". If so how can =20
this be modified ?

I've also tried to  "cat 256k_file > /dev/mtd4", this too drives my=20
kernel crazy.

Any and all help appreciated.

Thanks and Regards,
-raghav-
--------------------------------------------
Purpose is everything, purpose is all.








 =20
