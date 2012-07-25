Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Styv4-0007Ug-4F
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 10:34:26 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD833FD
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2012 10:33:54 +0000 (GMT)
Received: from Webmail-eu.st.com (safex1hubcas2.st.com [10.75.90.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 683E62A7A
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2012 10:33:54 +0000 (GMT)
From: Diego COSTE <diego.coste@st.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 25 Jul 2012 12:33:53 +0200
Subject: gluebi and flash file systems using the OOB
Message-ID: <500FCB91.30009@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I hope I don't ask a question already answered, but I didn't find an
easy way to search the mailing list.

The HW NAND controller we use automatically handles the ECC and uses
all of the OOB for that.

I saw that UBI and UBIFS do not use OOB, and therefore are compatible
with that HW and its SW driver.

But we also have to use alternate flash file systems (JFFS2, YAFFS2).
Unfortunately these file systems use the OOB and therefore can't
directly work with the HW we use.

Then I saw that there is gluebi that re-exports a MTD, and that it is
possible to use JFFS2 on top of it.

So here are the questions:
Does gluebi provide an OOB emulation so that we can use *any* flash file
system that uses the OOB ?
Or do we have to force the FS not to use the OOB ?

Thanks for your kind help,

Diego
