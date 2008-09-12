Received: from [212.234.111.251] (helo=mail.telecom-design.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeGus-00025i-BQ
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 22:15:02 +0000
Received: (from uucp@localhost) by mail.telecom-design.com id m8CM3USi027859
	for <linux-mtd@lists.infradead.org>; Sat, 13 Sep 2008 00:03:30 +0200
Subject: 8/16/32 bit JEDEC probe
From: Michel Stempin <michel.stempin@telecom-design.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Sat, 13 Sep 2008 00:03:22 +0200
Message-Id: <1221257002.30016.13.camel@Mikeul>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I have an interesting case to submit.

I have a SystemBase ARM9 (AT91SAM9260) Eddy-CPU-V2 that can be populated
with either a 32MB SST 39VF3201 (Mfr: 0x00bf, Id: 0x235b) or a 64MB EON
EN29LV640B (Mfr: 0x007f, Id: 0x22cb) part. Mine has the SST part.

As none of these chips were defined in jedec_probe.c, I defined them
there.

However, when the probe is done, an SST 49LF080A (Mfr: 0x00bf, Id:
0x005b) is found instead of my SST 39VF3201...

What is remarkable is that both chips have the same LSB Id!

My conclusion is that the less discriminating 8-bit device detection has
precedence over the more discriminating 16-bit device.

Shouldn't this be the other way around (ie. first detect 32, then 16,
then 8 bit devices)?

If I comment the SST 49LF080A definition, everything works as expected.

Best regards,

-- 
Michel Stempin
