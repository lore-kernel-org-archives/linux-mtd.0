Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Z4f5-0006B6-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2001 07:05:16 +0100
Message-ID: <3B824989.F4626DBE@sasken.com>
Date: Tue, 21 Aug 2001 11:44:10 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: Erase Sector Size
Content-Type: multipart/mixed;
 boundary="------------F905BE2FD7BC77A39F0408BB"
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
--------------F905BE2FD7BC77A39F0408BB
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
 Iam using intels 28F128 Strata flash, According to its data sheet
its erase sector size is 128KB.
But with 2.4.2 kernel + rmk2 (patch,diff) + mtd patch , the erase sector
size
is 256KB.
As 5 sectors have to be reserved for garbage collection in jffs2. When i
make a
1MB partition iam left with no space on the jffs2 partition.
How can i make the erase sector size to 128KB, is this configurable and
if so
what should i do change it.

thanks and regards
ashok

--------------F905BE2FD7BC77A39F0408BB
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

--------------F905BE2FD7BC77A39F0408BB--
