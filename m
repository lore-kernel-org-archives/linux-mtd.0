Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KEkyR-0001vE-0q
	for linux-mtd@lists.infradead.org; Fri, 04 Jul 2008 13:05:15 +0000
Subject: Re: Problem mounting a UBIFS volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF565C42CF.2A35DC45-ON8825747B.001B2100-8825747B.001D1F69@selinc.com>
References: <OF565C42CF.2A35DC45-ON8825747B.001B2100-8825747B.001D1F69@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Jul 2008 16:02:29 +0300
Message-Id: <1215176549.6573.110.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2008-07-02 at 22:18 -0700, Bruce_Leonard@selinc.com wrote:
> UBIFS error (pid 842): check_lpt_crc:invalid crc in LPT node: crc 2bbb=20
> calc a5a5
> UBIFS error (pid 842): ubifs_read_nnode: error -22 reading nnode at 8:615=
0
> mount: wrong fs type, bad option, bad superblock on ubi0:bob,
>        missing codepage or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so

AFAIU, you still use a small flash and small image. So the only change
was your MTD change. Are you sure it is not the MTD change which is to
blame? Can you reproduce this error without your MTD change?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
