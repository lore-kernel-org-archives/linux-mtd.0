Received: from samar.sasken.com ([164.164.56.2] helo=pcd135.sasi.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M4C2-0007Ys-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 09:57:54 +0100
Message-ID: <3B52FB55.ADBF2045@sasken.com>
Date: Mon, 16 Jul 2001 14:33:57 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: jfss-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Buffer cache in JFFS 
Content-Type: multipart/mixed;
 boundary="------------569B4A6FE0F559FC2DE02686"
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

This is a multi-part message in MIME format.
--------------569B4A6FE0F559FC2DE02686
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

Iam lookong into the concept of making the writes to the flash device (
using JFFS2) minimum
by using buffer cache.

my queries regarding this:

* JFFS2 doesnt  access data via the buffer cache :  Is it that to keep
the  data consistent
   even after a sudden power lossage or for some other reason.

* why buffer cache is not implemented in JFFS2, which would have
increased the life of the
    flash device.

* can i at all implement buffer cache for jffs2.

* What is the Maxinum file size supported in JFFS2?

thanks
ashok



--------------569B4A6FE0F559FC2DE02686
Content-Type: text/x-vcard; charset=us-ascii;
 name="ashokmp.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Ashok M Padmanaban
Content-Disposition: attachment;
 filename="ashokmp.vcf"

begin:vcard 
n:.m.padmanabhan;ashok
tel;work:5281461/5281229 ext 3096
x-mozilla-html:FALSE
org:sasken communication technologies ltd;internt access solutions
version:2.1
email;internet:ashokmp@sasken.com
title:software engineer
adr;quoted-printable:;;3008,12 th B cross,=0D=0Aindranagar	;banglore;;;india
x-mozilla-cpt:;0
fn:ashok .m.padmanabhan
end:vcard

--------------569B4A6FE0F559FC2DE02686--
