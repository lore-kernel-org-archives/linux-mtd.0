Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c69O-0005Dm-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 15:17:02 +0100
Message-ID: <3B8D48D6.BE5EAAA0@sasken.com>
Date: Wed, 29 Aug 2001 19:56:06 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: REG: FLASH BLOCK LOCKING
Content-Type: multipart/mixed;
 boundary="------------FCFA8BDEC3567EBD21EE5E0C"
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
--------------FCFA8BDEC3567EBD21EE5E0C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
Are there any methods by which portions of  falsh device can be locked,
so that accidental erase or corruption can be avoided.
If there are, what are those.
Are there any temporary and permanent locking mechanism.

In 3 volt intel strataFlash memory 28F128J3A, a block locking
scheme is provided with BLOCK LOCK-BITS.
How can these bits be used to lock the flash blocks.?
If  blocks are locked , does this mean that accross the power cycles
this will be consistent.

regards
ashok


--------------FCFA8BDEC3567EBD21EE5E0C
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

--------------FCFA8BDEC3567EBD21EE5E0C--
