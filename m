Received: from [65.200.54.81] (helo=ca2smail1.celeritynet.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEWPC-00024Y-0Q
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 16:09:14 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 28 Oct 2003 08:07:32 -0800
Message-ID: <E025AA91F3FF3D44A8E713E82C9D359793EA19@ca2smail1.celeritynet.net>
From: "Ellec, Chris" <cellec@celerity.net>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: INFTL and MAKEDEV
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
=20
In the following from util/MAKEDEV:
=20
=20
function mkinftl () {
        mknod /dev/inftl$1 b 94 $2
        for a in `seq 1 15`; do
                mknod /dev/inftl$1$a b 93 `expr $2 + $a`
        done
}

shouldn't the major number be 93 for both mknod or 94 for both mknod,
instead of one of each ?

Chris.
