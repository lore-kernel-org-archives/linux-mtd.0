Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsaUz-0002Xp-4q
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 12:40:50 +0000
Received: by wwb29 with SMTP id 29so444038wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Feb 2011 04:40:47 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 24 Feb 2011 18:09:31 +0530
Message-ID: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
Subject: Mean Time Between Failure - UBI clarifications
From: Navaneethan P <pnavanee@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linux-mtd users,


In our product, we are using 128MB of NAND Flash (Samsung / Micron).
The whole NAND flash is configured as a single MTD partition. We are
using UBI over the MTD partition.

With this input, we wanted to calculate the Mean Time between failures
(MTBF) of our product. In this context,

1) We wanted to term =92bitflip=92 as a failure. Is our understanding
correct or should we only consider a bad block as a failure?

2) Is there any standard way to findout the number of bitflips from
the UBI? If no, is it suggested to modify the UBI subsystem of the
Linux kernel to get the bit flip counter?

3) Is there any standard software / approach which can be used to find
out the reliability / MTBF / MTTF (Mean Time To Failure) of our NAND
Flash?


Could some one clarify in this regard?

Thanks in advance.

Regards,
Navaneethan
