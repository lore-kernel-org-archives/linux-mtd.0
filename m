Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 171Xvy-0002qE-00
	for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2002 20:32:38 +0100
Received: from diva.localdomain (in-addr.btopenworld.com [62.6.94.220] (may be forged))
	by sparta.scl.co.uk (8.9.3/8.9.3) with ESMTP id UAA10727
	for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2002 20:32:37 +0100
Received: from diva.localdomain (IDENT:root@diva.localdomain [192.168.1.1])
	by diva.localdomain (8.12.2/8.12.2) with SMTP id g3RJXEY1032160
	for <linux-mtd@lists.infradead.org>; Sat, 27 Apr 2002 20:33:14 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: GRUB patch won't stick ;-(
Date: Sat, 27 Apr 2002 20:24:57 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <02042720331400.31949@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
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

Hi there

Sorry if I'm being dumb, but I can't manage to patch the grub source...

Here is what I've done.

Downloaded the latest mtd from cvs and in the directory patches found:

grub-2002-02-19-doc.patch

I tried to patch grub v 0.91 (i.e the latest release) with this but it fa=
ils.=20
So I figured what I needed to do was get the source version of grub
corresponding to when the patch was made.  So, I used this command to ret=
rieve
a version of grub from cvs:

cvs -z3 -d:pserver:anoncvs@subversions.gnu.org:/cvsroot/grub co -D 2002-0=
2-19 grub

which seemed to work fine, and then tried to patch this version.  But it =
still
fails thus (and this looks very similar to the failure against the 0.91 s=
ource):

-----------------------------------------
patching file AUTHORS
patching file ChangeLog
patching file README_DiskOnChip
patching file configure.in
patching file Makefile.am
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 89.
2 out of 2 hunks FAILED -- saving rejects to file Makefile.am.rej
patching file doc_stage1.S
patching file doc_stage1.h
patching file doc_stage1b.S
patching file makecsum.c
patching file Makefile.am
Hunk #1 FAILED at 85.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
can't find file to patch at input line 1246
Perhaps you should have used the -p or --strip option?
The text leading up to this was:
--------------------------
|Index: stage2/asm.S
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|RCS file: /usr/local/cvsroot/grub/stage2/asm.S,v
|retrieving revision 1.1.1.2
|retrieving revision 1.3
|diff -u -r1.1.1.2 -r1.3
|--- stage2/asm.S       10 Feb 2002 16:05:37 -0000      1.1.1.2
|+++ stage2/asm.S       10 Feb 2002 17:03:08 -0000      1.3
--------------------------
File to patch:            (I gave up here...)
-------------------------------------------

What am I doing wrong...?

TIA

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
