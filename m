Received: from playa.onespot.com ([64.41.197.68])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kwKX-0007h2-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 00:09:21 +0000
From: "Christopher Hoover" <ch@murgatroid.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Linux-Arm-Kernel" <linux-arm-kernel@lists.arm.linux.org.uk>,
	"Linux-Mtd" <linux-mtd@lists.infradead.org>
Subject: RE: 2.5.5-rmk2: "deflateInit alloc of workspace failed" from fs/jffs2/compr_zlib.c 
Date: Tue, 12 Mar 2002 16:19:50 -0800
Message-ID: <FNEOLNAALFHDKOECFFJEEEGMEGAA.ch@murgatroid.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4960.1015978341@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> I'm going to clean up the MTD code next. I repeat my call for anyone =
who=20
> has new drivers that aren't yet in CVS to pull their finger out and =
make=20
> sure I have them :)

David,

May I apply and commit the following patch:

 =
http://www.arm.linux.org.uk/developer/patches/?action=3Dviewpatch&id=3D10=
40/1

to the mtd CVS tree?

Recall that is the alternative you suggested vs unlocking writeable =
parititions in mtdpart.c.

-ch

mailto:ch@murgatroid.com
mailto:ch@hpl.hp.com
http://www.murgatroid.com/
