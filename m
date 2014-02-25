Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIKS4-0006l1-Mt
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2014 16:01:49 +0000
Received: from maxdalex02.maxim-ic.internal (maxdalex02.maxim-ic.internal
 [10.16.15.104]) by antispam01.maximintegrated.com with ESMTP id
 5pK5d5ewHp5crr5U for <linux-mtd@lists.infradead.org>;
 Tue, 25 Feb 2014 10:01:21 -0600 (CST)
From: Brian Foster <brian.foster@maximintegrated.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [Q] `ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for
 device' - What changed?
Date: Tue, 25 Feb 2014 17:01:18 +0100
Message-ID: <4790760.yeQTJBGPZK@laclwks004>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

 Using an (admittedly ancient) BuildRoot v2010.11
 (which uses v2.6.36.4 kernel headers) with an
 (also admittedly ancient) v2.6.36.4 Linux kernel,
 ubiattach(1) works fine.  The =E2=80=98ubiattach=E2=80=99 is of
 vintage v1.4.6 (and has not been modified).

 However, using that _identical_ =E2=80=98ubiattach=E2=80=99 binary
 (which is for an ARM926EJ-S CPU) with a more recent
 v3.10.30 kernel, it fails.  For example:

    # ubiattach -m7 -d0 /dev/ubi_ctrl
    ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for device
    #

 I assume the value of, and/or parameter to, some
 ioctl command has changed v2.6.36 =E2=86=92 v3.10, but
 am at a loss as to just _what_ changed (or why).

 Any pointers would be appreciated.

cheers!
=09-blf-

--=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
