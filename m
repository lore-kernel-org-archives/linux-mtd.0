Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRbW0-0000jQ-B6
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2009 00:09:19 +0000
Received: from exch-oslno.SIMRAD.NET.INT (unverified [157.237.5.27]) by
	mail1.navico.com
	(Vircom SMTPRS 4.5.654.13) with ESMTP id <B0007728985@mail1.navico.com>
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2009 01:09:17 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: UBIFS performance with no_chk_data_crc option
Date: Tue, 27 Jan 2009 13:09:06 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E08308B18@exch01-aklnz.MARINE.NET.INT>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems to me that enabling the no_chk_data_crc option actually causes
SLOWER read performance. I get these results:

umount NOS
mount -t ubifs -o ro,no_chk_data_crc /usr/share/NOS/
echo 3 > /proc/sys/vm/drop_caches
time cat NOS/charts/Navico/ShadedRelief/_3DTexture_1024_0_World.at5 >
/dev/null
real    0m 17.55s
user    0m 0.00s
sys     0m 17.53s

umount NOS
mount -t ubifs -o ro,chk_data_crc /usr/share/NOS/
echo 3 > /proc/sys/vm/drop_caches
time cat NOS/charts/Navico/ShadedRelief/_3DTexture_1024_0_World.at5 >
/dev/null
real    0m 12.12s
user    0m 0.01s
sys     0m 12.09s

I also check what the performance is with defaults:

umount NOS
echo 3 > /proc/sys/vm/drop_caches
time cat NOS/charts/Navico/ShadedRelief/_3DTexture_1024_0_World.at5 >
/dev/null
real    0m 17.90s
user    0m 0.01s
sys     0m 17.87s

So it seems:
- defaults (documentation says this is checking CRC) -> slow
- no crc checks -> slow
- explicitely enabled crc checks -> fast

This seems very repeatable. I get the same numbers every time. I think
perhaps the logic of the mount options is reversed?

Regards,
Reuben Dowle
Design Engineer
Navico Asia Pacific
