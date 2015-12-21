Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAd-0000mL-Iu
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:52:21 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 06/38] ubifs: introduce ubifs-utils/include and ubifs-utils/lib
Date: Mon, 21 Dec 2015 16:41:29 +0800
Message-ID: <1450687321-12381-7-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Restructure the ubifs-utils/, introducing ubifs-utils/include
and ubifs-utils/lib to make the ubifs-utils/ better for scalability.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                                           |   7 +-
 ubifs-utils/COPYING                                | 340 ++++++++++++
 ubifs-utils/README                                 |   9 +
 ubifs-utils/include/compr.h                        |  45 ++
 ubifs-utils/include/crc16.h                        |  27 +
 ubifs-utils/include/defs.h                         |  92 ++++
 ubifs-utils/include/devtable.h                     |  55 ++
 ubifs-utils/include/hashtable.h                    | 199 +++++++
 ubifs-utils/include/hashtable_itr.h                | 112 ++++
 ubifs-utils/include/hashtable_private.h            |  85 +++
 ubifs-utils/include/io.h                           |  15 +
 ubifs-utils/include/key.h                          | 207 ++++++++
 ubifs-utils/include/lpt.h                          |  28 +
 ubifs-utils/include/ubifs.h                        | 450 ++++++++++++++++
 ubifs-utils/include/ubifs_common.h                 |  50 ++
 ubifs-utils/lib/compr.c                            | 228 ++++++++
 ubifs-utils/lib/crc16.c                            |  56 ++
 ubifs-utils/lib/devtable.c                         | 525 ++++++++++++++++++
 ubifs-utils/lib/hashtable.c                        | 277 ++++++++++
 ubifs-utils/lib/hashtable_itr.c                    | 176 ++++++
 ubifs-utils/lib/io.c                               |  33 ++
 ubifs-utils/lib/lpt.c                              | 587 +++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/COPYING                     | 340 ------------
 ubifs-utils/mkfs.ubifs/README                      |   9 -
 ubifs-utils/mkfs.ubifs/compr.c                     | 228 --------
 ubifs-utils/mkfs.ubifs/compr.h                     |  45 --
 ubifs-utils/mkfs.ubifs/crc16.c                     |  56 --
 ubifs-utils/mkfs.ubifs/crc16.h                     |  27 -
 ubifs-utils/mkfs.ubifs/defs.h                      |  92 ----
 ubifs-utils/mkfs.ubifs/devtable.c                  | 525 ------------------
 ubifs-utils/mkfs.ubifs/devtable.h                  |  55 --
 ubifs-utils/mkfs.ubifs/hashtable/hashtable.c       | 277 ----------
 ubifs-utils/mkfs.ubifs/hashtable/hashtable.h       | 199 -------
 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c   | 176 ------
 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h   | 112 ----
 .../mkfs.ubifs/hashtable/hashtable_private.h       |  85 ---
 ubifs-utils/mkfs.ubifs/io.c                        |  33 --
 ubifs-utils/mkfs.ubifs/io.h                        |  15 -
 ubifs-utils/mkfs.ubifs/key.h                       | 207 --------
 ubifs-utils/mkfs.ubifs/lpt.c                       | 587 ---------------------
 ubifs-utils/mkfs.ubifs/lpt.h                       |  28 -
 ubifs-utils/mkfs.ubifs/ubifs.h                     | 450 ----------------
 ubifs-utils/mkfs.ubifs/ubifs_common.h              |  50 --
 43 files changed, 3600 insertions(+), 3599 deletions(-)
 create mode 100644 ubifs-utils/COPYING
 create mode 100644 ubifs-utils/README
 create mode 100644 ubifs-utils/include/compr.h
 create mode 100644 ubifs-utils/include/crc16.h
 create mode 100644 ubifs-utils/include/defs.h
 create mode 100644 ubifs-utils/include/devtable.h
 create mode 100644 ubifs-utils/include/hashtable.h
 create mode 100644 ubifs-utils/include/hashtable_itr.h
 create mode 100644 ubifs-utils/include/hashtable_private.h
 create mode 100644 ubifs-utils/include/io.h
 create mode 100644 ubifs-utils/include/key.h
 create mode 100644 ubifs-utils/include/lpt.h
 create mode 100644 ubifs-utils/include/ubifs.h
 create mode 100644 ubifs-utils/include/ubifs_common.h
 create mode 100644 ubifs-utils/lib/compr.c
 create mode 100644 ubifs-utils/lib/crc16.c
 create mode 100644 ubifs-utils/lib/devtable.c
 create mode 100644 ubifs-utils/lib/hashtable.c
 create mode 100644 ubifs-utils/lib/hashtable_itr.c
 create mode 100644 ubifs-utils/lib/io.c
 create mode 100644 ubifs-utils/lib/lpt.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/COPYING
 delete mode 100644 ubifs-utils/mkfs.ubifs/README
 delete mode 100644 ubifs-utils/mkfs.ubifs/compr.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/compr.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/crc16.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/crc16.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/defs.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/devtable.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/devtable.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/io.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/io.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/key.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/lpt.c
 delete mode 100644 ubifs-utils/mkfs.ubifs/lpt.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/ubifs.h
 delete mode 100644 ubifs-utils/mkfs.ubifs/ubifs_common.h

diff --git a/Makefile b/Makefile
index 8864675..ad0526f 100644
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@
 
 VERSION = 1.5.2
 
-CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
+CPPFLAGS += -D_GNU_SOURCE -I./include -I$(BUILDDIR)/include -I./ubi-utils/include -I./ubifs-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS) $(UUIDCPPFLAGS)
 
 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -126,8 +126,9 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 #
 # Utils in ubifs-utils subdir
 #
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o io.o\
-	hashtable/hashtable.o hashtable/hashtable_itr.o
+$(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
+
+obj-mkfs.ubifs = $(UBIFS_LIBS)
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
 $(call mkdep,ubifs-utils/mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
diff --git a/ubifs-utils/COPYING b/ubifs-utils/COPYING
new file mode 100644
index 0000000..60549be
--- /dev/null
+++ b/ubifs-utils/COPYING
@@ -0,0 +1,340 @@
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+

+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+

+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+

+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+

+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+

+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) 19yy  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) 19yy name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/ubifs-utils/README b/ubifs-utils/README
new file mode 100644
index 0000000..7e19939
--- /dev/null
+++ b/ubifs-utils/README
@@ -0,0 +1,9 @@
+UBIFS File System - Make File System program
+
+* crc16.h and crc16.c were copied from the linux kernel.
+* crc32.h and crc32.c were copied from mtd-utils and amended.
+* ubifs.h is a selection of definitions from fs/ubifs/ubifs.h from the linux kernel.
+* key.h is copied from fs/ubifs/key.h from the linux kernel.
+* defs.h is a bunch of definitions to smooth things over.
+* lpt.c is a selection of functions copied from fs/ubifs/lpt.c from the linux kernel, and amended.
+* hashtable/* was downloaded from http://www.cl.cam.ac.uk/~cwc22/hashtable/
diff --git a/ubifs-utils/include/compr.h b/ubifs-utils/include/compr.h
new file mode 100644
index 0000000..d44a2ba
--- /dev/null
+++ b/ubifs-utils/include/compr.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation.
+ * Copyright (C) 2008 University of Szeged, Hungary
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy
+ *          Adrian Hunter
+ *          Zoltan Sogor
+ */
+
+#ifndef __UBIFS_COMPRESS_H__
+#define __UBIFS_COMPRESS_H__
+
+/*
+ * Compressors may end-up with more data in the output buffer than in the input
+ * buffer. This constant defined the worst case factor, i.e. we assume that the
+ * output buffer may be at max. WORST_COMPR_FACTOR times larger than input
+ * buffer.
+ */
+#define WORST_COMPR_FACTOR 4
+
+enum compression_type
+{
+	MKFS_UBIFS_COMPR_NONE,
+	MKFS_UBIFS_COMPR_LZO,
+	MKFS_UBIFS_COMPR_ZLIB,
+};
+
+int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len, int type, int lzo_percent);
+int init_compression(void);
+void destroy_compression(void);
+
+#endif
diff --git a/ubifs-utils/include/crc16.h b/ubifs-utils/include/crc16.h
new file mode 100644
index 0000000..539d21a
--- /dev/null
+++ b/ubifs-utils/include/crc16.h
@@ -0,0 +1,27 @@
+/*
+ * Implements the standard CRC-16:
+ *   Width 16
+ *   Poly  0x8005 (x^16 + x^15 + x^2 + 1)
+ *   Init  0
+ *
+ * Copyright (c) 2005 Ben Gardner <bgardner@wabtec.com>
+ *
+ * This code was taken from the linux kernel. The license is GPL Version 2.
+ */
+
+#ifndef __CRC16_H__
+#define __CRC16_H__
+
+#include <stdlib.h>
+#include <stdint.h>
+
+extern uint16_t const crc16_table[256];
+
+extern uint16_t crc16(uint16_t crc, const uint8_t *buffer, size_t len);
+
+static inline uint16_t crc16_byte(uint16_t crc, const uint8_t data)
+{
+	return (crc >> 8) ^ crc16_table[(crc ^ data) & 0xff];
+}
+
+#endif /* __CRC16_H__ */
diff --git a/ubifs-utils/include/defs.h b/ubifs-utils/include/defs.h
new file mode 100644
index 0000000..1fa3316
--- /dev/null
+++ b/ubifs-utils/include/defs.h
@@ -0,0 +1,92 @@
+/*
+ * Greate deal of the code was taken from the kernel UBIFS implementation, and
+ * this file contains some "glue" definitions.
+ */
+
+#ifndef __UBIFS_DEFS_H__
+#define __UBIFS_DEFS_H__
+
+#define t16(x) ({ \
+	uint16_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_16(__b); \
+})
+
+#define t32(x) ({ \
+	uint32_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_32(__b); \
+})
+
+#define t64(x) ({ \
+	uint64_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_64(__b); \
+})
+
+#define cpu_to_le16(x) ((__le16){t16(x)})
+#define cpu_to_le32(x) ((__le32){t32(x)})
+#define cpu_to_le64(x) ((__le64){t64(x)})
+
+#define le16_to_cpu(x) (t16((x)))
+#define le32_to_cpu(x) (t32((x)))
+#define le64_to_cpu(x) (t64((x)))
+
+#define unlikely(x) (x)
+
+#define ubifs_assert(x) ({})
+
+struct qstr
+{
+	char *name;
+	size_t len;
+};
+
+/**
+ * fls - find last (most-significant) bit set
+ * @x: the word to search
+ *
+ * This is defined the same way as ffs.
+ * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
+ */
+static inline int fls(int x)
+{
+	int r = 32;
+
+	if (!x)
+		return 0;
+	if (!(x & 0xffff0000u)) {
+		x <<= 16;
+		r -= 16;
+	}
+	if (!(x & 0xff000000u)) {
+		x <<= 8;
+		r -= 8;
+	}
+	if (!(x & 0xf0000000u)) {
+		x <<= 4;
+		r -= 4;
+	}
+	if (!(x & 0xc0000000u)) {
+		x <<= 2;
+		r -= 2;
+	}
+	if (!(x & 0x80000000u)) {
+		x <<= 1;
+		r -= 1;
+	}
+	return r;
+}
+
+#define do_div(n,base) ({ \
+int __res; \
+__res = ((unsigned long) n) % (unsigned) base; \
+n = ((unsigned long) n) / (unsigned) base; \
+__res; })
+
+#if INT_MAX != 0x7fffffff
+#error : sizeof(int) must be 4 for this program
+#endif
+
+#if (~0ULL) != 0xffffffffffffffffULL
+#error : sizeof(long long) must be 8 for this program
+#endif
+
+#endif
diff --git a/ubifs-utils/include/devtable.h b/ubifs-utils/include/devtable.h
new file mode 100644
index 0000000..987d4d4
--- /dev/null
+++ b/ubifs-utils/include/devtable.h
@@ -0,0 +1,55 @@
+#include "ubifs_common.h"
+
+/**
+ * struct path_htbl_element - an element of the path hash table.
+ * @path: the UBIFS path the element describes (the key of the element)
+ * @name_htbl: one more (nested) hash table containing names of all
+ *             files/directories/device nodes which should be created at this
+ *             path
+ *
+ * See device table handling for more information.
+ */
+struct path_htbl_element {
+	const char *path;
+	struct hashtable *name_htbl;
+};
+
+/**
+ * struct name_htbl_element - an element in the name hash table
+ * @name: name of the file/directory/device node (the key of the element)
+ * @mode: accsess rights and file type
+ * @uid: user ID
+ * @gid: group ID
+ * @major: device node major number
+ * @minor: device node minor number
+ *
+ * This is an element of the name hash table. Name hash table sits in the path
+ * hash table elements and describes file names which should be created/changed
+ * at this path.
+ */
+struct name_htbl_element {
+	const char *name;
+	unsigned int mode;
+	unsigned int uid;
+	unsigned int gid;
+	dev_t dev;
+};
+
+extern struct ubifs_info info_;
+
+struct hashtable_itr;
+
+int parse_devtable(const char *tbl_file);
+struct path_htbl_element *devtbl_find_path(const char *path);
+struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
+					   const char *name);
+int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
+			struct name_htbl_element *nh_elt);
+struct name_htbl_element *
+first_name_htbl_element(struct path_htbl_element *ph_elt,
+			struct hashtable_itr **itr);
+struct name_htbl_element *
+next_name_htbl_element(struct path_htbl_element *ph_elt,
+			struct hashtable_itr **itr);
+void free_devtable_info(void);
+
diff --git a/ubifs-utils/include/hashtable.h b/ubifs-utils/include/hashtable.h
new file mode 100644
index 0000000..c0b0acd
--- /dev/null
+++ b/ubifs-utils/include/hashtable.h
@@ -0,0 +1,199 @@
+/* Copyright (C) 2002 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
+
+#ifndef __HASHTABLE_CWC22_H__
+#define __HASHTABLE_CWC22_H__
+
+struct hashtable;
+
+/* Example of use:
+ *
+ *      struct hashtable  *h;
+ *      struct some_key   *k;
+ *      struct some_value *v;
+ *
+ *      static unsigned int         hash_from_key_fn( void *k );
+ *      static int                  keys_equal_fn ( void *key1, void *key2 );
+ *
+ *      h = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
+ *      k = (struct some_key *)     malloc(sizeof(struct some_key));
+ *      v = (struct some_value *)   malloc(sizeof(struct some_value));
+ *
+ *      (initialise k and v to suitable values)
+ *
+ *      if (! hashtable_insert(h,k,v) )
+ *      {     exit(-1);               }
+ *
+ *      if (NULL == (found = hashtable_search(h,k) ))
+ *      {    printf("not found!");                  }
+ *
+ *      if (NULL == (found = hashtable_remove(h,k) ))
+ *      {    printf("Not found\n");                 }
+ *
+ */
+
+/* Macros may be used to define type-safe(r) hashtable access functions, with
+ * methods specialized to take known key and value types as parameters.
+ *
+ * Example:
+ *
+ * Insert this at the start of your file:
+ *
+ * DEFINE_HASHTABLE_INSERT(insert_some, struct some_key, struct some_value);
+ * DEFINE_HASHTABLE_SEARCH(search_some, struct some_key, struct some_value);
+ * DEFINE_HASHTABLE_REMOVE(remove_some, struct some_key, struct some_value);
+ *
+ * This defines the functions 'insert_some', 'search_some' and 'remove_some'.
+ * These operate just like hashtable_insert etc., with the same parameters,
+ * but their function signatures have 'struct some_key *' rather than
+ * 'void *', and hence can generate compile time errors if your program is
+ * supplying incorrect data as a key (and similarly for value).
+ *
+ * Note that the hash and key equality functions passed to create_hashtable
+ * still take 'void *' parameters instead of 'some key *'. This shouldn't be
+ * a difficult issue as they're only defined and passed once, and the other
+ * functions will ensure that only valid keys are supplied to them.
+ *
+ * The cost for this checking is increased code size and runtime overhead
+ * - if performance is important, it may be worth switching back to the
+ * unsafe methods once your program has been debugged with the safe methods.
+ * This just requires switching to some simple alternative defines - eg:
+ * #define insert_some hashtable_insert
+ *
+ */
+
+/*****************************************************************************
+ * create_hashtable
+
+ * @name                    create_hashtable
+ * @param   minsize         minimum initial size of hashtable
+ * @param   hashfunction    function for hashing keys
+ * @param   key_eq_fn       function for determining key equality
+ * @return                  newly created hashtable or NULL on failure
+ */
+
+struct hashtable *
+create_hashtable(unsigned int minsize,
+                 unsigned int (*hashfunction) (void*),
+                 int (*key_eq_fn) (void*,void*));
+
+/*****************************************************************************
+ * hashtable_insert
+
+ * @name        hashtable_insert
+ * @param   h   the hashtable to insert into
+ * @param   k   the key - hashtable claims ownership and will free on removal
+ * @param   v   the value - does not claim ownership
+ * @return      non-zero for successful insertion
+ *
+ * This function will cause the table to expand if the insertion would take
+ * the ratio of entries to table size over the maximum load factor.
+ *
+ * This function does not check for repeated insertions with a duplicate key.
+ * The value returned when using a duplicate key is undefined -- when
+ * the hashtable changes size, the order of retrieval of duplicate key
+ * entries is reversed.
+ * If in doubt, remove before insert.
+ */
+
+int
+hashtable_insert(struct hashtable *h, void *k, void *v);
+
+#define DEFINE_HASHTABLE_INSERT(fnname, keytype, valuetype) \
+int fnname (struct hashtable *h, keytype *k, valuetype *v) \
+{ \
+    return hashtable_insert(h,k,v); \
+}
+
+/*****************************************************************************
+ * hashtable_search
+
+ * @name        hashtable_search
+ * @param   h   the hashtable to search
+ * @param   k   the key to search for  - does not claim ownership
+ * @return      the value associated with the key, or NULL if none found
+ */
+
+void *
+hashtable_search(struct hashtable *h, void *k);
+
+#define DEFINE_HASHTABLE_SEARCH(fnname, keytype, valuetype) \
+valuetype * fnname (struct hashtable *h, keytype *k) \
+{ \
+    return (valuetype *) (hashtable_search(h,k)); \
+}
+
+/*****************************************************************************
+ * hashtable_remove
+
+ * @name        hashtable_remove
+ * @param   h   the hashtable to remove the item from
+ * @param   k   the key to search for  - does not claim ownership
+ * @return      the value associated with the key, or NULL if none found
+ */
+
+void * /* returns value */
+hashtable_remove(struct hashtable *h, void *k);
+
+#define DEFINE_HASHTABLE_REMOVE(fnname, keytype, valuetype) \
+valuetype * fnname (struct hashtable *h, keytype *k) \
+{ \
+    return (valuetype *) (hashtable_remove(h,k)); \
+}
+
+
+/*****************************************************************************
+ * hashtable_count
+
+ * @name        hashtable_count
+ * @param   h   the hashtable
+ * @return      the number of items stored in the hashtable
+ */
+unsigned int
+hashtable_count(struct hashtable *h);
+
+
+/*****************************************************************************
+ * hashtable_destroy
+
+ * @name        hashtable_destroy
+ * @param   h   the hashtable
+ * @param       free_values     whether to call 'free' on the remaining values
+ */
+
+void
+hashtable_destroy(struct hashtable *h, int free_values);
+
+#endif /* __HASHTABLE_CWC22_H__ */
+
+/*
+ * Copyright (c) 2002, Christopher Clark
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the distribution.
+ *
+ * * Neither the name of the original author; nor the names of any contributors
+ * may be used to endorse or promote products derived from this software
+ * without specific prior written permission.
+ *
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
+ * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+*/
diff --git a/ubifs-utils/include/hashtable_itr.h b/ubifs-utils/include/hashtable_itr.h
new file mode 100644
index 0000000..5c94a04
--- /dev/null
+++ b/ubifs-utils/include/hashtable_itr.h
@@ -0,0 +1,112 @@
+/* Copyright (C) 2002, 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
+
+#ifndef __HASHTABLE_ITR_CWC22__
+#define __HASHTABLE_ITR_CWC22__
+#include "hashtable.h"
+#include "hashtable_private.h" /* needed to enable inlining */
+
+/*****************************************************************************/
+/* This struct is only concrete here to allow the inlining of two of the
+ * accessor functions. */
+struct hashtable_itr
+{
+    struct hashtable *h;
+    struct entry *e;
+    struct entry *parent;
+    unsigned int index;
+};
+
+
+/*****************************************************************************/
+/* hashtable_iterator
+ */
+
+struct hashtable_itr *
+hashtable_iterator(struct hashtable *h);
+
+/*****************************************************************************/
+/* hashtable_iterator_key
+ * - return the value of the (key,value) pair at the current position */
+
+static inline void *
+hashtable_iterator_key(struct hashtable_itr *i)
+{
+    return i->e->k;
+}
+
+/*****************************************************************************/
+/* value - return the value of the (key,value) pair at the current position */
+
+static inline void *
+hashtable_iterator_value(struct hashtable_itr *i)
+{
+    return i->e->v;
+}
+
+/*****************************************************************************/
+/* advance - advance the iterator to the next element
+ *           returns zero if advanced to end of table */
+
+int
+hashtable_iterator_advance(struct hashtable_itr *itr);
+
+/*****************************************************************************/
+/* remove - remove current element and advance the iterator to the next element
+ *          NB: if you need the value to free it, read it before
+ *          removing. ie: beware memory leaks!
+ *          returns zero if advanced to end of table */
+
+int
+hashtable_iterator_remove(struct hashtable_itr *itr);
+
+/*****************************************************************************/
+/* search - overwrite the supplied iterator, to point to the entry
+ *          matching the supplied key.
+            h points to the hashtable to be searched.
+ *          returns zero if not found. */
+int
+hashtable_iterator_search(struct hashtable_itr *itr,
+                          struct hashtable *h, void *k);
+
+#define DEFINE_HASHTABLE_ITERATOR_SEARCH(fnname, keytype) \
+int fnname (struct hashtable_itr *i, struct hashtable *h, keytype *k) \
+{ \
+    return (hashtable_iterator_search(i,h,k)); \
+}
+
+
+
+#endif /* __HASHTABLE_ITR_CWC22__*/
+
+/*
+ * Copyright (c) 2002, 2004, Christopher Clark
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the distribution.
+ *
+ * * Neither the name of the original author; nor the names of any contributors
+ * may be used to endorse or promote products derived from this software
+ * without specific prior written permission.
+ *
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
+ * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+*/
diff --git a/ubifs-utils/include/hashtable_private.h b/ubifs-utils/include/hashtable_private.h
new file mode 100644
index 0000000..3a558e6
--- /dev/null
+++ b/ubifs-utils/include/hashtable_private.h
@@ -0,0 +1,85 @@
+/* Copyright (C) 2002, 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
+
+#ifndef __HASHTABLE_PRIVATE_CWC22_H__
+#define __HASHTABLE_PRIVATE_CWC22_H__
+
+#include "hashtable.h"
+
+/*****************************************************************************/
+struct entry
+{
+    void *k, *v;
+    unsigned int h;
+    struct entry *next;
+};
+
+struct hashtable {
+    unsigned int tablelength;
+    struct entry **table;
+    unsigned int entrycount;
+    unsigned int loadlimit;
+    unsigned int primeindex;
+    unsigned int (*hashfn) (void *k);
+    int (*eqfn) (void *k1, void *k2);
+};
+
+/*****************************************************************************/
+unsigned int
+hash(struct hashtable *h, void *k);
+
+/*****************************************************************************/
+/* indexFor */
+static inline unsigned int
+indexFor(unsigned int tablelength, unsigned int hashvalue) {
+    return (hashvalue % tablelength);
+};
+
+/* Only works if tablelength == 2^N */
+/*static inline unsigned int
+indexFor(unsigned int tablelength, unsigned int hashvalue)
+{
+    return (hashvalue & (tablelength - 1u));
+}
+*/
+
+/*****************************************************************************/
+#define freekey(X) free(X)
+/*define freekey(X) ; */
+
+
+/*****************************************************************************/
+
+#endif /* __HASHTABLE_PRIVATE_CWC22_H__*/
+
+/*
+ * Copyright (c) 2002, Christopher Clark
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the distribution.
+ *
+ * * Neither the name of the original author; nor the names of any contributors
+ * may be used to endorse or promote products derived from this software
+ * without specific prior written permission.
+ *
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
+ * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+*/
diff --git a/ubifs-utils/include/io.h b/ubifs-utils/include/io.h
new file mode 100644
index 0000000..e24d0c6
--- /dev/null
+++ b/ubifs-utils/include/io.h
@@ -0,0 +1,15 @@
+/**
+ * Header file for the io to ubi volume
+ */
+#ifndef __UBIFS_IO_H__
+#define __UBIFS_IO_H__
+
+#include "ubifs_common.h"
+#include "ubifs.h"
+
+extern int out_fd;
+extern int out_ubi;
+extern libubi_t ubi;
+
+int write_leb(struct ubifs_info *c, int lnum, int len, void *buf);
+#endif
diff --git a/ubifs-utils/include/key.h b/ubifs-utils/include/key.h
new file mode 100644
index 0000000..39379fd
--- /dev/null
+++ b/ubifs-utils/include/key.h
@@ -0,0 +1,207 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2006-2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy (Битюцкий Артём)
+ *          Adrian Hunter
+ */
+
+/*
+ * This header contains various key-related definitions and helper function.
+ * UBIFS allows several key schemes, so we access key fields only via these
+ * helpers. At the moment only one key scheme is supported.
+ *
+ * Simple key scheme
+ * ~~~~~~~~~~~~~~~~~
+ *
+ * Keys are 64-bits long. First 32-bits are inode number (parent inode number
+ * in case of direntry key). Next 3 bits are node type. The last 29 bits are
+ * 4KiB offset in case of inode node, and direntry hash in case of a direntry
+ * node. We use "r5" hash borrowed from reiserfs.
+ */
+
+#ifndef __UBIFS_KEY_H__
+#define __UBIFS_KEY_H__
+
+/**
+ * key_mask_hash - mask a valid hash value.
+ * @val: value to be masked
+ *
+ * We use hash values as offset in directories, so values %0 and %1 are
+ * reserved for "." and "..". %2 is reserved for "end of readdir" marker. This
+ * function makes sure the reserved values are not used.
+ */
+static inline uint32_t key_mask_hash(uint32_t hash)
+{
+	hash &= UBIFS_S_KEY_HASH_MASK;
+	if (unlikely(hash <= 2))
+		hash += 3;
+	return hash;
+}
+
+/**
+ * key_r5_hash - R5 hash function (borrowed from reiserfs).
+ * @s: direntry name
+ * @len: name length
+ */
+static inline uint32_t key_r5_hash(const char *s, int len)
+{
+	uint32_t a = 0;
+	const signed char *str = (const signed char *)s;
+
+	len = len;
+	while (*str) {
+		a += *str << 4;
+		a += *str >> 4;
+		a *= 11;
+		str++;
+	}
+
+	return key_mask_hash(a);
+}
+
+/**
+ * key_test_hash - testing hash function.
+ * @str: direntry name
+ * @len: name length
+ */
+static inline uint32_t key_test_hash(const char *str, int len)
+{
+	uint32_t a = 0;
+
+	len = min_t(uint32_t, len, 4);
+	memcpy(&a, str, len);
+	return key_mask_hash(a);
+}
+
+/**
+ * ino_key_init - initialize inode key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: inode number
+ */
+static inline void ino_key_init(union ubifs_key *key, ino_t inum)
+{
+	key->u32[0] = inum;
+	key->u32[1] = UBIFS_INO_KEY << UBIFS_S_KEY_BLOCK_BITS;
+}
+
+/**
+ * dent_key_init - initialize directory entry key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: parent inode number
+ * @nm: direntry name and length
+ */
+static inline void dent_key_init(const struct ubifs_info *c,
+				 union ubifs_key *key, ino_t inum,
+				 const struct qstr *nm)
+{
+	uint32_t hash = c->key_hash(nm->name, nm->len);
+
+	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+	key->u32[0] = inum;
+	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
+}
+
+/**
+ * xent_key_init - initialize extended attribute entry key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: host inode number
+ * @nm: extended attribute entry name and length
+ */
+static inline void xent_key_init(const struct ubifs_info *c,
+				 union ubifs_key *key, ino_t inum,
+				 const struct qstr *nm)
+{
+	uint32_t hash = c->key_hash(nm->name, nm->len);
+
+	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+	key->u32[0] = inum;
+	key->u32[1] = hash | (UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS);
+}
+
+/**
+ * data_key_init - initialize data key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: inode number
+ * @block: block number
+ */
+static inline void data_key_init(union ubifs_key *key, ino_t inum,
+				 unsigned int block)
+{
+	ubifs_assert(!(block & ~UBIFS_S_KEY_BLOCK_MASK));
+	key->u32[0] = inum;
+	key->u32[1] = block | (UBIFS_DATA_KEY << UBIFS_S_KEY_BLOCK_BITS);
+}
+
+/**
+ * key_write - transform a key from in-memory format.
+ * @c: UBIFS file-system description object
+ * @from: the key to transform
+ * @to: the key to store the result
+ */
+static inline void key_write(const union ubifs_key *from, void *to)
+{
+	union ubifs_key *t = to;
+
+	t->j32[0] = cpu_to_le32(from->u32[0]);
+	t->j32[1] = cpu_to_le32(from->u32[1]);
+	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
+}
+
+/**
+ * key_write_idx - transform a key from in-memory format for the index.
+ * @c: UBIFS file-system description object
+ * @from: the key to transform
+ * @to: the key to store the result
+ */
+static inline void key_write_idx(const union ubifs_key *from, void *to)
+{
+	union ubifs_key *t = to;
+
+	t->j32[0] = cpu_to_le32(from->u32[0]);
+	t->j32[1] = cpu_to_le32(from->u32[1]);
+}
+
+/**
+ * keys_cmp - compare keys.
+ * @c: UBIFS file-system description object
+ * @key1: the first key to compare
+ * @key2: the second key to compare
+ *
+ * This function compares 2 keys and returns %-1 if @key1 is less than
+ * @key2, 0 if the keys are equivalent and %1 if @key1 is greater than @key2.
+ */
+static inline int keys_cmp(const union ubifs_key *key1,
+			   const union ubifs_key *key2)
+{
+	if (key1->u32[0] < key2->u32[0])
+		return -1;
+	if (key1->u32[0] > key2->u32[0])
+		return 1;
+	if (key1->u32[1] < key2->u32[1])
+		return -1;
+	if (key1->u32[1] > key2->u32[1])
+		return 1;
+
+	return 0;
+}
+
+#endif /* !__UBIFS_KEY_H__ */
diff --git a/ubifs-utils/include/lpt.h b/ubifs-utils/include/lpt.h
new file mode 100644
index 0000000..4cde59d
--- /dev/null
+++ b/ubifs-utils/include/lpt.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation.
+ * Copyright (C) 2008 University of Szeged, Hungary
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy
+ *          Adrian Hunter
+ */
+
+#ifndef __UBIFS_LPT_H__
+#define __UBIFS_LPT_H__
+
+int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt);
+int create_lpt(struct ubifs_info *c);
+
+#endif
diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
new file mode 100644
index 0000000..2f080a8
--- /dev/null
+++ b/ubifs-utils/include/ubifs.h
@@ -0,0 +1,450 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2008 Nokia Corporation.
+ * Copyright (C) 2008 University of Szeged, Hungary
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy
+ *          Adrian Hunter
+ *          Zoltan Sogor
+ */
+
+#ifndef __UBIFS_H__
+#define __UBIFS_H__
+
+/* Maximum logical eraseblock size in bytes */
+#define UBIFS_MAX_LEB_SZ (2*1024*1024)
+
+/* Minimum amount of data UBIFS writes to the flash */
+#define MIN_WRITE_SZ (UBIFS_DATA_NODE_SZ + 8)
+
+/* Largest key size supported in this implementation */
+#define CUR_MAX_KEY_LEN UBIFS_SK_LEN
+
+/*
+ * There is no notion of truncation key because truncation nodes do not exist
+ * in TNC. However, when replaying, it is handy to introduce fake "truncation"
+ * keys for truncation nodes because the code becomes simpler. So we define
+ * %UBIFS_TRUN_KEY type.
+ */
+#define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT
+
+/*
+ * How much a directory entry/extended attribute entry adds to the parent/host
+ * inode.
+ */
+#define CALC_DENT_SIZE(name_len) ALIGN(UBIFS_DENT_NODE_SZ + (name_len) + 1, 8)
+
+/* How much an extended attribute adds to the host inode */
+#define CALC_XATTR_BYTES(data_len) ALIGN(UBIFS_INO_NODE_SZ + (data_len) + 1, 8)
+
+/* The below union makes it easier to deal with keys */
+union ubifs_key
+{
+	uint8_t u8[CUR_MAX_KEY_LEN];
+	uint32_t u32[CUR_MAX_KEY_LEN/4];
+	uint64_t u64[CUR_MAX_KEY_LEN/8];
+	__le32 j32[CUR_MAX_KEY_LEN/4];
+};
+
+/*
+ * LEB properties flags.
+ *
+ * LPROPS_UNCAT: not categorized
+ * LPROPS_DIRTY: dirty > 0, not index
+ * LPROPS_DIRTY_IDX: dirty + free > UBIFS_CH_SZ and index
+ * LPROPS_FREE: free > 0, not empty, not index
+ * LPROPS_HEAP_CNT: number of heaps used for storing categorized LEBs
+ * LPROPS_EMPTY: LEB is empty, not taken
+ * LPROPS_FREEABLE: free + dirty == leb_size, not index, not taken
+ * LPROPS_FRDI_IDX: free + dirty == leb_size and index, may be taken
+ * LPROPS_CAT_MASK: mask for the LEB categories above
+ * LPROPS_TAKEN: LEB was taken (this flag is not saved on the media)
+ * LPROPS_INDEX: LEB contains indexing nodes (this flag also exists on flash)
+ */
+enum {
+	LPROPS_UNCAT     =  0,
+	LPROPS_DIRTY     =  1,
+	LPROPS_DIRTY_IDX =  2,
+	LPROPS_FREE      =  3,
+	LPROPS_HEAP_CNT  =  3,
+	LPROPS_EMPTY     =  4,
+	LPROPS_FREEABLE  =  5,
+	LPROPS_FRDI_IDX  =  6,
+	LPROPS_CAT_MASK  = 15,
+	LPROPS_TAKEN     = 16,
+	LPROPS_INDEX     = 32,
+};
+
+/**
+ * struct ubifs_lprops - logical eraseblock properties.
+ * @free: amount of free space in bytes
+ * @dirty: amount of dirty space in bytes
+ * @flags: LEB properties flags (see above)
+ */
+struct ubifs_lprops
+{
+	int free;
+	int dirty;
+	int flags;
+};
+
+/**
+ * struct ubifs_lpt_lprops - LPT logical eraseblock properties.
+ * @free: amount of free space in bytes
+ * @dirty: amount of dirty space in bytes
+ */
+struct ubifs_lpt_lprops
+{
+	int free;
+	int dirty;
+};
+
+struct ubifs_nnode;
+
+/**
+ * struct ubifs_cnode - LEB Properties Tree common node.
+ * @parent: parent nnode
+ * @cnext: next cnode to commit
+ * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
+ * @iip: index in parent
+ * @level: level in the tree (zero for pnodes, greater than zero for nnodes)
+ * @num: node number
+ */
+struct ubifs_cnode
+{
+	struct ubifs_nnode *parent;
+	struct ubifs_cnode *cnext;
+	unsigned long flags;
+	int iip;
+	int level;
+	int num;
+};
+
+/**
+ * struct ubifs_pnode - LEB Properties Tree leaf node.
+ * @parent: parent nnode
+ * @cnext: next cnode to commit
+ * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
+ * @iip: index in parent
+ * @level: level in the tree (always zero for pnodes)
+ * @num: node number
+ * @lprops: LEB properties array
+ */
+struct ubifs_pnode
+{
+	struct ubifs_nnode *parent;
+	struct ubifs_cnode *cnext;
+	unsigned long flags;
+	int iip;
+	int level;
+	int num;
+	struct ubifs_lprops lprops[UBIFS_LPT_FANOUT];
+};
+
+/**
+ * struct ubifs_nbranch - LEB Properties Tree internal node branch.
+ * @lnum: LEB number of child
+ * @offs: offset of child
+ * @nnode: nnode child
+ * @pnode: pnode child
+ * @cnode: cnode child
+ */
+struct ubifs_nbranch
+{
+	int lnum;
+	int offs;
+	union
+	{
+		struct ubifs_nnode *nnode;
+		struct ubifs_pnode *pnode;
+		struct ubifs_cnode *cnode;
+	};
+};
+
+/**
+ * struct ubifs_nnode - LEB Properties Tree internal node.
+ * @parent: parent nnode
+ * @cnext: next cnode to commit
+ * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
+ * @iip: index in parent
+ * @level: level in the tree (always greater than zero for nnodes)
+ * @num: node number
+ * @nbranch: branches to child nodes
+ */
+struct ubifs_nnode
+{
+	struct ubifs_nnode *parent;
+	struct ubifs_cnode *cnext;
+	unsigned long flags;
+	int iip;
+	int level;
+	int num;
+	struct ubifs_nbranch nbranch[UBIFS_LPT_FANOUT];
+};
+
+/**
+ * struct ubifs_lp_stats - statistics of eraseblocks in the main area.
+ * @empty_lebs: number of empty LEBs
+ * @taken_empty_lebs: number of taken LEBs
+ * @idx_lebs: number of indexing LEBs
+ * @total_free: total free space in bytes
+ * @total_dirty: total dirty space in bytes
+ * @total_used: total used space in bytes (includes only data LEBs)
+ * @total_dead: total dead space in bytes (includes only data LEBs)
+ * @total_dark: total dark space in bytes (includes only data LEBs)
+ */
+struct ubifs_lp_stats {
+	int empty_lebs;
+	int taken_empty_lebs;
+	int idx_lebs;
+	long long total_free;
+	long long total_dirty;
+	long long total_used;
+	long long total_dead;
+	long long total_dark;
+};
+
+/**
+ * struct ubifs_zbranch - key/coordinate/length branch stored in znodes.
+ * @key: key
+ * @znode: znode address in memory
+ * @lnum: LEB number of the indexing node
+ * @offs: offset of the indexing node within @lnum
+ * @len: target node length
+ */
+struct ubifs_zbranch
+{
+	union ubifs_key key;
+	struct ubifs_znode *znode;
+	int lnum;
+	int offs;
+	int len;
+};
+
+/**
+ * struct ubifs_znode - in-memory representation of an indexing node.
+ * @parent: parent znode or NULL if it is the root
+ * @cnext: next znode to commit
+ * @flags: flags
+ * @time: last access time (seconds)
+ * @level: level of the entry in the TNC tree
+ * @child_cnt: count of child znodes
+ * @iip: index in parent's zbranch array
+ * @alt: lower bound of key range has altered i.e. child inserted at slot 0
+ * @zbranch: array of znode branches (@c->fanout elements)
+ */
+struct ubifs_znode
+{
+	struct ubifs_znode *parent;
+	struct ubifs_znode *cnext;
+	unsigned long flags;
+	unsigned long time;
+	int level;
+	int child_cnt;
+	int iip;
+	int alt;
+#ifdef CONFIG_UBIFS_FS_DEBUG
+	int lnum, offs, len;
+#endif
+	struct ubifs_zbranch zbranch[];
+};
+
+/**
+ * struct ubifs_info - UBIFS file-system description data structure
+ * (per-superblock).
+ *
+ * @highest_inum: highest used inode number
+ * @max_sqnum: current global sequence number
+ *
+ * @jhead_cnt: count of journal heads
+ * @max_bud_bytes: maximum number of bytes allowed in buds
+ *
+ * @zroot: zbranch which points to the root index node and znode
+ * @ihead_lnum: LEB number of index head
+ * @ihead_offs: offset of index head
+ *
+ * @log_lebs: number of logical eraseblocks in the log
+ * @lpt_lebs: number of LEBs used for lprops table
+ * @lpt_first: first LEB of the lprops table area
+ * @lpt_last: last LEB of the lprops table area
+ * @main_lebs: count of LEBs in the main area
+ * @main_first: first LEB of the main area
+ * @default_compr: default compression type
+ * @favor_lzo: favor LZO compression method
+ * @favor_percent: lzo vs. zlib threshold used in case favor LZO
+ *
+ * @key_hash_type: type of the key hash
+ * @key_hash: direntry key hash function
+ * @key_fmt: key format
+ * @key_len: key length
+ * @fanout: fanout of the index tree (number of links per indexing node)
+ *
+ * @min_io_size: minimal input/output unit size
+ * @leb_size: logical eraseblock size in bytes
+ * @leb_cnt: count of logical eraseblocks
+ * @max_leb_cnt: maximum count of logical eraseblocks
+ *
+ * @old_idx_sz: size of index on flash
+ * @lst: lprops statistics
+ *
+ * @dead_wm: LEB dead space watermark
+ * @dark_wm: LEB dark space watermark
+ *
+ * @di: UBI device information
+ * @vi: UBI volume information
+ *
+ * @gc_lnum: LEB number used for garbage collection
+ * @rp_size: reserved pool size
+ *
+ * @space_bits: number of bits needed to record free or dirty space
+ * @lpt_lnum_bits: number of bits needed to record a LEB number in the LPT
+ * @lpt_offs_bits: number of bits needed to record an offset in the LPT
+ * @lpt_spc_bits: number of bits needed to space in the LPT
+ * @pcnt_bits: number of bits needed to record pnode or nnode number
+ * @lnum_bits: number of bits needed to record LEB number
+ * @nnode_sz: size of on-flash nnode
+ * @pnode_sz: size of on-flash pnode
+ * @ltab_sz: size of on-flash LPT lprops table
+ * @lsave_sz: size of on-flash LPT save table
+ * @pnode_cnt: number of pnodes
+ * @nnode_cnt: number of nnodes
+ * @lpt_hght: height of the LPT
+ *
+ * @lpt_lnum: LEB number of the root nnode of the LPT
+ * @lpt_offs: offset of the root nnode of the LPT
+ * @nhead_lnum: LEB number of LPT head
+ * @nhead_offs: offset of LPT head
+ * @big_lpt: flag that LPT is too big to write whole during commit
+ * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
+ * @lpt_sz: LPT size
+ *
+ * @ltab_lnum: LEB number of LPT's own lprops table
+ * @ltab_offs: offset of LPT's own lprops table
+ * @lpt: lprops table
+ * @ltab: LPT's own lprops table
+ * @lsave_cnt: number of LEB numbers in LPT's save table
+ * @lsave_lnum: LEB number of LPT's save table
+ * @lsave_offs: offset of LPT's save table
+ * @lsave: LPT's save table
+ * @lscan_lnum: LEB number of last LPT scan
+ */
+struct ubifs_info
+{
+	ino_t highest_inum;
+	unsigned long long max_sqnum;
+
+	int jhead_cnt;
+	long long max_bud_bytes;
+
+	struct ubifs_zbranch zroot;
+	int ihead_lnum;
+	int ihead_offs;
+
+	int log_lebs;
+	int lpt_lebs;
+	int lpt_first;
+	int lpt_last;
+	int orph_lebs;
+	int main_lebs;
+	int main_first;
+	int default_compr;
+	int favor_lzo;
+	int favor_percent;
+
+	uint8_t key_hash_type;
+	uint32_t (*key_hash)(const char *str, int len);
+	int key_fmt;
+	int key_len;
+	int fanout;
+
+	int min_io_size;
+	int leb_size;
+	int leb_cnt;
+	int max_leb_cnt;
+
+	unsigned long long old_idx_sz;
+	struct ubifs_lp_stats lst;
+
+	int dead_wm;
+	int dark_wm;
+
+	struct ubi_dev_info di;
+	struct ubi_vol_info vi;
+
+	int gc_lnum;
+	long long rp_size;
+
+	int space_bits;
+	int lpt_lnum_bits;
+	int lpt_offs_bits;
+	int lpt_spc_bits;
+	int pcnt_bits;
+	int lnum_bits;
+	int nnode_sz;
+	int pnode_sz;
+	int ltab_sz;
+	int lsave_sz;
+	int pnode_cnt;
+	int nnode_cnt;
+	int lpt_hght;
+
+	int lpt_lnum;
+	int lpt_offs;
+	int nhead_lnum;
+	int nhead_offs;
+	int big_lpt;
+	int space_fixup;
+	long long lpt_sz;
+
+	int ltab_lnum;
+	int ltab_offs;
+	struct ubifs_lprops *lpt;
+	struct ubifs_lpt_lprops *ltab;
+	int lsave_cnt;
+	int lsave_lnum;
+	int lsave_offs;
+	int *lsave;
+	int lscan_lnum;
+
+};
+
+/**
+ * ubifs_idx_node_sz - return index node size.
+ * @c: the UBIFS file-system description object
+ * @child_cnt: number of children of this index node
+ */
+static inline int ubifs_idx_node_sz(const struct ubifs_info *c, int child_cnt)
+{
+	return UBIFS_IDX_NODE_SZ + (UBIFS_BRANCH_SZ + c->key_len) * child_cnt;
+}
+
+/**
+ * ubifs_idx_branch - return pointer to an index branch.
+ * @c: the UBIFS file-system description object
+ * @idx: index node
+ * @bnum: branch number
+ */
+static inline
+struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
+				      const struct ubifs_idx_node *idx,
+				      int bnum)
+{
+	return (struct ubifs_branch *)((void *)idx->branches +
+				       (UBIFS_BRANCH_SZ + c->key_len) * bnum);
+}
+
+#endif /* __UBIFS_H__ */
diff --git a/ubifs-utils/include/ubifs_common.h b/ubifs-utils/include/ubifs_common.h
new file mode 100644
index 0000000..958c20a
--- /dev/null
+++ b/ubifs-utils/include/ubifs_common.h
@@ -0,0 +1,50 @@
+#ifndef __UBIFS_COMMON_H__
+#define __UBIFS_COMMON_H__
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <limits.h>
+#include <string.h>
+#include <stdint.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <linux/types.h>
+#include <linux/fs.h>
+
+#include <getopt.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <dirent.h>
+#include <errno.h>
+#include <libgen.h>
+#include <ctype.h>
+#include <uuid/uuid.h>
+#include <sys/file.h>
+
+#include <mtd/ubifs-media.h>
+
+#include "libubi.h"
+#include "defs.h"
+
+extern int verbose;
+extern int debug_level;
+
+#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
+	printf("ubifs: %s: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
+} while(0)
+
+#define err_msg(fmt, ...) ({                                \
+	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__); \
+	-1;                                                 \
+})
+
+#define sys_err_msg(fmt, ...) ({                                         \
+	int err_ = errno;                                                \
+	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__);              \
+	fprintf(stderr, "       %s (error %d)\n", strerror(err_), err_); \
+	-1;                                                              \
+})
+#endif
diff --git a/ubifs-utils/lib/compr.c b/ubifs-utils/lib/compr.c
new file mode 100644
index 0000000..54604d4
--- /dev/null
+++ b/ubifs-utils/lib/compr.c
@@ -0,0 +1,228 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation.
+ * Copyright (C) 2008 University of Szeged, Hungary
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Artem Bityutskiy
+ *          Adrian Hunter
+ *          Zoltan Sogor
+ */
+
+#include "ubifs_common.h"
+#ifndef WITHOUT_LZO
+#include <lzo/lzo1x.h>
+#endif
+
+#define crc32 __zlib_crc32
+#include <zlib.h>
+#undef crc32
+
+#include "compr.h"
+
+static void *lzo_mem;
+static unsigned long long errcnt = 0;
+
+#define DEFLATE_DEF_LEVEL     Z_DEFAULT_COMPRESSION
+#define DEFLATE_DEF_WINBITS   11
+#define DEFLATE_DEF_MEMLEVEL  8
+
+static int zlib_deflate(void *in_buf, size_t in_len, void *out_buf,
+			size_t *out_len)
+{
+	z_stream strm;
+
+	strm.zalloc = NULL;
+	strm.zfree = NULL;
+
+	/*
+	 * Match exactly the zlib parameters used by the Linux kernel crypto
+	 * API.
+	 */
+        if (deflateInit2(&strm, DEFLATE_DEF_LEVEL, Z_DEFLATED,
+			 -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
+			 Z_DEFAULT_STRATEGY)) {
+		errcnt += 1;
+		return -1;
+	}
+
+	strm.next_in = in_buf;
+	strm.avail_in = in_len;
+	strm.total_in = 0;
+
+	strm.next_out = out_buf;
+	strm.avail_out = *out_len;
+	strm.total_out = 0;
+
+	if (deflate(&strm, Z_FINISH) != Z_STREAM_END) {
+		deflateEnd(&strm);
+		errcnt += 1;
+		return -1;
+	}
+
+	if (deflateEnd(&strm) != Z_OK) {
+		errcnt += 1;
+		return -1;
+	}
+
+	*out_len = strm.total_out;
+
+	return 0;
+}
+
+#ifndef WITHOUT_LZO
+static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
+			size_t *out_len)
+{
+	lzo_uint len;
+	int ret;
+
+	len = *out_len;
+	ret = lzo1x_999_compress(in_buf, in_len, out_buf, &len, lzo_mem);
+	*out_len = len;
+
+	if (ret != LZO_E_OK) {
+		errcnt += 1;
+		return -1;
+	}
+
+	return 0;
+}
+#endif
+
+static int no_compress(void *in_buf, size_t in_len, void *out_buf,
+		       size_t *out_len)
+{
+	memcpy(out_buf, in_buf, in_len);
+	*out_len = in_len;
+	return 0;
+}
+
+static char *zlib_buf;
+
+#ifndef WITHOUT_LZO
+static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
+				size_t *out_len, int *type, int lzo_percent)
+{
+	int lzo_ret, zlib_ret;
+	size_t lzo_len, zlib_len;
+
+	lzo_len = zlib_len = *out_len;
+	lzo_ret = lzo_compress(in_buf, in_len, out_buf, &lzo_len);
+	zlib_ret = zlib_deflate(in_buf, in_len, zlib_buf, &zlib_len);
+
+	if (lzo_ret && zlib_ret)
+		/* Both compressors failed */
+		return -1;
+
+	if (!lzo_ret && !zlib_ret) {
+		double percent;
+
+		/* Both compressors succeeded */
+		if (lzo_len <= zlib_len )
+			goto select_lzo;
+
+		percent = (double)zlib_len / (double)lzo_len;
+		percent *= 100;
+		if (percent > 100 - lzo_percent)
+			goto select_lzo;
+		goto select_zlib;
+	}
+
+	if (lzo_ret)
+		/* Only zlib compressor succeeded */
+		goto select_zlib;
+
+	/* Only LZO compressor succeeded */
+
+select_lzo:
+	*out_len = lzo_len;
+	*type = MKFS_UBIFS_COMPR_LZO;
+	return 0;
+
+select_zlib:
+	*out_len = zlib_len;
+	*type = MKFS_UBIFS_COMPR_ZLIB;
+	memcpy(out_buf, zlib_buf, zlib_len);
+	return 0;
+}
+#endif
+
+int compress_data(void *in_buf, size_t in_len, void *out_buf,
+		size_t *out_len, int type, int lzo_percent)
+{
+	int ret;
+
+	if (in_len < UBIFS_MIN_COMPR_LEN) {
+		no_compress(in_buf, in_len, out_buf, out_len);
+		return MKFS_UBIFS_COMPR_NONE;
+	}
+
+#ifdef WITHOUT_LZO
+	{
+		switch (type) {
+#else
+	if (lzo_percent)
+		ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type, lzo_percent);
+	else {
+		switch (type) {
+		case MKFS_UBIFS_COMPR_LZO:
+			ret = lzo_compress(in_buf, in_len, out_buf, out_len);
+			break;
+#endif
+		case MKFS_UBIFS_COMPR_ZLIB:
+			ret = zlib_deflate(in_buf, in_len, out_buf, out_len);
+			break;
+		case MKFS_UBIFS_COMPR_NONE:
+			ret = 1;
+			break;
+		default:
+			errcnt += 1;
+			ret = 1;
+			break;
+		}
+	}
+	if (ret || *out_len >= in_len) {
+		no_compress(in_buf, in_len, out_buf, out_len);
+		return MKFS_UBIFS_COMPR_NONE;
+	}
+	return type;
+}
+
+int init_compression(void)
+{
+#ifdef WITHOUT_LZO
+	lzo_mem = NULL;
+#else
+	lzo_mem = malloc(LZO1X_999_MEM_COMPRESS);
+	if (!lzo_mem)
+		return -1;
+#endif
+
+	zlib_buf = malloc(UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR);
+	if (!zlib_buf) {
+		free(lzo_mem);
+		return -1;
+	}
+
+	return 0;
+}
+
+void destroy_compression(void)
+{
+	free(zlib_buf);
+	free(lzo_mem);
+	if (errcnt)
+		fprintf(stderr, "%llu compression errors occurred\n", errcnt);
+}
diff --git a/ubifs-utils/lib/crc16.c b/ubifs-utils/lib/crc16.c
new file mode 100644
index 0000000..a19512e
--- /dev/null
+++ b/ubifs-utils/lib/crc16.c
@@ -0,0 +1,56 @@
+/*
+ * This code was taken from the linux kernel. The license is GPL Version 2.
+ */
+
+#include "crc16.h"
+
+/** CRC table for the CRC-16. The poly is 0x8005 (x^16 + x^15 + x^2 + 1) */
+uint16_t const crc16_table[256] = {
+	0x0000, 0xC0C1, 0xC181, 0x0140, 0xC301, 0x03C0, 0x0280, 0xC241,
+	0xC601, 0x06C0, 0x0780, 0xC741, 0x0500, 0xC5C1, 0xC481, 0x0440,
+	0xCC01, 0x0CC0, 0x0D80, 0xCD41, 0x0F00, 0xCFC1, 0xCE81, 0x0E40,
+	0x0A00, 0xCAC1, 0xCB81, 0x0B40, 0xC901, 0x09C0, 0x0880, 0xC841,
+	0xD801, 0x18C0, 0x1980, 0xD941, 0x1B00, 0xDBC1, 0xDA81, 0x1A40,
+	0x1E00, 0xDEC1, 0xDF81, 0x1F40, 0xDD01, 0x1DC0, 0x1C80, 0xDC41,
+	0x1400, 0xD4C1, 0xD581, 0x1540, 0xD701, 0x17C0, 0x1680, 0xD641,
+	0xD201, 0x12C0, 0x1380, 0xD341, 0x1100, 0xD1C1, 0xD081, 0x1040,
+	0xF001, 0x30C0, 0x3180, 0xF141, 0x3300, 0xF3C1, 0xF281, 0x3240,
+	0x3600, 0xF6C1, 0xF781, 0x3740, 0xF501, 0x35C0, 0x3480, 0xF441,
+	0x3C00, 0xFCC1, 0xFD81, 0x3D40, 0xFF01, 0x3FC0, 0x3E80, 0xFE41,
+	0xFA01, 0x3AC0, 0x3B80, 0xFB41, 0x3900, 0xF9C1, 0xF881, 0x3840,
+	0x2800, 0xE8C1, 0xE981, 0x2940, 0xEB01, 0x2BC0, 0x2A80, 0xEA41,
+	0xEE01, 0x2EC0, 0x2F80, 0xEF41, 0x2D00, 0xEDC1, 0xEC81, 0x2C40,
+	0xE401, 0x24C0, 0x2580, 0xE541, 0x2700, 0xE7C1, 0xE681, 0x2640,
+	0x2200, 0xE2C1, 0xE381, 0x2340, 0xE101, 0x21C0, 0x2080, 0xE041,
+	0xA001, 0x60C0, 0x6180, 0xA141, 0x6300, 0xA3C1, 0xA281, 0x6240,
+	0x6600, 0xA6C1, 0xA781, 0x6740, 0xA501, 0x65C0, 0x6480, 0xA441,
+	0x6C00, 0xACC1, 0xAD81, 0x6D40, 0xAF01, 0x6FC0, 0x6E80, 0xAE41,
+	0xAA01, 0x6AC0, 0x6B80, 0xAB41, 0x6900, 0xA9C1, 0xA881, 0x6840,
+	0x7800, 0xB8C1, 0xB981, 0x7940, 0xBB01, 0x7BC0, 0x7A80, 0xBA41,
+	0xBE01, 0x7EC0, 0x7F80, 0xBF41, 0x7D00, 0xBDC1, 0xBC81, 0x7C40,
+	0xB401, 0x74C0, 0x7580, 0xB541, 0x7700, 0xB7C1, 0xB681, 0x7640,
+	0x7200, 0xB2C1, 0xB381, 0x7340, 0xB101, 0x71C0, 0x7080, 0xB041,
+	0x5000, 0x90C1, 0x9181, 0x5140, 0x9301, 0x53C0, 0x5280, 0x9241,
+	0x9601, 0x56C0, 0x5780, 0x9741, 0x5500, 0x95C1, 0x9481, 0x5440,
+	0x9C01, 0x5CC0, 0x5D80, 0x9D41, 0x5F00, 0x9FC1, 0x9E81, 0x5E40,
+	0x5A00, 0x9AC1, 0x9B81, 0x5B40, 0x9901, 0x59C0, 0x5880, 0x9841,
+	0x8801, 0x48C0, 0x4980, 0x8941, 0x4B00, 0x8BC1, 0x8A81, 0x4A40,
+	0x4E00, 0x8EC1, 0x8F81, 0x4F40, 0x8D01, 0x4DC0, 0x4C80, 0x8C41,
+	0x4400, 0x84C1, 0x8581, 0x4540, 0x8701, 0x47C0, 0x4680, 0x8641,
+	0x8201, 0x42C0, 0x4380, 0x8341, 0x4100, 0x81C1, 0x8081, 0x4040
+};
+
+/**
+ * crc16 - compute the CRC-16 for the data buffer
+ * @crc:	previous CRC value
+ * @buffer:	data pointer
+ * @len:	number of bytes in the buffer
+ *
+ * Returns the updated CRC value.
+ */
+uint16_t crc16(uint16_t crc, uint8_t const *buffer, size_t len)
+{
+	while (len--)
+		crc = crc16_byte(crc, *buffer++);
+	return crc;
+}
diff --git a/ubifs-utils/lib/devtable.c b/ubifs-utils/lib/devtable.c
new file mode 100644
index 0000000..e6ec319
--- /dev/null
+++ b/ubifs-utils/lib/devtable.c
@@ -0,0 +1,525 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Author: Artem Bityutskiy
+ *
+ * Part of the device table parsing code was taken from the mkfs.jffs2 utility.
+ * The original author of that code is Erik Andersen, hence:
+ *	Copyright (C) 2001, 2002 Erik Andersen <andersen@codepoet.org>
+ */
+
+/*
+ * This file implemented device table support. Device table entries take the
+ * form of:
+ * <path>    <type> <mode> <uid> <gid> <major> <minor> <start>	<inc> <count>
+ * /dev/mem  c       640   0     0     1       1       0        0     -
+ *
+ * Type can be one of:
+ * f  A regular file
+ * d  Directory
+ * c  Character special device file
+ * b  Block special device file
+ * p  Fifo (named pipe)
+ *
+ * Don't bother with symlinks (permissions are irrelevant), hard links (special
+ * cases of regular files), or sockets (why bother).
+ *
+ * Regular files must exist in the target root directory. If a char, block,
+ * fifo, or directory does not exist, it will be created.
+ *
+ * Please, refer the device_table.txt file which can be found at MTD utilities
+ * for more information about what the device table is.
+ */
+
+#include "ubifs_common.h"
+#include "devtable.h"
+#include "hashtable.h"
+#include "hashtable_itr.h"
+
+/*
+ * The hash table which contains paths to files/directories/device nodes
+ * referred to in the device table. For example, if the device table refers
+ * "/dev/loop0", the @path_htbl will contain "/dev" element.
+ */
+static struct hashtable *path_htbl;
+
+/* Hash function used for hash tables */
+static unsigned int r5_hash(void *s)
+{
+	unsigned int a = 0;
+	const signed char *str = s;
+
+	while (*str) {
+		a += *str << 4;
+		a += *str >> 4;
+		a *= 11;
+		str++;
+	}
+
+	return a;
+}
+
+/*
+ * Check whether 2 keys of a hash table are equivalent. The keys are path/file
+ * names, so we simply use 'strcmp()'.
+ */
+static int is_equivalent(void *k1, void *k2)
+{
+	return !strcmp(k1, k2);
+}
+
+/**
+ * separate_last - separate out the last path component
+ * @buf: the path to split
+ * @len: length of the @buf string
+ * @path: the beginning of path is returned here
+ * @name: the last path component is returned here
+ *
+ * This helper function separates out the the last component of the full path
+ * string. For example, "/dev/loop" would be split on "/dev" and "loop". This
+ * function allocates memory for @path and @name and return the result there.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+static int separate_last(const char *buf, int len, char **path, char **name)
+{
+	int path_len = len, name_len;
+	const char *p = buf + len, *n;
+
+	while (*--p != '/')
+		path_len -= 1;
+
+	/* Drop the final '/' unless this is the root directory */
+	name_len = len - path_len;
+	n = buf + path_len;
+	if (path_len > 1)
+		path_len -= 1;
+
+	*path = malloc(path_len + 1);
+	if (!*path)
+		return err_msg("cannot allocate %d bytes of memory",
+			       path_len + 1);
+	memcpy(*path, buf, path_len);
+	(*path)[path_len] = '\0';
+
+	*name = malloc(name_len + 1);
+	if (!*name) {
+		free(*path);
+		return err_msg("cannot allocate %d bytes of memory",
+			       name_len + 1);
+	}
+	memcpy(*name, n, name_len + 1);
+
+	return 0;
+}
+
+static int interpret_table_entry(const char *line)
+{
+	char buf[1024], type, *path = NULL, *name = NULL;
+	int len;
+	struct path_htbl_element *ph_elt = NULL;
+	struct name_htbl_element *nh_elt = NULL;
+	unsigned int mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
+	unsigned int start = 0, increment = 0, count = 0;
+
+	if (sscanf(line, "%1023s %c %o %u %u %u %u %u %u %u",
+		   buf, &type, &mode, &uid, &gid, &major, &minor,
+		   &start, &increment, &count) < 0)
+		return sys_err_msg("sscanf failed");
+
+	dbg_msg(3, "name %s, type %c, mode %o, uid %u, gid %u, major %u, "
+		"minor %u, start %u, inc %u, cnt %u",
+		buf, type, mode, uid, gid, major, minor, start,
+		increment, count);
+
+	len = strnlen(buf, 1024);
+	if (len == 1024)
+		return err_msg("too long path");
+
+	if (!strcmp(buf, "/"))
+		return err_msg("device table entries require absolute paths");
+	if (buf[1] == '\0')
+		return err_msg("root directory cannot be created");
+	if (strstr(buf, "//"))
+		return err_msg("'//' cannot be used in the path");
+	if (buf[len - 1] == '/')
+		return err_msg("do not put '/' at the end");
+
+	if (strstr(buf, "/./") || strstr(buf, "/../") ||
+	    !strcmp(buf + len - 2, "/.") || !strcmp(buf + len - 3, "/.."))
+		return err_msg("'.' and '..' cannot be used in the path");
+
+	switch (type) {
+		case 'd':
+			mode |= S_IFDIR;
+			break;
+		case 'f':
+			mode |= S_IFREG;
+			break;
+		case 'p':
+			mode |= S_IFIFO;
+			break;
+		case 'c':
+			mode |= S_IFCHR;
+			break;
+		case 'b':
+			mode |= S_IFBLK;
+			break;
+		default:
+			return err_msg("unsupported file type '%c'", type);
+	}
+
+	if (separate_last(buf, len, &path, &name))
+		return -1;
+
+	/*
+	 * Check if this path already exist in the path hash table and add it
+	 * if it is not.
+	 */
+	ph_elt = hashtable_search(path_htbl, path);
+	if (!ph_elt) {
+		dbg_msg(3, "inserting '%s' into path hash table", path);
+		ph_elt = malloc(sizeof(struct path_htbl_element));
+		if (!ph_elt) {
+			err_msg("cannot allocate %zd bytes of memory",
+				sizeof(struct path_htbl_element));
+			goto out_free;
+		}
+
+		if (!hashtable_insert(path_htbl, path, ph_elt)) {
+			err_msg("cannot insert into path hash table");
+			goto out_free;
+		}
+
+		ph_elt->path = path;
+		path = NULL;
+		ph_elt->name_htbl = create_hashtable(128, &r5_hash,
+						     &is_equivalent);
+		if (!ph_elt->name_htbl) {
+			err_msg("cannot create name hash table");
+			goto out_free;
+		}
+	}
+
+	if (increment != 0 && count == 0)
+		return err_msg("count cannot be zero if increment is non-zero");
+
+	/*
+	 * Add the file/directory/device node (last component of the path) to
+	 * the name hashtable. The name hashtable resides in the corresponding
+	 * path hashtable element.
+	 */
+
+	if (count == 0) {
+		/* This entry does not require any iterating */
+		nh_elt = malloc(sizeof(struct name_htbl_element));
+		if (!nh_elt) {
+			err_msg("cannot allocate %zd bytes of memory",
+				sizeof(struct name_htbl_element));
+			goto out_free;
+		}
+
+		nh_elt->mode = mode;
+		nh_elt->uid = uid;
+		nh_elt->gid = gid;
+		nh_elt->dev = makedev(major, minor);
+
+		dbg_msg(3, "inserting '%s' into name hash table (major %d, minor %d)",
+			name, major(nh_elt->dev), minor(nh_elt->dev));
+
+		if (hashtable_search(ph_elt->name_htbl, name))
+			return err_msg("'%s' is referred twice", buf);
+
+		nh_elt->name = name;
+		if (!hashtable_insert(ph_elt->name_htbl, name, nh_elt)) {
+			err_msg("cannot insert into name hash table");
+			goto out_free;
+		}
+	} else {
+		int i, num = start + count, len = strlen(name) + 20;
+		char *nm;
+
+		for (i = start; i < num; i++) {
+			nh_elt = malloc(sizeof(struct name_htbl_element));
+			if (!nh_elt) {
+				err_msg("cannot allocate %zd bytes of memory",
+					sizeof(struct name_htbl_element));
+				goto out_free;
+			}
+
+			nh_elt->mode = mode;
+			nh_elt->uid = uid;
+			nh_elt->gid = gid;
+			nh_elt->dev = makedev(major, minor + (i - start) * increment);
+
+			nm = malloc(len);
+			if (!nm) {
+				err_msg("cannot allocate %d bytes of memory", len);
+				goto out_free;
+			}
+
+			sprintf(nm, "%s%d", name, i);
+			nh_elt->name = nm;
+
+			dbg_msg(3, "inserting '%s' into name hash table (major %d, minor %d)",
+			        nm, major(nh_elt->dev), minor(nh_elt->dev));
+
+			if (hashtable_search(ph_elt->name_htbl, nm)) {
+				err_msg("'%s' is referred twice", buf);
+				free (nm);
+				goto out_free;
+			}
+
+			if (!hashtable_insert(ph_elt->name_htbl, nm, nh_elt)) {
+				err_msg("cannot insert into name hash table");
+				free (nm);
+				goto out_free;
+			}
+		}
+		free(name);
+		name = NULL;
+	}
+
+	return 0;
+
+out_free:
+	free(ph_elt);
+	free(nh_elt);
+	free(path);
+	free(name);
+	return -1;
+}
+
+/**
+ * parse_devtable - parse the device table.
+ * @tbl_file: device table file name
+ *
+ * This function parses the device table and prepare the hash table which will
+ * later be used by mkfs.ubifs to create the specified files/device nodes.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+int parse_devtable(const char *tbl_file)
+{
+	FILE *f;
+	char *line = NULL;
+	struct stat st;
+	size_t len;
+
+	dbg_msg(1, "parsing device table file '%s'", tbl_file);
+
+	path_htbl = create_hashtable(128, &r5_hash, &is_equivalent);
+	if (!path_htbl)
+		return err_msg("cannot create path hash table");
+
+	f = fopen(tbl_file, "r");
+	if (!f)
+		return sys_err_msg("cannot open '%s'", tbl_file);
+
+	if (fstat(fileno(f), &st) < 0) {
+		sys_err_msg("cannot stat '%s'", tbl_file);
+		goto out_close;
+	}
+
+	if (st.st_size < 10) {
+		sys_err_msg("'%s' is too short", tbl_file);
+		goto out_close;
+	}
+
+	/*
+	 * The general plan now is to read in one line at a time, check for
+	 * leading comment delimiters ('#'), then try and parse the line as a
+	 * device table
+	 */
+	while (getline(&line, &len, f) != -1) {
+		/* First trim off any white-space */
+		len = strlen(line);
+
+		/* Trim trailing white-space */
+		while (len > 0 && isspace(line[len - 1]))
+			line[--len] = '\0';
+		/* Trim leading white-space */
+		memmove(line, &line[strspn(line, " \n\r\t\v")], len);
+
+		/* How long are we after trimming? */
+		len = strlen(line);
+
+		/* If this is not a comment line, try to interpret it */
+		if (len && *line != '#') {
+			if (interpret_table_entry(line)) {
+				err_msg("cannot parse '%s'", line);
+				goto out_close;
+			}
+		}
+
+		free(line);
+		line = NULL;
+	}
+
+	dbg_msg(1, "finished parsing");
+	fclose(f);
+	return 0;
+
+out_close:
+	fclose(f);
+	free_devtable_info();
+	return -1;
+}
+
+/**
+ * devtbl_find_path - find a path in the path hash table.
+ * @path: UBIFS path to find.
+ *
+ * This looks up the path hash table. Returns the path hash table element
+ * reference if @path was found and %NULL if not.
+ */
+struct path_htbl_element *devtbl_find_path(const char *path)
+{
+	if (!path_htbl)
+		return NULL;
+
+	return hashtable_search(path_htbl, (void *)path);
+}
+
+/**
+ * devtbl_find_name - find a name in the name hash table.
+ * @ph_etl: path hash table element to find at
+ * @name: name to find
+ *
+ * This looks up the name hash table. Returns the name hash table element
+ * reference if @name found and %NULL if not.
+ */
+struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
+					   const char *name)
+{
+	if (!path_htbl)
+		return NULL;
+
+	return hashtable_search(ph_elt->name_htbl, (void *)name);
+}
+
+/**
+ * override_attributes - override inode attributes.
+ * @st: struct stat object to containing the attributes to override
+ * @ph_elt: path hash table element object
+ * @nh_elt: name hash table element object containing the new values
+ *
+ * The device table file may override attributes like UID of files. For
+ * example, the device table may contain a "/dev" entry, and the UBIFS FS on
+ * the host may contain "/dev" directory. In this case the attributes of the
+ * "/dev" directory inode has to be as the device table specifies.
+ *
+ * Note, the hash element is removed by this function as well.
+ */
+int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
+			struct name_htbl_element *nh_elt)
+{
+	if (!path_htbl)
+		return 0;
+
+	if (S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode) ||
+	    S_ISFIFO(st->st_mode))
+		return err_msg("%s/%s both exists at UBIFS root at host, "
+			       "and is referred from the device table",
+			       strcmp(ph_elt->path, "/") ? ph_elt->path : "",
+			       nh_elt->name);
+
+	if ((st->st_mode & S_IFMT) != (nh_elt->mode & S_IFMT))
+		return err_msg("%s/%s is referred from the device table also exists in "
+			       "the UBIFS root directory at host, but the file type is "
+			       "different", strcmp(ph_elt->path, "/") ? ph_elt->path : "",
+			       nh_elt->name);
+
+	dbg_msg(3, "set UID %d, GID %d, mode %o for %s/%s as device table says",
+		nh_elt->uid, nh_elt->gid, nh_elt->mode, ph_elt->path, nh_elt->name);
+
+	st->st_uid = nh_elt->uid;
+	st->st_gid = nh_elt->gid;
+	st->st_mode = nh_elt->mode;
+
+	hashtable_remove(ph_elt->name_htbl, (void *)nh_elt->name);
+	return 0;
+}
+
+/**
+ * first_name_htbl_element - return first element of the name hash table.
+ * @ph_elt: the path hash table the name hash table belongs to
+ * @itr: double pointer to a 'struct hashtable_itr' object where the
+ *       information about further iterations is stored
+ *
+ * This function implements name hash table iteration together with
+ * 'next_name_htbl_element()'. Returns the first name hash table element or
+ * %NULL if the hash table is empty.
+ */
+struct name_htbl_element *
+first_name_htbl_element(struct path_htbl_element *ph_elt,
+			struct hashtable_itr **itr)
+{
+	if (!path_htbl || !ph_elt || hashtable_count(ph_elt->name_htbl) == 0)
+		return NULL;
+
+	*itr = hashtable_iterator(ph_elt->name_htbl);
+	return hashtable_iterator_value(*itr);
+}
+
+/**
+ * first_name_htbl_element - return next element of the name hash table.
+ * @ph_elt: the path hash table the name hash table belongs to
+ * @itr: double pointer to a 'struct hashtable_itr' object where the
+ *       information about further iterations is stored
+ *
+ * This function implements name hash table iteration together with
+ * 'first_name_htbl_element()'. Returns the next name hash table element or
+ * %NULL if there are no more elements.
+ */
+struct name_htbl_element *
+next_name_htbl_element(struct path_htbl_element *ph_elt,
+		       struct hashtable_itr **itr)
+{
+	if (!path_htbl || !ph_elt || !hashtable_iterator_advance(*itr))
+		return NULL;
+
+	return hashtable_iterator_value(*itr);
+}
+
+/**
+ * free_devtable_info - free device table information.
+ *
+ * This function frees the path hash table and the name hash tables.
+ */
+void free_devtable_info(void)
+{
+	struct hashtable_itr *ph_itr;
+	struct path_htbl_element *ph_elt;
+
+	if (!path_htbl)
+		return;
+
+	if (hashtable_count(path_htbl) > 0) {
+		ph_itr = hashtable_iterator(path_htbl);
+		do {
+			ph_elt = hashtable_iterator_value(ph_itr);
+			/*
+			 * Note, since we use the same string for the key and
+			 * @name in the name hash table elements, we do not
+			 * have to iterate name hash table because @name memory
+			 * will be freed when freeing the key.
+			 */
+			hashtable_destroy(ph_elt->name_htbl, 1);
+		} while (hashtable_iterator_advance(ph_itr));
+	}
+	hashtable_destroy(path_htbl, 1);
+}
diff --git a/ubifs-utils/lib/hashtable.c b/ubifs-utils/lib/hashtable.c
new file mode 100644
index 0000000..c1f99ed
--- /dev/null
+++ b/ubifs-utils/lib/hashtable.c
@@ -0,0 +1,277 @@
+/* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
+
+#define PROGRAM_NAME "hashtable"
+
+#include "common.h"
+#include "hashtable.h"
+#include "hashtable_private.h"
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <math.h>
+
+/*
+Credit for primes table: Aaron Krowne
+ http://br.endernet.org/~akrowne/
+ http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
+*/
+static const unsigned int primes[] = {
+53, 97, 193, 389,
+769, 1543, 3079, 6151,
+12289, 24593, 49157, 98317,
+196613, 393241, 786433, 1572869,
+3145739, 6291469, 12582917, 25165843,
+50331653, 100663319, 201326611, 402653189,
+805306457, 1610612741
+};
+const unsigned int prime_table_length = ARRAY_SIZE(primes);
+const float max_load_factor = 0.65;
+
+/*****************************************************************************/
+struct hashtable *
+create_hashtable(unsigned int minsize,
+                 unsigned int (*hashf) (void*),
+                 int (*eqf) (void*,void*))
+{
+    struct hashtable *h;
+    unsigned int pindex, size = primes[0];
+    /* Check requested hashtable isn't too large */
+    if (minsize > (1u << 30)) return NULL;
+    /* Enforce size as prime */
+    for (pindex=0; pindex < prime_table_length; pindex++) {
+        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
+    }
+    h = (struct hashtable *)malloc(sizeof(struct hashtable));
+    if (NULL == h) return NULL; /*oom*/
+    h->table = (struct entry **)malloc(sizeof(struct entry*) * size);
+    if (NULL == h->table) { free(h); return NULL; } /*oom*/
+    memset(h->table, 0, size * sizeof(struct entry *));
+    h->tablelength  = size;
+    h->primeindex   = pindex;
+    h->entrycount   = 0;
+    h->hashfn       = hashf;
+    h->eqfn         = eqf;
+    h->loadlimit    = (unsigned int) ceil(size * max_load_factor);
+    return h;
+}
+
+/*****************************************************************************/
+unsigned int
+hash(struct hashtable *h, void *k)
+{
+    /* Aim to protect against poor hash functions by adding logic here
+     * - logic taken from java 1.4 hashtable source */
+    unsigned int i = h->hashfn(k);
+    i += ~(i << 9);
+    i ^=  ((i >> 14) | (i << 18)); /* >>> */
+    i +=  (i << 4);
+    i ^=  ((i >> 10) | (i << 22)); /* >>> */
+    return i;
+}
+
+/*****************************************************************************/
+static int
+hashtable_expand(struct hashtable *h)
+{
+    /* Double the size of the table to accomodate more entries */
+    struct entry **newtable;
+    struct entry *e;
+    struct entry **pE;
+    unsigned int newsize, i, index;
+    /* Check we're not hitting max capacity */
+    if (h->primeindex == (prime_table_length - 1)) return 0;
+    newsize = primes[++(h->primeindex)];
+
+    newtable = (struct entry **)malloc(sizeof(struct entry*) * newsize);
+    if (NULL != newtable)
+    {
+        memset(newtable, 0, newsize * sizeof(struct entry *));
+        /* This algorithm is not 'stable'. ie. it reverses the list
+         * when it transfers entries between the tables */
+        for (i = 0; i < h->tablelength; i++) {
+            while (NULL != (e = h->table[i])) {
+                h->table[i] = e->next;
+                index = indexFor(newsize,e->h);
+                e->next = newtable[index];
+                newtable[index] = e;
+            }
+        }
+        free(h->table);
+        h->table = newtable;
+    }
+    /* Plan B: realloc instead */
+    else
+    {
+        newtable = (struct entry **)
+                   realloc(h->table, newsize * sizeof(struct entry *));
+        if (NULL == newtable) { (h->primeindex)--; return 0; }
+        h->table = newtable;
+        memset(newtable[h->tablelength], 0, newsize - h->tablelength);
+        for (i = 0; i < h->tablelength; i++) {
+            for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
+                index = indexFor(newsize,e->h);
+                if (index == i)
+                {
+                    pE = &(e->next);
+                }
+                else
+                {
+                    *pE = e->next;
+                    e->next = newtable[index];
+                    newtable[index] = e;
+                }
+            }
+        }
+    }
+    h->tablelength = newsize;
+    h->loadlimit   = (unsigned int) ceil(newsize * max_load_factor);
+    return -1;
+}
+
+/*****************************************************************************/
+unsigned int
+hashtable_count(struct hashtable *h)
+{
+    return h->entrycount;
+}
+
+/*****************************************************************************/
+int
+hashtable_insert(struct hashtable *h, void *k, void *v)
+{
+    /* This method allows duplicate keys - but they shouldn't be used */
+    unsigned int index;
+    struct entry *e;
+    if (++(h->entrycount) > h->loadlimit)
+    {
+        /* Ignore the return value. If expand fails, we should
+         * still try cramming just this value into the existing table
+         * -- we may not have memory for a larger table, but one more
+         * element may be ok. Next time we insert, we'll try expanding again.*/
+        hashtable_expand(h);
+    }
+    e = (struct entry *)malloc(sizeof(struct entry));
+    if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
+    e->h = hash(h,k);
+    index = indexFor(h->tablelength,e->h);
+    e->k = k;
+    e->v = v;
+    e->next = h->table[index];
+    h->table[index] = e;
+    return -1;
+}
+
+/*****************************************************************************/
+void * /* returns value associated with key */
+hashtable_search(struct hashtable *h, void *k)
+{
+    struct entry *e;
+    unsigned int hashvalue, index;
+    hashvalue = hash(h,k);
+    index = indexFor(h->tablelength,hashvalue);
+    e = h->table[index];
+    while (NULL != e)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
+        e = e->next;
+    }
+    return NULL;
+}
+
+/*****************************************************************************/
+void * /* returns value associated with key */
+hashtable_remove(struct hashtable *h, void *k)
+{
+    /* TODO: consider compacting the table when the load factor drops enough,
+     *       or provide a 'compact' method. */
+
+    struct entry *e;
+    struct entry **pE;
+    void *v;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h,k);
+    index = indexFor(h->tablelength,hash(h,k));
+    pE = &(h->table[index]);
+    e = *pE;
+    while (NULL != e)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
+        {
+            *pE = e->next;
+            h->entrycount--;
+            v = e->v;
+            freekey(e->k);
+            free(e);
+            return v;
+        }
+        pE = &(e->next);
+        e = e->next;
+    }
+    return NULL;
+}
+
+/*****************************************************************************/
+/* destroy */
+void
+hashtable_destroy(struct hashtable *h, int free_values)
+{
+    unsigned int i;
+    struct entry *e, *f;
+    struct entry **table = h->table;
+    if (free_values)
+    {
+        for (i = 0; i < h->tablelength; i++)
+        {
+            e = table[i];
+            while (NULL != e)
+            { f = e; e = e->next; freekey(f->k); free(f->v); free(f); }
+        }
+    }
+    else
+    {
+        for (i = 0; i < h->tablelength; i++)
+        {
+            e = table[i];
+            while (NULL != e)
+            { f = e; e = e->next; freekey(f->k); free(f); }
+        }
+    }
+    free(h->table);
+    free(h);
+}
+
+/*
+ * Copyright (c) 2002, Christopher Clark
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the distribution.
+ *
+ * * Neither the name of the original author; nor the names of any contributors
+ * may be used to endorse or promote products derived from this software
+ * without specific prior written permission.
+ *
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
+ * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+*/
diff --git a/ubifs-utils/lib/hashtable_itr.c b/ubifs-utils/lib/hashtable_itr.c
new file mode 100644
index 0000000..d102453
--- /dev/null
+++ b/ubifs-utils/lib/hashtable_itr.c
@@ -0,0 +1,176 @@
+/* Copyright (C) 2002, 2004 Christopher Clark  <firstname.lastname@cl.cam.ac.uk> */
+
+#include "hashtable.h"
+#include "hashtable_private.h"
+#include "hashtable_itr.h"
+#include <stdlib.h> /* defines NULL */
+
+/*****************************************************************************/
+/* hashtable_iterator    - iterator constructor */
+
+struct hashtable_itr *
+hashtable_iterator(struct hashtable *h)
+{
+    unsigned int i, tablelength;
+    struct hashtable_itr *itr = (struct hashtable_itr *)
+        malloc(sizeof(struct hashtable_itr));
+    if (NULL == itr) return NULL;
+    itr->h = h;
+    itr->e = NULL;
+    itr->parent = NULL;
+    tablelength = h->tablelength;
+    itr->index = tablelength;
+    if (0 == h->entrycount) return itr;
+
+    for (i = 0; i < tablelength; i++)
+    {
+        if (NULL != h->table[i])
+        {
+            itr->e = h->table[i];
+            itr->index = i;
+            break;
+        }
+    }
+    return itr;
+}
+
+/*****************************************************************************/
+/* advance - advance the iterator to the next element
+ *           returns zero if advanced to end of table */
+
+int
+hashtable_iterator_advance(struct hashtable_itr *itr)
+{
+    unsigned int j,tablelength;
+    struct entry **table;
+    struct entry *next;
+    if (NULL == itr->e) return 0; /* stupidity check */
+
+    next = itr->e->next;
+    if (NULL != next)
+    {
+        itr->parent = itr->e;
+        itr->e = next;
+        return -1;
+    }
+    tablelength = itr->h->tablelength;
+    itr->parent = NULL;
+    if (tablelength <= (j = ++(itr->index)))
+    {
+        itr->e = NULL;
+        return 0;
+    }
+    table = itr->h->table;
+    while (NULL == (next = table[j]))
+    {
+        if (++j >= tablelength)
+        {
+            itr->index = tablelength;
+            itr->e = NULL;
+            return 0;
+        }
+    }
+    itr->index = j;
+    itr->e = next;
+    return -1;
+}
+
+/*****************************************************************************/
+/* remove - remove the entry at the current iterator position
+ *          and advance the iterator, if there is a successive
+ *          element.
+ *          If you want the value, read it before you remove:
+ *          beware memory leaks if you don't.
+ *          Returns zero if end of iteration. */
+
+int
+hashtable_iterator_remove(struct hashtable_itr *itr)
+{
+    struct entry *remember_e, *remember_parent;
+    int ret;
+
+    /* Do the removal */
+    if (NULL == (itr->parent))
+    {
+        /* element is head of a chain */
+        itr->h->table[itr->index] = itr->e->next;
+    } else {
+        /* element is mid-chain */
+        itr->parent->next = itr->e->next;
+    }
+    /* itr->e is now outside the hashtable */
+    remember_e = itr->e;
+    itr->h->entrycount--;
+    freekey(remember_e->k);
+
+    /* Advance the iterator, correcting the parent */
+    remember_parent = itr->parent;
+    ret = hashtable_iterator_advance(itr);
+    if (itr->parent == remember_e) { itr->parent = remember_parent; }
+    free(remember_e);
+    return ret;
+}
+
+/*****************************************************************************/
+int /* returns zero if not found */
+hashtable_iterator_search(struct hashtable_itr *itr,
+                          struct hashtable *h, void *k)
+{
+    struct entry *e, *parent;
+    unsigned int hashvalue, index;
+
+    hashvalue = hash(h,k);
+    index = indexFor(h->tablelength,hashvalue);
+
+    e = h->table[index];
+    parent = NULL;
+    while (NULL != e)
+    {
+        /* Check hash value to short circuit heavier comparison */
+        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
+        {
+            itr->index = index;
+            itr->e = e;
+            itr->parent = parent;
+            itr->h = h;
+            return -1;
+        }
+        parent = e;
+        e = e->next;
+    }
+    return 0;
+}
+
+
+/*
+ * Copyright (c) 2002, 2004, Christopher Clark
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the distribution.
+ *
+ * * Neither the name of the original author; nor the names of any contributors
+ * may be used to endorse or promote products derived from this software
+ * without specific prior written permission.
+ *
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
+ * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+ * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+*/
diff --git a/ubifs-utils/lib/io.c b/ubifs-utils/lib/io.c
new file mode 100644
index 0000000..7aba0a6
--- /dev/null
+++ b/ubifs-utils/lib/io.c
@@ -0,0 +1,33 @@
+#include "io.h"
+#define PROGRAM_NAME "ubifs-io"
+#include <common.h>
+
+int out_fd;
+int out_ubi;
+libubi_t ubi;
+
+/**
+ * write_leb - copy the image of a LEB to the output target.
+ * @lnum: LEB number
+ * @len: length of data in the buffer
+ * @buf: buffer (must be at least c->leb_size bytes)
+ */
+int write_leb(struct ubifs_info *c, int lnum, int len, void *buf)
+{
+	off_t pos = (off_t)lnum * c->leb_size;
+
+	dbg_msg(3, "LEB %d len %d", lnum, len);
+	memset(buf + len, 0xff, c->leb_size - len);
+	if (out_ubi)
+		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size))
+			return sys_err_msg("ubi_leb_change_start failed");
+
+	if (lseek(out_fd, pos, SEEK_SET) != pos)
+		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
+
+	if (write(out_fd, buf, c->leb_size) != c->leb_size)
+		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
+				   c->leb_size, pos);
+
+	return 0;
+}
diff --git a/ubifs-utils/lib/lpt.c b/ubifs-utils/lib/lpt.c
new file mode 100644
index 0000000..100d747
--- /dev/null
+++ b/ubifs-utils/lib/lpt.c
@@ -0,0 +1,587 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2006, 2007 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Adrian Hunter
+ *          Artem Bityutskiy
+ */
+
+#include "ubifs_common.h"
+
+/* common.h requires the PROGRAM_NAME macro */
+#define PROGRAM_NAME "ubifs-lpt"
+#include "common.h"
+
+#include "crc16.h"
+#include "ubifs.h"
+#include "lpt.h"
+#include "io.h"
+
+/**
+ * do_calc_lpt_geom - calculate sizes for the LPT area.
+ * @c: the UBIFS file-system description object
+ *
+ * Calculate the sizes of LPT bit fields, nodes, and tree, based on the
+ * properties of the flash and whether LPT is "big" (c->big_lpt).
+ */
+static void do_calc_lpt_geom(struct ubifs_info *c)
+{
+	int n, bits, per_leb_wastage;
+	long long sz, tot_wastage;
+
+	c->pnode_cnt = (c->main_lebs + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
+
+	n = (c->pnode_cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
+	c->nnode_cnt = n;
+	while (n > 1) {
+		n = (n + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
+		c->nnode_cnt += n;
+	}
+
+	c->lpt_hght = 1;
+	n = UBIFS_LPT_FANOUT;
+	while (n < c->pnode_cnt) {
+		c->lpt_hght += 1;
+		n <<= UBIFS_LPT_FANOUT_SHIFT;
+	}
+
+	c->space_bits = fls(c->leb_size) - 3;
+	c->lpt_lnum_bits = fls(c->lpt_lebs);
+	c->lpt_offs_bits = fls(c->leb_size - 1);
+	c->lpt_spc_bits = fls(c->leb_size);
+
+	n = (c->max_leb_cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
+	c->pcnt_bits = fls(n - 1);
+
+	c->lnum_bits = fls(c->max_leb_cnt - 1);
+
+	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
+	       (c->big_lpt ? c->pcnt_bits : 0) +
+	       (c->space_bits * 2 + 1) * UBIFS_LPT_FANOUT;
+	c->pnode_sz = (bits + 7) / 8;
+
+	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
+	       (c->big_lpt ? c->pcnt_bits : 0) +
+	       (c->lpt_lnum_bits + c->lpt_offs_bits) * UBIFS_LPT_FANOUT;
+	c->nnode_sz = (bits + 7) / 8;
+
+	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
+	       c->lpt_lebs * c->lpt_spc_bits * 2;
+	c->ltab_sz = (bits + 7) / 8;
+
+	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
+	       c->lnum_bits * c->lsave_cnt;
+	c->lsave_sz = (bits + 7) / 8;
+
+	/* Calculate the minimum LPT size */
+	c->lpt_sz = (long long)c->pnode_cnt * c->pnode_sz;
+	c->lpt_sz += (long long)c->nnode_cnt * c->nnode_sz;
+	c->lpt_sz += c->ltab_sz;
+	c->lpt_sz += c->lsave_sz;
+
+	/* Add wastage */
+	sz = c->lpt_sz;
+	per_leb_wastage = max_t(int, c->pnode_sz, c->nnode_sz);
+	sz += per_leb_wastage;
+	tot_wastage = per_leb_wastage;
+	while (sz > c->leb_size) {
+		sz += per_leb_wastage;
+		sz -= c->leb_size;
+		tot_wastage += per_leb_wastage;
+	}
+	tot_wastage += ALIGN(sz, c->min_io_size) - sz;
+	c->lpt_sz += tot_wastage;
+}
+
+/**
+ * calc_dflt_lpt_geom - calculate default LPT geometry.
+ * @c: the UBIFS file-system description object
+ * @main_lebs: number of main area LEBs is passed and returned here
+ * @big_lpt: whether the LPT area is "big" is returned here
+ *
+ * The size of the LPT area depends on parameters that themselves are dependent
+ * on the size of the LPT area. This function, successively recalculates the LPT
+ * area geometry until the parameters and resultant geometry are consistent.
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt)
+{
+	int i, lebs_needed;
+	long long sz;
+
+	/* Start by assuming the minimum number of LPT LEBs */
+	c->lpt_lebs = UBIFS_MIN_LPT_LEBS;
+	c->main_lebs = *main_lebs - c->lpt_lebs;
+	if (c->main_lebs <= 0)
+		return -EINVAL;
+
+	/* And assume we will use the small LPT model */
+	c->big_lpt = 0;
+
+	/*
+	 * Calculate the geometry based on assumptions above and then see if it
+	 * makes sense
+	 */
+	do_calc_lpt_geom(c);
+
+	/* Small LPT model must have lpt_sz < leb_size */
+	if (c->lpt_sz > c->leb_size) {
+		/* Nope, so try again using big LPT model */
+		c->big_lpt = 1;
+		do_calc_lpt_geom(c);
+	}
+
+	/* Now check there are enough LPT LEBs */
+	for (i = 0; i < 64 ; i++) {
+		sz = c->lpt_sz * 4; /* Allow 4 times the size */
+		sz += c->leb_size - 1;
+		do_div(sz, c->leb_size);
+		lebs_needed = sz;
+		if (lebs_needed > c->lpt_lebs) {
+			/* Not enough LPT LEBs so try again with more */
+			c->lpt_lebs = lebs_needed;
+			c->main_lebs = *main_lebs - c->lpt_lebs;
+			if (c->main_lebs <= 0)
+				return -EINVAL;
+			do_calc_lpt_geom(c);
+			continue;
+		}
+		if (c->ltab_sz > c->leb_size) {
+			err_msg("LPT ltab too big");
+			return -EINVAL;
+		}
+		*main_lebs = c->main_lebs;
+		*big_lpt = c->big_lpt;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+/**
+ * pack_bits - pack bit fields end-to-end.
+ * @addr: address at which to pack (passed and next address returned)
+ * @pos: bit position at which to pack (passed and next position returned)
+ * @val: value to pack
+ * @nrbits: number of bits of value to pack (1-32)
+ */
+static void pack_bits(uint8_t **addr, int *pos, uint32_t val, int nrbits)
+{
+	uint8_t *p = *addr;
+	int b = *pos;
+
+	if (b) {
+		*p |= ((uint8_t)val) << b;
+		nrbits += b;
+		if (nrbits > 8) {
+			*++p = (uint8_t)(val >>= (8 - b));
+			if (nrbits > 16) {
+				*++p = (uint8_t)(val >>= 8);
+				if (nrbits > 24) {
+					*++p = (uint8_t)(val >>= 8);
+					if (nrbits > 32)
+						*++p = (uint8_t)(val >>= 8);
+				}
+			}
+		}
+	} else {
+		*p = (uint8_t)val;
+		if (nrbits > 8) {
+			*++p = (uint8_t)(val >>= 8);
+			if (nrbits > 16) {
+				*++p = (uint8_t)(val >>= 8);
+				if (nrbits > 24)
+					*++p = (uint8_t)(val >>= 8);
+			}
+		}
+	}
+	b = nrbits & 7;
+	if (b == 0)
+		p++;
+	*addr = p;
+	*pos = b;
+}
+
+/**
+ * pack_pnode - pack all the bit fields of a pnode.
+ * @c: UBIFS file-system description object
+ * @buf: buffer into which to pack
+ * @pnode: pnode to pack
+ */
+static void pack_pnode(struct ubifs_info *c, void *buf,
+		       struct ubifs_pnode *pnode)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0;
+	uint16_t crc;
+
+	pack_bits(&addr, &pos, UBIFS_LPT_PNODE, UBIFS_LPT_TYPE_BITS);
+	if (c->big_lpt)
+		pack_bits(&addr, &pos, pnode->num, c->pcnt_bits);
+	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+		pack_bits(&addr, &pos, pnode->lprops[i].free >> 3,
+			  c->space_bits);
+		pack_bits(&addr, &pos, pnode->lprops[i].dirty >> 3,
+			  c->space_bits);
+		if (pnode->lprops[i].flags & LPROPS_INDEX)
+			pack_bits(&addr, &pos, 1, 1);
+		else
+			pack_bits(&addr, &pos, 0, 1);
+	}
+	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
+		    c->pnode_sz - UBIFS_LPT_CRC_BYTES);
+	addr = buf;
+	pos = 0;
+	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
+}
+
+/**
+ * pack_nnode - pack all the bit fields of a nnode.
+ * @c: UBIFS file-system description object
+ * @buf: buffer into which to pack
+ * @nnode: nnode to pack
+ */
+static void pack_nnode(struct ubifs_info *c, void *buf,
+		       struct ubifs_nnode *nnode)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0;
+	uint16_t crc;
+
+	pack_bits(&addr, &pos, UBIFS_LPT_NNODE, UBIFS_LPT_TYPE_BITS);
+	if (c->big_lpt)
+		pack_bits(&addr, &pos, nnode->num, c->pcnt_bits);
+	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+		int lnum = nnode->nbranch[i].lnum;
+
+		if (lnum == 0)
+			lnum = c->lpt_last + 1;
+		pack_bits(&addr, &pos, lnum - c->lpt_first, c->lpt_lnum_bits);
+		pack_bits(&addr, &pos, nnode->nbranch[i].offs,
+			  c->lpt_offs_bits);
+	}
+	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
+		    c->nnode_sz - UBIFS_LPT_CRC_BYTES);
+	addr = buf;
+	pos = 0;
+	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
+}
+
+/**
+ * pack_ltab - pack the LPT's own lprops table.
+ * @c: UBIFS file-system description object
+ * @buf: buffer into which to pack
+ * @ltab: LPT's own lprops table to pack
+ */
+static void pack_ltab(struct ubifs_info *c, void *buf,
+			 struct ubifs_lpt_lprops *ltab)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0;
+	uint16_t crc;
+
+	pack_bits(&addr, &pos, UBIFS_LPT_LTAB, UBIFS_LPT_TYPE_BITS);
+	for (i = 0; i < c->lpt_lebs; i++) {
+		pack_bits(&addr, &pos, ltab[i].free, c->lpt_spc_bits);
+		pack_bits(&addr, &pos, ltab[i].dirty, c->lpt_spc_bits);
+	}
+	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
+		    c->ltab_sz - UBIFS_LPT_CRC_BYTES);
+	addr = buf;
+	pos = 0;
+	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
+}
+
+/**
+ * pack_lsave - pack the LPT's save table.
+ * @c: UBIFS file-system description object
+ * @buf: buffer into which to pack
+ * @lsave: LPT's save table to pack
+ */
+static void pack_lsave(struct ubifs_info *c, void *buf, int *lsave)
+{
+	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
+	int i, pos = 0;
+	uint16_t crc;
+
+	pack_bits(&addr, &pos, UBIFS_LPT_LSAVE, UBIFS_LPT_TYPE_BITS);
+	for (i = 0; i < c->lsave_cnt; i++)
+		pack_bits(&addr, &pos, lsave[i], c->lnum_bits);
+	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
+		    c->lsave_sz - UBIFS_LPT_CRC_BYTES);
+	addr = buf;
+	pos = 0;
+	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
+}
+
+/**
+ * set_ltab - set LPT LEB properties.
+ * @c: UBIFS file-system description object
+ * @lnum: LEB number
+ * @free: amount of free space
+ * @dirty: amount of dirty space
+ */
+static void set_ltab(struct ubifs_info *c, int lnum, int free, int dirty)
+{
+	dbg_msg(3, "LEB %d free %d dirty %d to %d %d",
+		lnum, c->ltab[lnum - c->lpt_first].free,
+		c->ltab[lnum - c->lpt_first].dirty, free, dirty);
+	c->ltab[lnum - c->lpt_first].free = free;
+	c->ltab[lnum - c->lpt_first].dirty = dirty;
+}
+
+/**
+ * calc_nnode_num - calculate nnode number.
+ * @row: the row in the tree (root is zero)
+ * @col: the column in the row (leftmost is zero)
+ *
+ * The nnode number is a number that uniquely identifies a nnode and can be used
+ * easily to traverse the tree from the root to that nnode.
+ *
+ * This function calculates and returns the nnode number for the nnode at @row
+ * and @col.
+ */
+static int calc_nnode_num(int row, int col)
+{
+	int num, bits;
+
+	num = 1;
+	while (row--) {
+		bits = (col & (UBIFS_LPT_FANOUT - 1));
+		col >>= UBIFS_LPT_FANOUT_SHIFT;
+		num <<= UBIFS_LPT_FANOUT_SHIFT;
+		num |= bits;
+	}
+	return num;
+}
+
+/**
+ * create_lpt - create LPT.
+ * @c: UBIFS file-system description object
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int create_lpt(struct ubifs_info *c)
+{
+	int lnum, err = 0, i, j, cnt, len, alen, row;
+	int blnum, boffs, bsz, bcnt;
+	struct ubifs_pnode *pnode = NULL;
+	struct ubifs_nnode *nnode = NULL;
+	void *buf = NULL, *p;
+	int *lsave = NULL;
+
+	pnode = malloc(sizeof(struct ubifs_pnode));
+	nnode = malloc(sizeof(struct ubifs_nnode));
+	buf = malloc(c->leb_size);
+	lsave = malloc(sizeof(int) * c->lsave_cnt);
+	if (!pnode || !nnode || !buf || !lsave) {
+		err = -ENOMEM;
+		goto out;
+	}
+	memset(pnode, 0 , sizeof(struct ubifs_pnode));
+	memset(nnode, 0 , sizeof(struct ubifs_nnode));
+
+	c->lscan_lnum = c->main_first;
+
+	lnum = c->lpt_first;
+	p = buf;
+	len = 0;
+	/* Number of leaf nodes (pnodes) */
+	cnt = (c->main_lebs + UBIFS_LPT_FANOUT - 1) >> UBIFS_LPT_FANOUT_SHIFT;
+	//printf("pnode_cnt=%d\n",cnt);
+
+	/*
+	 * To calculate the internal node branches, we keep information about
+	 * the level below.
+	 */
+	blnum = lnum; /* LEB number of level below */
+	boffs = 0; /* Offset of level below */
+	bcnt = cnt; /* Number of nodes in level below */
+	bsz = c->pnode_sz; /* Size of nodes in level below */
+
+	/* Add pnodes */
+	for (i = 0; i < cnt; i++) {
+		if (len + c->pnode_sz > c->leb_size) {
+			alen = ALIGN(len, c->min_io_size);
+			set_ltab(c, lnum, c->leb_size - alen, alen - len);
+			memset(p, 0xff, alen - len);
+			err = write_leb(c, lnum++, alen, buf);
+			if (err)
+				goto out;
+			p = buf;
+			len = 0;
+		}
+		/* Fill in the pnode */
+		for (j = 0; j < UBIFS_LPT_FANOUT; j++) {
+			int k = (i << UBIFS_LPT_FANOUT_SHIFT) + j;
+
+			if (k < c->main_lebs)
+				pnode->lprops[j] = c->lpt[k];
+			else {
+				pnode->lprops[j].free = c->leb_size;
+				pnode->lprops[j].dirty = 0;
+				pnode->lprops[j].flags = 0;
+			}
+		}
+		pack_pnode(c, p, pnode);
+		p += c->pnode_sz;
+		len += c->pnode_sz;
+		/*
+		 * pnodes are simply numbered left to right starting at zero,
+		 * which means the pnode number can be used easily to traverse
+		 * down the tree to the corresponding pnode.
+		 */
+		pnode->num += 1;
+	}
+
+	row = c->lpt_hght - 1;
+	/* Add all nnodes, one level at a time */
+	while (1) {
+		/* Number of internal nodes (nnodes) at next level */
+		cnt = (cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
+		if (cnt == 0)
+			cnt = 1;
+		for (i = 0; i < cnt; i++) {
+			if (len + c->nnode_sz > c->leb_size) {
+				alen = ALIGN(len, c->min_io_size);
+				set_ltab(c, lnum, c->leb_size - alen,
+					    alen - len);
+				memset(p, 0xff, alen - len);
+				err = write_leb(c, lnum++, alen, buf);
+				if (err)
+					goto out;
+				p = buf;
+				len = 0;
+			}
+			/* The root is on row zero */
+			if (row == 0) {
+				c->lpt_lnum = lnum;
+				c->lpt_offs = len;
+			}
+			/* Set branches to the level below */
+			for (j = 0; j < UBIFS_LPT_FANOUT; j++) {
+				if (bcnt) {
+					if (boffs + bsz > c->leb_size) {
+						blnum += 1;
+						boffs = 0;
+					}
+					nnode->nbranch[j].lnum = blnum;
+					nnode->nbranch[j].offs = boffs;
+					boffs += bsz;
+					bcnt--;
+				} else {
+					nnode->nbranch[j].lnum = 0;
+					nnode->nbranch[j].offs = 0;
+				}
+			}
+			nnode->num = calc_nnode_num(row, i);
+			pack_nnode(c, p, nnode);
+			p += c->nnode_sz;
+			len += c->nnode_sz;
+		}
+		/* Row zero  is the top row */
+		if (row == 0)
+			break;
+		/* Update the information about the level below */
+		bcnt = cnt;
+		bsz = c->nnode_sz;
+		row -= 1;
+	}
+
+	if (c->big_lpt) {
+		/* Need to add LPT's save table */
+		if (len + c->lsave_sz > c->leb_size) {
+			alen = ALIGN(len, c->min_io_size);
+			set_ltab(c, lnum, c->leb_size - alen, alen - len);
+			memset(p, 0xff, alen - len);
+			err = write_leb(c, lnum++, alen, buf);
+			if (err)
+				goto out;
+			p = buf;
+			len = 0;
+		}
+
+		c->lsave_lnum = lnum;
+		c->lsave_offs = len;
+
+		for (i = 0; i < c->lsave_cnt; i++)
+			lsave[i] = c->main_first + i;
+
+		pack_lsave(c, p, lsave);
+		p += c->lsave_sz;
+		len += c->lsave_sz;
+	}
+
+	/* Need to add LPT's own LEB properties table */
+	if (len + c->ltab_sz > c->leb_size) {
+		alen = ALIGN(len, c->min_io_size);
+		set_ltab(c, lnum, c->leb_size - alen, alen - len);
+		memset(p, 0xff, alen - len);
+		err = write_leb(c, lnum++, alen, buf);
+		if (err)
+			goto out;
+		p = buf;
+		len = 0;
+	}
+
+	c->ltab_lnum = lnum;
+	c->ltab_offs = len;
+
+	/* Update ltab before packing it */
+	len += c->ltab_sz;
+	alen = ALIGN(len, c->min_io_size);
+	set_ltab(c, lnum, c->leb_size - alen, alen - len);
+
+	pack_ltab(c, p, c->ltab);
+	p += c->ltab_sz;
+
+	/* Write remaining buffer */
+	memset(p, 0xff, alen - len);
+	err = write_leb(c, lnum, alen, buf);
+	if (err)
+		goto out;
+
+	c->nhead_lnum = lnum;
+	c->nhead_offs = ALIGN(len, c->min_io_size);
+
+	dbg_msg(1, "lpt_sz:         %lld", c->lpt_sz);
+	dbg_msg(1, "space_bits:     %d", c->space_bits);
+	dbg_msg(1, "lpt_lnum_bits:  %d", c->lpt_lnum_bits);
+	dbg_msg(1, "lpt_offs_bits:  %d", c->lpt_offs_bits);
+	dbg_msg(1, "lpt_spc_bits:   %d", c->lpt_spc_bits);
+	dbg_msg(1, "pcnt_bits:      %d", c->pcnt_bits);
+	dbg_msg(1, "lnum_bits:      %d", c->lnum_bits);
+	dbg_msg(1, "pnode_sz:       %d", c->pnode_sz);
+	dbg_msg(1, "nnode_sz:       %d", c->nnode_sz);
+	dbg_msg(1, "ltab_sz:        %d", c->ltab_sz);
+	dbg_msg(1, "lsave_sz:       %d", c->lsave_sz);
+	dbg_msg(1, "lsave_cnt:      %d", c->lsave_cnt);
+	dbg_msg(1, "lpt_hght:       %d", c->lpt_hght);
+	dbg_msg(1, "big_lpt:        %d", c->big_lpt);
+	dbg_msg(1, "LPT root is at  %d:%d", c->lpt_lnum, c->lpt_offs);
+	dbg_msg(1, "LPT head is at  %d:%d", c->nhead_lnum, c->nhead_offs);
+	dbg_msg(1, "LPT ltab is at  %d:%d", c->ltab_lnum, c->ltab_offs);
+	if (c->big_lpt)
+		dbg_msg(1, "LPT lsave is at %d:%d",
+		        c->lsave_lnum, c->lsave_offs);
+out:
+	free(lsave);
+	free(buf);
+	free(nnode);
+	free(pnode);
+	return err;
+}
diff --git a/ubifs-utils/mkfs.ubifs/COPYING b/ubifs-utils/mkfs.ubifs/COPYING
deleted file mode 100644
index 60549be..0000000
--- a/ubifs-utils/mkfs.ubifs/COPYING
+++ /dev/null
@@ -1,340 +0,0 @@
-		    GNU GENERAL PUBLIC LICENSE
-		       Version 2, June 1991
-
- Copyright (C) 1989, 1991 Free Software Foundation, Inc.
-                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-			    Preamble
-
-  The licenses for most software are designed to take away your
-freedom to share and change it.  By contrast, the GNU General Public
-License is intended to guarantee your freedom to share and change free
-software--to make sure the software is free for all its users.  This
-General Public License applies to most of the Free Software
-Foundation's software and to any other program whose authors commit to
-using it.  (Some other Free Software Foundation software is covered by
-the GNU Library General Public License instead.)  You can apply it to
-your programs, too.
-
-  When we speak of free software, we are referring to freedom, not
-price.  Our General Public Licenses are designed to make sure that you
-have the freedom to distribute copies of free software (and charge for
-this service if you wish), that you receive source code or can get it
-if you want it, that you can change the software or use pieces of it
-in new free programs; and that you know you can do these things.
-
-  To protect your rights, we need to make restrictions that forbid
-anyone to deny you these rights or to ask you to surrender the rights.
-These restrictions translate to certain responsibilities for you if you
-distribute copies of the software, or if you modify it.
-
-  For example, if you distribute copies of such a program, whether
-gratis or for a fee, you must give the recipients all the rights that
-you have.  You must make sure that they, too, receive or can get the
-source code.  And you must show them these terms so they know their
-rights.
-
-  We protect your rights with two steps: (1) copyright the software, and
-(2) offer you this license which gives you legal permission to copy,
-distribute and/or modify the software.
-
-  Also, for each author's protection and ours, we want to make certain
-that everyone understands that there is no warranty for this free
-software.  If the software is modified by someone else and passed on, we
-want its recipients to know that what they have is not the original, so
-that any problems introduced by others will not reflect on the original
-authors' reputations.
-
-  Finally, any free program is threatened constantly by software
-patents.  We wish to avoid the danger that redistributors of a free
-program will individually obtain patent licenses, in effect making the
-program proprietary.  To prevent this, we have made it clear that any
-patent must be licensed for everyone's free use or not licensed at all.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.
-

-		    GNU GENERAL PUBLIC LICENSE
-   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  0. This License applies to any program or other work which contains
-a notice placed by the copyright holder saying it may be distributed
-under the terms of this General Public License.  The "Program", below,
-refers to any such program or work, and a "work based on the Program"
-means either the Program or any derivative work under copyright law:
-that is to say, a work containing the Program or a portion of it,
-either verbatim or with modifications and/or translated into another
-language.  (Hereinafter, translation is included without limitation in
-the term "modification".)  Each licensee is addressed as "you".
-
-Activities other than copying, distribution and modification are not
-covered by this License; they are outside its scope.  The act of
-running the Program is not restricted, and the output from the Program
-is covered only if its contents constitute a work based on the
-Program (independent of having been made by running the Program).
-Whether that is true depends on what the Program does.
-
-  1. You may copy and distribute verbatim copies of the Program's
-source code as you receive it, in any medium, provided that you
-conspicuously and appropriately publish on each copy an appropriate
-copyright notice and disclaimer of warranty; keep intact all the
-notices that refer to this License and to the absence of any warranty;
-and give any other recipients of the Program a copy of this License
-along with the Program.
-
-You may charge a fee for the physical act of transferring a copy, and
-you may at your option offer warranty protection in exchange for a fee.
-
-  2. You may modify your copy or copies of the Program or any portion
-of it, thus forming a work based on the Program, and copy and
-distribute such modifications or work under the terms of Section 1
-above, provided that you also meet all of these conditions:
-
-    a) You must cause the modified files to carry prominent notices
-    stating that you changed the files and the date of any change.
-
-    b) You must cause any work that you distribute or publish, that in
-    whole or in part contains or is derived from the Program or any
-    part thereof, to be licensed as a whole at no charge to all third
-    parties under the terms of this License.
-
-    c) If the modified program normally reads commands interactively
-    when run, you must cause it, when started running for such
-    interactive use in the most ordinary way, to print or display an
-    announcement including an appropriate copyright notice and a
-    notice that there is no warranty (or else, saying that you provide
-    a warranty) and that users may redistribute the program under
-    these conditions, and telling the user how to view a copy of this
-    License.  (Exception: if the Program itself is interactive but
-    does not normally print such an announcement, your work based on
-    the Program is not required to print an announcement.)
-

-These requirements apply to the modified work as a whole.  If
-identifiable sections of that work are not derived from the Program,
-and can be reasonably considered independent and separate works in
-themselves, then this License, and its terms, do not apply to those
-sections when you distribute them as separate works.  But when you
-distribute the same sections as part of a whole which is a work based
-on the Program, the distribution of the whole must be on the terms of
-this License, whose permissions for other licensees extend to the
-entire whole, and thus to each and every part regardless of who wrote it.
-
-Thus, it is not the intent of this section to claim rights or contest
-your rights to work written entirely by you; rather, the intent is to
-exercise the right to control the distribution of derivative or
-collective works based on the Program.
-
-In addition, mere aggregation of another work not based on the Program
-with the Program (or with a work based on the Program) on a volume of
-a storage or distribution medium does not bring the other work under
-the scope of this License.
-
-  3. You may copy and distribute the Program (or a work based on it,
-under Section 2) in object code or executable form under the terms of
-Sections 1 and 2 above provided that you also do one of the following:
-
-    a) Accompany it with the complete corresponding machine-readable
-    source code, which must be distributed under the terms of Sections
-    1 and 2 above on a medium customarily used for software interchange; or,
-
-    b) Accompany it with a written offer, valid for at least three
-    years, to give any third party, for a charge no more than your
-    cost of physically performing source distribution, a complete
-    machine-readable copy of the corresponding source code, to be
-    distributed under the terms of Sections 1 and 2 above on a medium
-    customarily used for software interchange; or,
-
-    c) Accompany it with the information you received as to the offer
-    to distribute corresponding source code.  (This alternative is
-    allowed only for noncommercial distribution and only if you
-    received the program in object code or executable form with such
-    an offer, in accord with Subsection b above.)
-
-The source code for a work means the preferred form of the work for
-making modifications to it.  For an executable work, complete source
-code means all the source code for all modules it contains, plus any
-associated interface definition files, plus the scripts used to
-control compilation and installation of the executable.  However, as a
-special exception, the source code distributed need not include
-anything that is normally distributed (in either source or binary
-form) with the major components (compiler, kernel, and so on) of the
-operating system on which the executable runs, unless that component
-itself accompanies the executable.
-
-If distribution of executable or object code is made by offering
-access to copy from a designated place, then offering equivalent
-access to copy the source code from the same place counts as
-distribution of the source code, even though third parties are not
-compelled to copy the source along with the object code.
-

-  4. You may not copy, modify, sublicense, or distribute the Program
-except as expressly provided under this License.  Any attempt
-otherwise to copy, modify, sublicense or distribute the Program is
-void, and will automatically terminate your rights under this License.
-However, parties who have received copies, or rights, from you under
-this License will not have their licenses terminated so long as such
-parties remain in full compliance.
-
-  5. You are not required to accept this License, since you have not
-signed it.  However, nothing else grants you permission to modify or
-distribute the Program or its derivative works.  These actions are
-prohibited by law if you do not accept this License.  Therefore, by
-modifying or distributing the Program (or any work based on the
-Program), you indicate your acceptance of this License to do so, and
-all its terms and conditions for copying, distributing or modifying
-the Program or works based on it.
-
-  6. Each time you redistribute the Program (or any work based on the
-Program), the recipient automatically receives a license from the
-original licensor to copy, distribute or modify the Program subject to
-these terms and conditions.  You may not impose any further
-restrictions on the recipients' exercise of the rights granted herein.
-You are not responsible for enforcing compliance by third parties to
-this License.
-
-  7. If, as a consequence of a court judgment or allegation of patent
-infringement or for any other reason (not limited to patent issues),
-conditions are imposed on you (whether by court order, agreement or
-otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot
-distribute so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you
-may not distribute the Program at all.  For example, if a patent
-license would not permit royalty-free redistribution of the Program by
-all those who receive copies directly or indirectly through you, then
-the only way you could satisfy both it and this License would be to
-refrain entirely from distribution of the Program.
-
-If any portion of this section is held invalid or unenforceable under
-any particular circumstance, the balance of the section is intended to
-apply and the section as a whole is intended to apply in other
-circumstances.
-
-It is not the purpose of this section to induce you to infringe any
-patents or other property right claims or to contest validity of any
-such claims; this section has the sole purpose of protecting the
-integrity of the free software distribution system, which is
-implemented by public license practices.  Many people have made
-generous contributions to the wide range of software distributed
-through that system in reliance on consistent application of that
-system; it is up to the author/donor to decide if he or she is willing
-to distribute software through any other system and a licensee cannot
-impose that choice.
-
-This section is intended to make thoroughly clear what is believed to
-be a consequence of the rest of this License.
-

-  8. If the distribution and/or use of the Program is restricted in
-certain countries either by patents or by copyrighted interfaces, the
-original copyright holder who places the Program under this License
-may add an explicit geographical distribution limitation excluding
-those countries, so that distribution is permitted only in or among
-countries not thus excluded.  In such case, this License incorporates
-the limitation as if written in the body of this License.
-
-  9. The Free Software Foundation may publish revised and/or new versions
-of the General Public License from time to time.  Such new versions will
-be similar in spirit to the present version, but may differ in detail to
-address new problems or concerns.
-
-Each version is given a distinguishing version number.  If the Program
-specifies a version number of this License which applies to it and "any
-later version", you have the option of following the terms and conditions
-either of that version or of any later version published by the Free
-Software Foundation.  If the Program does not specify a version number of
-this License, you may choose any version ever published by the Free Software
-Foundation.
-
-  10. If you wish to incorporate parts of the Program into other free
-programs whose distribution conditions are different, write to the author
-to ask for permission.  For software which is copyrighted by the Free
-Software Foundation, write to the Free Software Foundation; we sometimes
-make exceptions for this.  Our decision will be guided by the two goals
-of preserving the free status of all derivatives of our free software and
-of promoting the sharing and reuse of software generally.
-
-			    NO WARRANTY
-
-  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-REPAIR OR CORRECTION.
-
-  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGES.
-
-		     END OF TERMS AND CONDITIONS
-

-	    How to Apply These Terms to Your New Programs
-
-  If you develop a new program, and you want it to be of the greatest
-possible use to the public, the best way to achieve this is to make it
-free software which everyone can redistribute and change under these terms.
-
-  To do so, attach the following notices to the program.  It is safest
-to attach them to the start of each source file to most effectively
-convey the exclusion of warranty; and each file should have at least
-the "copyright" line and a pointer to where the full notice is found.
-
-    <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) 19yy  <name of author>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-
-
-Also add information on how to contact you by electronic and paper mail.
-
-If the program is interactive, make it output a short notice like this
-when it starts in an interactive mode:
-
-    Gnomovision version 69, Copyright (C) 19yy name of author
-    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-    This is free software, and you are welcome to redistribute it
-    under certain conditions; type `show c' for details.
-
-The hypothetical commands `show w' and `show c' should show the appropriate
-parts of the General Public License.  Of course, the commands you use may
-be called something other than `show w' and `show c'; they could even be
-mouse-clicks or menu items--whatever suits your program.
-
-You should also get your employer (if you work as a programmer) or your
-school, if any, to sign a "copyright disclaimer" for the program, if
-necessary.  Here is a sample; alter the names:
-
-  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
-
-This General Public License does not permit incorporating your program into
-proprietary programs.  If your program is a subroutine library, you may
-consider it more useful to permit linking proprietary applications with the
-library.  If this is what you want to do, use the GNU Library General
-Public License instead of this License.
diff --git a/ubifs-utils/mkfs.ubifs/README b/ubifs-utils/mkfs.ubifs/README
deleted file mode 100644
index 7e19939..0000000
--- a/ubifs-utils/mkfs.ubifs/README
+++ /dev/null
@@ -1,9 +0,0 @@
-UBIFS File System - Make File System program
-
-* crc16.h and crc16.c were copied from the linux kernel.
-* crc32.h and crc32.c were copied from mtd-utils and amended.
-* ubifs.h is a selection of definitions from fs/ubifs/ubifs.h from the linux kernel.
-* key.h is copied from fs/ubifs/key.h from the linux kernel.
-* defs.h is a bunch of definitions to smooth things over.
-* lpt.c is a selection of functions copied from fs/ubifs/lpt.c from the linux kernel, and amended.
-* hashtable/* was downloaded from http://www.cl.cam.ac.uk/~cwc22/hashtable/
diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
deleted file mode 100644
index 54604d4..0000000
--- a/ubifs-utils/mkfs.ubifs/compr.c
+++ /dev/null
@@ -1,228 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation.
- * Copyright (C) 2008 University of Szeged, Hungary
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Artem Bityutskiy
- *          Adrian Hunter
- *          Zoltan Sogor
- */
-
-#include "ubifs_common.h"
-#ifndef WITHOUT_LZO
-#include <lzo/lzo1x.h>
-#endif
-
-#define crc32 __zlib_crc32
-#include <zlib.h>
-#undef crc32
-
-#include "compr.h"
-
-static void *lzo_mem;
-static unsigned long long errcnt = 0;
-
-#define DEFLATE_DEF_LEVEL     Z_DEFAULT_COMPRESSION
-#define DEFLATE_DEF_WINBITS   11
-#define DEFLATE_DEF_MEMLEVEL  8
-
-static int zlib_deflate(void *in_buf, size_t in_len, void *out_buf,
-			size_t *out_len)
-{
-	z_stream strm;
-
-	strm.zalloc = NULL;
-	strm.zfree = NULL;
-
-	/*
-	 * Match exactly the zlib parameters used by the Linux kernel crypto
-	 * API.
-	 */
-        if (deflateInit2(&strm, DEFLATE_DEF_LEVEL, Z_DEFLATED,
-			 -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
-			 Z_DEFAULT_STRATEGY)) {
-		errcnt += 1;
-		return -1;
-	}
-
-	strm.next_in = in_buf;
-	strm.avail_in = in_len;
-	strm.total_in = 0;
-
-	strm.next_out = out_buf;
-	strm.avail_out = *out_len;
-	strm.total_out = 0;
-
-	if (deflate(&strm, Z_FINISH) != Z_STREAM_END) {
-		deflateEnd(&strm);
-		errcnt += 1;
-		return -1;
-	}
-
-	if (deflateEnd(&strm) != Z_OK) {
-		errcnt += 1;
-		return -1;
-	}
-
-	*out_len = strm.total_out;
-
-	return 0;
-}
-
-#ifndef WITHOUT_LZO
-static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
-			size_t *out_len)
-{
-	lzo_uint len;
-	int ret;
-
-	len = *out_len;
-	ret = lzo1x_999_compress(in_buf, in_len, out_buf, &len, lzo_mem);
-	*out_len = len;
-
-	if (ret != LZO_E_OK) {
-		errcnt += 1;
-		return -1;
-	}
-
-	return 0;
-}
-#endif
-
-static int no_compress(void *in_buf, size_t in_len, void *out_buf,
-		       size_t *out_len)
-{
-	memcpy(out_buf, in_buf, in_len);
-	*out_len = in_len;
-	return 0;
-}
-
-static char *zlib_buf;
-
-#ifndef WITHOUT_LZO
-static int favor_lzo_compress(void *in_buf, size_t in_len, void *out_buf,
-				size_t *out_len, int *type, int lzo_percent)
-{
-	int lzo_ret, zlib_ret;
-	size_t lzo_len, zlib_len;
-
-	lzo_len = zlib_len = *out_len;
-	lzo_ret = lzo_compress(in_buf, in_len, out_buf, &lzo_len);
-	zlib_ret = zlib_deflate(in_buf, in_len, zlib_buf, &zlib_len);
-
-	if (lzo_ret && zlib_ret)
-		/* Both compressors failed */
-		return -1;
-
-	if (!lzo_ret && !zlib_ret) {
-		double percent;
-
-		/* Both compressors succeeded */
-		if (lzo_len <= zlib_len )
-			goto select_lzo;
-
-		percent = (double)zlib_len / (double)lzo_len;
-		percent *= 100;
-		if (percent > 100 - lzo_percent)
-			goto select_lzo;
-		goto select_zlib;
-	}
-
-	if (lzo_ret)
-		/* Only zlib compressor succeeded */
-		goto select_zlib;
-
-	/* Only LZO compressor succeeded */
-
-select_lzo:
-	*out_len = lzo_len;
-	*type = MKFS_UBIFS_COMPR_LZO;
-	return 0;
-
-select_zlib:
-	*out_len = zlib_len;
-	*type = MKFS_UBIFS_COMPR_ZLIB;
-	memcpy(out_buf, zlib_buf, zlib_len);
-	return 0;
-}
-#endif
-
-int compress_data(void *in_buf, size_t in_len, void *out_buf,
-		size_t *out_len, int type, int lzo_percent)
-{
-	int ret;
-
-	if (in_len < UBIFS_MIN_COMPR_LEN) {
-		no_compress(in_buf, in_len, out_buf, out_len);
-		return MKFS_UBIFS_COMPR_NONE;
-	}
-
-#ifdef WITHOUT_LZO
-	{
-		switch (type) {
-#else
-	if (lzo_percent)
-		ret = favor_lzo_compress(in_buf, in_len, out_buf, out_len, &type, lzo_percent);
-	else {
-		switch (type) {
-		case MKFS_UBIFS_COMPR_LZO:
-			ret = lzo_compress(in_buf, in_len, out_buf, out_len);
-			break;
-#endif
-		case MKFS_UBIFS_COMPR_ZLIB:
-			ret = zlib_deflate(in_buf, in_len, out_buf, out_len);
-			break;
-		case MKFS_UBIFS_COMPR_NONE:
-			ret = 1;
-			break;
-		default:
-			errcnt += 1;
-			ret = 1;
-			break;
-		}
-	}
-	if (ret || *out_len >= in_len) {
-		no_compress(in_buf, in_len, out_buf, out_len);
-		return MKFS_UBIFS_COMPR_NONE;
-	}
-	return type;
-}
-
-int init_compression(void)
-{
-#ifdef WITHOUT_LZO
-	lzo_mem = NULL;
-#else
-	lzo_mem = malloc(LZO1X_999_MEM_COMPRESS);
-	if (!lzo_mem)
-		return -1;
-#endif
-
-	zlib_buf = malloc(UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR);
-	if (!zlib_buf) {
-		free(lzo_mem);
-		return -1;
-	}
-
-	return 0;
-}
-
-void destroy_compression(void)
-{
-	free(zlib_buf);
-	free(lzo_mem);
-	if (errcnt)
-		fprintf(stderr, "%llu compression errors occurred\n", errcnt);
-}
diff --git a/ubifs-utils/mkfs.ubifs/compr.h b/ubifs-utils/mkfs.ubifs/compr.h
deleted file mode 100644
index d44a2ba..0000000
--- a/ubifs-utils/mkfs.ubifs/compr.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation.
- * Copyright (C) 2008 University of Szeged, Hungary
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Artem Bityutskiy
- *          Adrian Hunter
- *          Zoltan Sogor
- */
-
-#ifndef __UBIFS_COMPRESS_H__
-#define __UBIFS_COMPRESS_H__
-
-/*
- * Compressors may end-up with more data in the output buffer than in the input
- * buffer. This constant defined the worst case factor, i.e. we assume that the
- * output buffer may be at max. WORST_COMPR_FACTOR times larger than input
- * buffer.
- */
-#define WORST_COMPR_FACTOR 4
-
-enum compression_type
-{
-	MKFS_UBIFS_COMPR_NONE,
-	MKFS_UBIFS_COMPR_LZO,
-	MKFS_UBIFS_COMPR_ZLIB,
-};
-
-int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len, int type, int lzo_percent);
-int init_compression(void);
-void destroy_compression(void);
-
-#endif
diff --git a/ubifs-utils/mkfs.ubifs/crc16.c b/ubifs-utils/mkfs.ubifs/crc16.c
deleted file mode 100644
index a19512e..0000000
--- a/ubifs-utils/mkfs.ubifs/crc16.c
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * This code was taken from the linux kernel. The license is GPL Version 2.
- */
-
-#include "crc16.h"
-
-/** CRC table for the CRC-16. The poly is 0x8005 (x^16 + x^15 + x^2 + 1) */
-uint16_t const crc16_table[256] = {
-	0x0000, 0xC0C1, 0xC181, 0x0140, 0xC301, 0x03C0, 0x0280, 0xC241,
-	0xC601, 0x06C0, 0x0780, 0xC741, 0x0500, 0xC5C1, 0xC481, 0x0440,
-	0xCC01, 0x0CC0, 0x0D80, 0xCD41, 0x0F00, 0xCFC1, 0xCE81, 0x0E40,
-	0x0A00, 0xCAC1, 0xCB81, 0x0B40, 0xC901, 0x09C0, 0x0880, 0xC841,
-	0xD801, 0x18C0, 0x1980, 0xD941, 0x1B00, 0xDBC1, 0xDA81, 0x1A40,
-	0x1E00, 0xDEC1, 0xDF81, 0x1F40, 0xDD01, 0x1DC0, 0x1C80, 0xDC41,
-	0x1400, 0xD4C1, 0xD581, 0x1540, 0xD701, 0x17C0, 0x1680, 0xD641,
-	0xD201, 0x12C0, 0x1380, 0xD341, 0x1100, 0xD1C1, 0xD081, 0x1040,
-	0xF001, 0x30C0, 0x3180, 0xF141, 0x3300, 0xF3C1, 0xF281, 0x3240,
-	0x3600, 0xF6C1, 0xF781, 0x3740, 0xF501, 0x35C0, 0x3480, 0xF441,
-	0x3C00, 0xFCC1, 0xFD81, 0x3D40, 0xFF01, 0x3FC0, 0x3E80, 0xFE41,
-	0xFA01, 0x3AC0, 0x3B80, 0xFB41, 0x3900, 0xF9C1, 0xF881, 0x3840,
-	0x2800, 0xE8C1, 0xE981, 0x2940, 0xEB01, 0x2BC0, 0x2A80, 0xEA41,
-	0xEE01, 0x2EC0, 0x2F80, 0xEF41, 0x2D00, 0xEDC1, 0xEC81, 0x2C40,
-	0xE401, 0x24C0, 0x2580, 0xE541, 0x2700, 0xE7C1, 0xE681, 0x2640,
-	0x2200, 0xE2C1, 0xE381, 0x2340, 0xE101, 0x21C0, 0x2080, 0xE041,
-	0xA001, 0x60C0, 0x6180, 0xA141, 0x6300, 0xA3C1, 0xA281, 0x6240,
-	0x6600, 0xA6C1, 0xA781, 0x6740, 0xA501, 0x65C0, 0x6480, 0xA441,
-	0x6C00, 0xACC1, 0xAD81, 0x6D40, 0xAF01, 0x6FC0, 0x6E80, 0xAE41,
-	0xAA01, 0x6AC0, 0x6B80, 0xAB41, 0x6900, 0xA9C1, 0xA881, 0x6840,
-	0x7800, 0xB8C1, 0xB981, 0x7940, 0xBB01, 0x7BC0, 0x7A80, 0xBA41,
-	0xBE01, 0x7EC0, 0x7F80, 0xBF41, 0x7D00, 0xBDC1, 0xBC81, 0x7C40,
-	0xB401, 0x74C0, 0x7580, 0xB541, 0x7700, 0xB7C1, 0xB681, 0x7640,
-	0x7200, 0xB2C1, 0xB381, 0x7340, 0xB101, 0x71C0, 0x7080, 0xB041,
-	0x5000, 0x90C1, 0x9181, 0x5140, 0x9301, 0x53C0, 0x5280, 0x9241,
-	0x9601, 0x56C0, 0x5780, 0x9741, 0x5500, 0x95C1, 0x9481, 0x5440,
-	0x9C01, 0x5CC0, 0x5D80, 0x9D41, 0x5F00, 0x9FC1, 0x9E81, 0x5E40,
-	0x5A00, 0x9AC1, 0x9B81, 0x5B40, 0x9901, 0x59C0, 0x5880, 0x9841,
-	0x8801, 0x48C0, 0x4980, 0x8941, 0x4B00, 0x8BC1, 0x8A81, 0x4A40,
-	0x4E00, 0x8EC1, 0x8F81, 0x4F40, 0x8D01, 0x4DC0, 0x4C80, 0x8C41,
-	0x4400, 0x84C1, 0x8581, 0x4540, 0x8701, 0x47C0, 0x4680, 0x8641,
-	0x8201, 0x42C0, 0x4380, 0x8341, 0x4100, 0x81C1, 0x8081, 0x4040
-};
-
-/**
- * crc16 - compute the CRC-16 for the data buffer
- * @crc:	previous CRC value
- * @buffer:	data pointer
- * @len:	number of bytes in the buffer
- *
- * Returns the updated CRC value.
- */
-uint16_t crc16(uint16_t crc, uint8_t const *buffer, size_t len)
-{
-	while (len--)
-		crc = crc16_byte(crc, *buffer++);
-	return crc;
-}
diff --git a/ubifs-utils/mkfs.ubifs/crc16.h b/ubifs-utils/mkfs.ubifs/crc16.h
deleted file mode 100644
index 539d21a..0000000
--- a/ubifs-utils/mkfs.ubifs/crc16.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Implements the standard CRC-16:
- *   Width 16
- *   Poly  0x8005 (x^16 + x^15 + x^2 + 1)
- *   Init  0
- *
- * Copyright (c) 2005 Ben Gardner <bgardner@wabtec.com>
- *
- * This code was taken from the linux kernel. The license is GPL Version 2.
- */
-
-#ifndef __CRC16_H__
-#define __CRC16_H__
-
-#include <stdlib.h>
-#include <stdint.h>
-
-extern uint16_t const crc16_table[256];
-
-extern uint16_t crc16(uint16_t crc, const uint8_t *buffer, size_t len);
-
-static inline uint16_t crc16_byte(uint16_t crc, const uint8_t data)
-{
-	return (crc >> 8) ^ crc16_table[(crc ^ data) & 0xff];
-}
-
-#endif /* __CRC16_H__ */
diff --git a/ubifs-utils/mkfs.ubifs/defs.h b/ubifs-utils/mkfs.ubifs/defs.h
deleted file mode 100644
index 1fa3316..0000000
--- a/ubifs-utils/mkfs.ubifs/defs.h
+++ /dev/null
@@ -1,92 +0,0 @@
-/*
- * Greate deal of the code was taken from the kernel UBIFS implementation, and
- * this file contains some "glue" definitions.
- */
-
-#ifndef __UBIFS_DEFS_H__
-#define __UBIFS_DEFS_H__
-
-#define t16(x) ({ \
-	uint16_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_16(__b); \
-})
-
-#define t32(x) ({ \
-	uint32_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_32(__b); \
-})
-
-#define t64(x) ({ \
-	uint64_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_64(__b); \
-})
-
-#define cpu_to_le16(x) ((__le16){t16(x)})
-#define cpu_to_le32(x) ((__le32){t32(x)})
-#define cpu_to_le64(x) ((__le64){t64(x)})
-
-#define le16_to_cpu(x) (t16((x)))
-#define le32_to_cpu(x) (t32((x)))
-#define le64_to_cpu(x) (t64((x)))
-
-#define unlikely(x) (x)
-
-#define ubifs_assert(x) ({})
-
-struct qstr
-{
-	char *name;
-	size_t len;
-};
-
-/**
- * fls - find last (most-significant) bit set
- * @x: the word to search
- *
- * This is defined the same way as ffs.
- * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
- */
-static inline int fls(int x)
-{
-	int r = 32;
-
-	if (!x)
-		return 0;
-	if (!(x & 0xffff0000u)) {
-		x <<= 16;
-		r -= 16;
-	}
-	if (!(x & 0xff000000u)) {
-		x <<= 8;
-		r -= 8;
-	}
-	if (!(x & 0xf0000000u)) {
-		x <<= 4;
-		r -= 4;
-	}
-	if (!(x & 0xc0000000u)) {
-		x <<= 2;
-		r -= 2;
-	}
-	if (!(x & 0x80000000u)) {
-		x <<= 1;
-		r -= 1;
-	}
-	return r;
-}
-
-#define do_div(n,base) ({ \
-int __res; \
-__res = ((unsigned long) n) % (unsigned) base; \
-n = ((unsigned long) n) / (unsigned) base; \
-__res; })
-
-#if INT_MAX != 0x7fffffff
-#error : sizeof(int) must be 4 for this program
-#endif
-
-#if (~0ULL) != 0xffffffffffffffffULL
-#error : sizeof(long long) must be 8 for this program
-#endif
-
-#endif
diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
deleted file mode 100644
index 1fc0256..0000000
--- a/ubifs-utils/mkfs.ubifs/devtable.c
+++ /dev/null
@@ -1,525 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Author: Artem Bityutskiy
- *
- * Part of the device table parsing code was taken from the mkfs.jffs2 utility.
- * The original author of that code is Erik Andersen, hence:
- *	Copyright (C) 2001, 2002 Erik Andersen <andersen@codepoet.org>
- */
-
-/*
- * This file implemented device table support. Device table entries take the
- * form of:
- * <path>    <type> <mode> <uid> <gid> <major> <minor> <start>	<inc> <count>
- * /dev/mem  c       640   0     0     1       1       0        0     -
- *
- * Type can be one of:
- * f  A regular file
- * d  Directory
- * c  Character special device file
- * b  Block special device file
- * p  Fifo (named pipe)
- *
- * Don't bother with symlinks (permissions are irrelevant), hard links (special
- * cases of regular files), or sockets (why bother).
- *
- * Regular files must exist in the target root directory. If a char, block,
- * fifo, or directory does not exist, it will be created.
- *
- * Please, refer the device_table.txt file which can be found at MTD utilities
- * for more information about what the device table is.
- */
-
-#include "ubifs_common.h"
-#include "devtable.h"
-#include "hashtable/hashtable.h"
-#include "hashtable/hashtable_itr.h"
-
-/*
- * The hash table which contains paths to files/directories/device nodes
- * referred to in the device table. For example, if the device table refers
- * "/dev/loop0", the @path_htbl will contain "/dev" element.
- */
-static struct hashtable *path_htbl;
-
-/* Hash function used for hash tables */
-static unsigned int r5_hash(void *s)
-{
-	unsigned int a = 0;
-	const signed char *str = s;
-
-	while (*str) {
-		a += *str << 4;
-		a += *str >> 4;
-		a *= 11;
-		str++;
-	}
-
-	return a;
-}
-
-/*
- * Check whether 2 keys of a hash table are equivalent. The keys are path/file
- * names, so we simply use 'strcmp()'.
- */
-static int is_equivalent(void *k1, void *k2)
-{
-	return !strcmp(k1, k2);
-}
-
-/**
- * separate_last - separate out the last path component
- * @buf: the path to split
- * @len: length of the @buf string
- * @path: the beginning of path is returned here
- * @name: the last path component is returned here
- *
- * This helper function separates out the the last component of the full path
- * string. For example, "/dev/loop" would be split on "/dev" and "loop". This
- * function allocates memory for @path and @name and return the result there.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-static int separate_last(const char *buf, int len, char **path, char **name)
-{
-	int path_len = len, name_len;
-	const char *p = buf + len, *n;
-
-	while (*--p != '/')
-		path_len -= 1;
-
-	/* Drop the final '/' unless this is the root directory */
-	name_len = len - path_len;
-	n = buf + path_len;
-	if (path_len > 1)
-		path_len -= 1;
-
-	*path = malloc(path_len + 1);
-	if (!*path)
-		return err_msg("cannot allocate %d bytes of memory",
-			       path_len + 1);
-	memcpy(*path, buf, path_len);
-	(*path)[path_len] = '\0';
-
-	*name = malloc(name_len + 1);
-	if (!*name) {
-		free(*path);
-		return err_msg("cannot allocate %d bytes of memory",
-			       name_len + 1);
-	}
-	memcpy(*name, n, name_len + 1);
-
-	return 0;
-}
-
-static int interpret_table_entry(const char *line)
-{
-	char buf[1024], type, *path = NULL, *name = NULL;
-	int len;
-	struct path_htbl_element *ph_elt = NULL;
-	struct name_htbl_element *nh_elt = NULL;
-	unsigned int mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
-	unsigned int start = 0, increment = 0, count = 0;
-
-	if (sscanf(line, "%1023s %c %o %u %u %u %u %u %u %u",
-		   buf, &type, &mode, &uid, &gid, &major, &minor,
-		   &start, &increment, &count) < 0)
-		return sys_err_msg("sscanf failed");
-
-	dbg_msg(3, "name %s, type %c, mode %o, uid %u, gid %u, major %u, "
-		"minor %u, start %u, inc %u, cnt %u",
-		buf, type, mode, uid, gid, major, minor, start,
-		increment, count);
-
-	len = strnlen(buf, 1024);
-	if (len == 1024)
-		return err_msg("too long path");
-
-	if (!strcmp(buf, "/"))
-		return err_msg("device table entries require absolute paths");
-	if (buf[1] == '\0')
-		return err_msg("root directory cannot be created");
-	if (strstr(buf, "//"))
-		return err_msg("'//' cannot be used in the path");
-	if (buf[len - 1] == '/')
-		return err_msg("do not put '/' at the end");
-
-	if (strstr(buf, "/./") || strstr(buf, "/../") ||
-	    !strcmp(buf + len - 2, "/.") || !strcmp(buf + len - 3, "/.."))
-		return err_msg("'.' and '..' cannot be used in the path");
-
-	switch (type) {
-		case 'd':
-			mode |= S_IFDIR;
-			break;
-		case 'f':
-			mode |= S_IFREG;
-			break;
-		case 'p':
-			mode |= S_IFIFO;
-			break;
-		case 'c':
-			mode |= S_IFCHR;
-			break;
-		case 'b':
-			mode |= S_IFBLK;
-			break;
-		default:
-			return err_msg("unsupported file type '%c'", type);
-	}
-
-	if (separate_last(buf, len, &path, &name))
-		return -1;
-
-	/*
-	 * Check if this path already exist in the path hash table and add it
-	 * if it is not.
-	 */
-	ph_elt = hashtable_search(path_htbl, path);
-	if (!ph_elt) {
-		dbg_msg(3, "inserting '%s' into path hash table", path);
-		ph_elt = malloc(sizeof(struct path_htbl_element));
-		if (!ph_elt) {
-			err_msg("cannot allocate %zd bytes of memory",
-				sizeof(struct path_htbl_element));
-			goto out_free;
-		}
-
-		if (!hashtable_insert(path_htbl, path, ph_elt)) {
-			err_msg("cannot insert into path hash table");
-			goto out_free;
-		}
-
-		ph_elt->path = path;
-		path = NULL;
-		ph_elt->name_htbl = create_hashtable(128, &r5_hash,
-						     &is_equivalent);
-		if (!ph_elt->name_htbl) {
-			err_msg("cannot create name hash table");
-			goto out_free;
-		}
-	}
-
-	if (increment != 0 && count == 0)
-		return err_msg("count cannot be zero if increment is non-zero");
-
-	/*
-	 * Add the file/directory/device node (last component of the path) to
-	 * the name hashtable. The name hashtable resides in the corresponding
-	 * path hashtable element.
-	 */
-
-	if (count == 0) {
-		/* This entry does not require any iterating */
-		nh_elt = malloc(sizeof(struct name_htbl_element));
-		if (!nh_elt) {
-			err_msg("cannot allocate %zd bytes of memory",
-				sizeof(struct name_htbl_element));
-			goto out_free;
-		}
-
-		nh_elt->mode = mode;
-		nh_elt->uid = uid;
-		nh_elt->gid = gid;
-		nh_elt->dev = makedev(major, minor);
-
-		dbg_msg(3, "inserting '%s' into name hash table (major %d, minor %d)",
-			name, major(nh_elt->dev), minor(nh_elt->dev));
-
-		if (hashtable_search(ph_elt->name_htbl, name))
-			return err_msg("'%s' is referred twice", buf);
-
-		nh_elt->name = name;
-		if (!hashtable_insert(ph_elt->name_htbl, name, nh_elt)) {
-			err_msg("cannot insert into name hash table");
-			goto out_free;
-		}
-	} else {
-		int i, num = start + count, len = strlen(name) + 20;
-		char *nm;
-
-		for (i = start; i < num; i++) {
-			nh_elt = malloc(sizeof(struct name_htbl_element));
-			if (!nh_elt) {
-				err_msg("cannot allocate %zd bytes of memory",
-					sizeof(struct name_htbl_element));
-				goto out_free;
-			}
-
-			nh_elt->mode = mode;
-			nh_elt->uid = uid;
-			nh_elt->gid = gid;
-			nh_elt->dev = makedev(major, minor + (i - start) * increment);
-
-			nm = malloc(len);
-			if (!nm) {
-				err_msg("cannot allocate %d bytes of memory", len);
-				goto out_free;
-			}
-
-			sprintf(nm, "%s%d", name, i);
-			nh_elt->name = nm;
-
-			dbg_msg(3, "inserting '%s' into name hash table (major %d, minor %d)",
-			        nm, major(nh_elt->dev), minor(nh_elt->dev));
-
-			if (hashtable_search(ph_elt->name_htbl, nm)) {
-				err_msg("'%s' is referred twice", buf);
-				free (nm);
-				goto out_free;
-			}
-
-			if (!hashtable_insert(ph_elt->name_htbl, nm, nh_elt)) {
-				err_msg("cannot insert into name hash table");
-				free (nm);
-				goto out_free;
-			}
-		}
-		free(name);
-		name = NULL;
-	}
-
-	return 0;
-
-out_free:
-	free(ph_elt);
-	free(nh_elt);
-	free(path);
-	free(name);
-	return -1;
-}
-
-/**
- * parse_devtable - parse the device table.
- * @tbl_file: device table file name
- *
- * This function parses the device table and prepare the hash table which will
- * later be used by mkfs.ubifs to create the specified files/device nodes.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- */
-int parse_devtable(const char *tbl_file)
-{
-	FILE *f;
-	char *line = NULL;
-	struct stat st;
-	size_t len;
-
-	dbg_msg(1, "parsing device table file '%s'", tbl_file);
-
-	path_htbl = create_hashtable(128, &r5_hash, &is_equivalent);
-	if (!path_htbl)
-		return err_msg("cannot create path hash table");
-
-	f = fopen(tbl_file, "r");
-	if (!f)
-		return sys_err_msg("cannot open '%s'", tbl_file);
-
-	if (fstat(fileno(f), &st) < 0) {
-		sys_err_msg("cannot stat '%s'", tbl_file);
-		goto out_close;
-	}
-
-	if (st.st_size < 10) {
-		sys_err_msg("'%s' is too short", tbl_file);
-		goto out_close;
-	}
-
-	/*
-	 * The general plan now is to read in one line at a time, check for
-	 * leading comment delimiters ('#'), then try and parse the line as a
-	 * device table
-	 */
-	while (getline(&line, &len, f) != -1) {
-		/* First trim off any white-space */
-		len = strlen(line);
-
-		/* Trim trailing white-space */
-		while (len > 0 && isspace(line[len - 1]))
-			line[--len] = '\0';
-		/* Trim leading white-space */
-		memmove(line, &line[strspn(line, " \n\r\t\v")], len);
-
-		/* How long are we after trimming? */
-		len = strlen(line);
-
-		/* If this is not a comment line, try to interpret it */
-		if (len && *line != '#') {
-			if (interpret_table_entry(line)) {
-				err_msg("cannot parse '%s'", line);
-				goto out_close;
-			}
-		}
-
-		free(line);
-		line = NULL;
-	}
-
-	dbg_msg(1, "finished parsing");
-	fclose(f);
-	return 0;
-
-out_close:
-	fclose(f);
-	free_devtable_info();
-	return -1;
-}
-
-/**
- * devtbl_find_path - find a path in the path hash table.
- * @path: UBIFS path to find.
- *
- * This looks up the path hash table. Returns the path hash table element
- * reference if @path was found and %NULL if not.
- */
-struct path_htbl_element *devtbl_find_path(const char *path)
-{
-	if (!path_htbl)
-		return NULL;
-
-	return hashtable_search(path_htbl, (void *)path);
-}
-
-/**
- * devtbl_find_name - find a name in the name hash table.
- * @ph_etl: path hash table element to find at
- * @name: name to find
- *
- * This looks up the name hash table. Returns the name hash table element
- * reference if @name found and %NULL if not.
- */
-struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
-					   const char *name)
-{
-	if (!path_htbl)
-		return NULL;
-
-	return hashtable_search(ph_elt->name_htbl, (void *)name);
-}
-
-/**
- * override_attributes - override inode attributes.
- * @st: struct stat object to containing the attributes to override
- * @ph_elt: path hash table element object
- * @nh_elt: name hash table element object containing the new values
- *
- * The device table file may override attributes like UID of files. For
- * example, the device table may contain a "/dev" entry, and the UBIFS FS on
- * the host may contain "/dev" directory. In this case the attributes of the
- * "/dev" directory inode has to be as the device table specifies.
- *
- * Note, the hash element is removed by this function as well.
- */
-int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
-			struct name_htbl_element *nh_elt)
-{
-	if (!path_htbl)
-		return 0;
-
-	if (S_ISCHR(st->st_mode) || S_ISBLK(st->st_mode) ||
-	    S_ISFIFO(st->st_mode))
-		return err_msg("%s/%s both exists at UBIFS root at host, "
-			       "and is referred from the device table",
-			       strcmp(ph_elt->path, "/") ? ph_elt->path : "",
-			       nh_elt->name);
-
-	if ((st->st_mode & S_IFMT) != (nh_elt->mode & S_IFMT))
-		return err_msg("%s/%s is referred from the device table also exists in "
-			       "the UBIFS root directory at host, but the file type is "
-			       "different", strcmp(ph_elt->path, "/") ? ph_elt->path : "",
-			       nh_elt->name);
-
-	dbg_msg(3, "set UID %d, GID %d, mode %o for %s/%s as device table says",
-		nh_elt->uid, nh_elt->gid, nh_elt->mode, ph_elt->path, nh_elt->name);
-
-	st->st_uid = nh_elt->uid;
-	st->st_gid = nh_elt->gid;
-	st->st_mode = nh_elt->mode;
-
-	hashtable_remove(ph_elt->name_htbl, (void *)nh_elt->name);
-	return 0;
-}
-
-/**
- * first_name_htbl_element - return first element of the name hash table.
- * @ph_elt: the path hash table the name hash table belongs to
- * @itr: double pointer to a 'struct hashtable_itr' object where the
- *       information about further iterations is stored
- *
- * This function implements name hash table iteration together with
- * 'next_name_htbl_element()'. Returns the first name hash table element or
- * %NULL if the hash table is empty.
- */
-struct name_htbl_element *
-first_name_htbl_element(struct path_htbl_element *ph_elt,
-			struct hashtable_itr **itr)
-{
-	if (!path_htbl || !ph_elt || hashtable_count(ph_elt->name_htbl) == 0)
-		return NULL;
-
-	*itr = hashtable_iterator(ph_elt->name_htbl);
-	return hashtable_iterator_value(*itr);
-}
-
-/**
- * first_name_htbl_element - return next element of the name hash table.
- * @ph_elt: the path hash table the name hash table belongs to
- * @itr: double pointer to a 'struct hashtable_itr' object where the
- *       information about further iterations is stored
- *
- * This function implements name hash table iteration together with
- * 'first_name_htbl_element()'. Returns the next name hash table element or
- * %NULL if there are no more elements.
- */
-struct name_htbl_element *
-next_name_htbl_element(struct path_htbl_element *ph_elt,
-		       struct hashtable_itr **itr)
-{
-	if (!path_htbl || !ph_elt || !hashtable_iterator_advance(*itr))
-		return NULL;
-
-	return hashtable_iterator_value(*itr);
-}
-
-/**
- * free_devtable_info - free device table information.
- *
- * This function frees the path hash table and the name hash tables.
- */
-void free_devtable_info(void)
-{
-	struct hashtable_itr *ph_itr;
-	struct path_htbl_element *ph_elt;
-
-	if (!path_htbl)
-		return;
-
-	if (hashtable_count(path_htbl) > 0) {
-		ph_itr = hashtable_iterator(path_htbl);
-		do {
-			ph_elt = hashtable_iterator_value(ph_itr);
-			/*
-			 * Note, since we use the same string for the key and
-			 * @name in the name hash table elements, we do not
-			 * have to iterate name hash table because @name memory
-			 * will be freed when freeing the key.
-			 */
-			hashtable_destroy(ph_elt->name_htbl, 1);
-		} while (hashtable_iterator_advance(ph_itr));
-	}
-	hashtable_destroy(path_htbl, 1);
-}
diff --git a/ubifs-utils/mkfs.ubifs/devtable.h b/ubifs-utils/mkfs.ubifs/devtable.h
deleted file mode 100644
index 987d4d4..0000000
--- a/ubifs-utils/mkfs.ubifs/devtable.h
+++ /dev/null
@@ -1,55 +0,0 @@
-#include "ubifs_common.h"
-
-/**
- * struct path_htbl_element - an element of the path hash table.
- * @path: the UBIFS path the element describes (the key of the element)
- * @name_htbl: one more (nested) hash table containing names of all
- *             files/directories/device nodes which should be created at this
- *             path
- *
- * See device table handling for more information.
- */
-struct path_htbl_element {
-	const char *path;
-	struct hashtable *name_htbl;
-};
-
-/**
- * struct name_htbl_element - an element in the name hash table
- * @name: name of the file/directory/device node (the key of the element)
- * @mode: accsess rights and file type
- * @uid: user ID
- * @gid: group ID
- * @major: device node major number
- * @minor: device node minor number
- *
- * This is an element of the name hash table. Name hash table sits in the path
- * hash table elements and describes file names which should be created/changed
- * at this path.
- */
-struct name_htbl_element {
-	const char *name;
-	unsigned int mode;
-	unsigned int uid;
-	unsigned int gid;
-	dev_t dev;
-};
-
-extern struct ubifs_info info_;
-
-struct hashtable_itr;
-
-int parse_devtable(const char *tbl_file);
-struct path_htbl_element *devtbl_find_path(const char *path);
-struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
-					   const char *name);
-int override_attributes(struct stat *st, struct path_htbl_element *ph_elt,
-			struct name_htbl_element *nh_elt);
-struct name_htbl_element *
-first_name_htbl_element(struct path_htbl_element *ph_elt,
-			struct hashtable_itr **itr);
-struct name_htbl_element *
-next_name_htbl_element(struct path_htbl_element *ph_elt,
-			struct hashtable_itr **itr);
-void free_devtable_info(void);
-
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
deleted file mode 100644
index c1f99ed..0000000
--- a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
+++ /dev/null
@@ -1,277 +0,0 @@
-/* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
-
-#define PROGRAM_NAME "hashtable"
-
-#include "common.h"
-#include "hashtable.h"
-#include "hashtable_private.h"
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <math.h>
-
-/*
-Credit for primes table: Aaron Krowne
- http://br.endernet.org/~akrowne/
- http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
-*/
-static const unsigned int primes[] = {
-53, 97, 193, 389,
-769, 1543, 3079, 6151,
-12289, 24593, 49157, 98317,
-196613, 393241, 786433, 1572869,
-3145739, 6291469, 12582917, 25165843,
-50331653, 100663319, 201326611, 402653189,
-805306457, 1610612741
-};
-const unsigned int prime_table_length = ARRAY_SIZE(primes);
-const float max_load_factor = 0.65;
-
-/*****************************************************************************/
-struct hashtable *
-create_hashtable(unsigned int minsize,
-                 unsigned int (*hashf) (void*),
-                 int (*eqf) (void*,void*))
-{
-    struct hashtable *h;
-    unsigned int pindex, size = primes[0];
-    /* Check requested hashtable isn't too large */
-    if (minsize > (1u << 30)) return NULL;
-    /* Enforce size as prime */
-    for (pindex=0; pindex < prime_table_length; pindex++) {
-        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
-    }
-    h = (struct hashtable *)malloc(sizeof(struct hashtable));
-    if (NULL == h) return NULL; /*oom*/
-    h->table = (struct entry **)malloc(sizeof(struct entry*) * size);
-    if (NULL == h->table) { free(h); return NULL; } /*oom*/
-    memset(h->table, 0, size * sizeof(struct entry *));
-    h->tablelength  = size;
-    h->primeindex   = pindex;
-    h->entrycount   = 0;
-    h->hashfn       = hashf;
-    h->eqfn         = eqf;
-    h->loadlimit    = (unsigned int) ceil(size * max_load_factor);
-    return h;
-}
-
-/*****************************************************************************/
-unsigned int
-hash(struct hashtable *h, void *k)
-{
-    /* Aim to protect against poor hash functions by adding logic here
-     * - logic taken from java 1.4 hashtable source */
-    unsigned int i = h->hashfn(k);
-    i += ~(i << 9);
-    i ^=  ((i >> 14) | (i << 18)); /* >>> */
-    i +=  (i << 4);
-    i ^=  ((i >> 10) | (i << 22)); /* >>> */
-    return i;
-}
-
-/*****************************************************************************/
-static int
-hashtable_expand(struct hashtable *h)
-{
-    /* Double the size of the table to accomodate more entries */
-    struct entry **newtable;
-    struct entry *e;
-    struct entry **pE;
-    unsigned int newsize, i, index;
-    /* Check we're not hitting max capacity */
-    if (h->primeindex == (prime_table_length - 1)) return 0;
-    newsize = primes[++(h->primeindex)];
-
-    newtable = (struct entry **)malloc(sizeof(struct entry*) * newsize);
-    if (NULL != newtable)
-    {
-        memset(newtable, 0, newsize * sizeof(struct entry *));
-        /* This algorithm is not 'stable'. ie. it reverses the list
-         * when it transfers entries between the tables */
-        for (i = 0; i < h->tablelength; i++) {
-            while (NULL != (e = h->table[i])) {
-                h->table[i] = e->next;
-                index = indexFor(newsize,e->h);
-                e->next = newtable[index];
-                newtable[index] = e;
-            }
-        }
-        free(h->table);
-        h->table = newtable;
-    }
-    /* Plan B: realloc instead */
-    else
-    {
-        newtable = (struct entry **)
-                   realloc(h->table, newsize * sizeof(struct entry *));
-        if (NULL == newtable) { (h->primeindex)--; return 0; }
-        h->table = newtable;
-        memset(newtable[h->tablelength], 0, newsize - h->tablelength);
-        for (i = 0; i < h->tablelength; i++) {
-            for (pE = &(newtable[i]), e = *pE; e != NULL; e = *pE) {
-                index = indexFor(newsize,e->h);
-                if (index == i)
-                {
-                    pE = &(e->next);
-                }
-                else
-                {
-                    *pE = e->next;
-                    e->next = newtable[index];
-                    newtable[index] = e;
-                }
-            }
-        }
-    }
-    h->tablelength = newsize;
-    h->loadlimit   = (unsigned int) ceil(newsize * max_load_factor);
-    return -1;
-}
-
-/*****************************************************************************/
-unsigned int
-hashtable_count(struct hashtable *h)
-{
-    return h->entrycount;
-}
-
-/*****************************************************************************/
-int
-hashtable_insert(struct hashtable *h, void *k, void *v)
-{
-    /* This method allows duplicate keys - but they shouldn't be used */
-    unsigned int index;
-    struct entry *e;
-    if (++(h->entrycount) > h->loadlimit)
-    {
-        /* Ignore the return value. If expand fails, we should
-         * still try cramming just this value into the existing table
-         * -- we may not have memory for a larger table, but one more
-         * element may be ok. Next time we insert, we'll try expanding again.*/
-        hashtable_expand(h);
-    }
-    e = (struct entry *)malloc(sizeof(struct entry));
-    if (NULL == e) { --(h->entrycount); return 0; } /*oom*/
-    e->h = hash(h,k);
-    index = indexFor(h->tablelength,e->h);
-    e->k = k;
-    e->v = v;
-    e->next = h->table[index];
-    h->table[index] = e;
-    return -1;
-}
-
-/*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_search(struct hashtable *h, void *k)
-{
-    struct entry *e;
-    unsigned int hashvalue, index;
-    hashvalue = hash(h,k);
-    index = indexFor(h->tablelength,hashvalue);
-    e = h->table[index];
-    while (NULL != e)
-    {
-        /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
-        e = e->next;
-    }
-    return NULL;
-}
-
-/*****************************************************************************/
-void * /* returns value associated with key */
-hashtable_remove(struct hashtable *h, void *k)
-{
-    /* TODO: consider compacting the table when the load factor drops enough,
-     *       or provide a 'compact' method. */
-
-    struct entry *e;
-    struct entry **pE;
-    void *v;
-    unsigned int hashvalue, index;
-
-    hashvalue = hash(h,k);
-    index = indexFor(h->tablelength,hash(h,k));
-    pE = &(h->table[index]);
-    e = *pE;
-    while (NULL != e)
-    {
-        /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
-        {
-            *pE = e->next;
-            h->entrycount--;
-            v = e->v;
-            freekey(e->k);
-            free(e);
-            return v;
-        }
-        pE = &(e->next);
-        e = e->next;
-    }
-    return NULL;
-}
-
-/*****************************************************************************/
-/* destroy */
-void
-hashtable_destroy(struct hashtable *h, int free_values)
-{
-    unsigned int i;
-    struct entry *e, *f;
-    struct entry **table = h->table;
-    if (free_values)
-    {
-        for (i = 0; i < h->tablelength; i++)
-        {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f->v); free(f); }
-        }
-    }
-    else
-    {
-        for (i = 0; i < h->tablelength; i++)
-        {
-            e = table[i];
-            while (NULL != e)
-            { f = e; e = e->next; freekey(f->k); free(f); }
-        }
-    }
-    free(h->table);
-    free(h);
-}
-
-/*
- * Copyright (c) 2002, Christopher Clark
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- *
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- *
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- *
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
deleted file mode 100644
index c0b0acd..0000000
--- a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
+++ /dev/null
@@ -1,199 +0,0 @@
-/* Copyright (C) 2002 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
-
-#ifndef __HASHTABLE_CWC22_H__
-#define __HASHTABLE_CWC22_H__
-
-struct hashtable;
-
-/* Example of use:
- *
- *      struct hashtable  *h;
- *      struct some_key   *k;
- *      struct some_value *v;
- *
- *      static unsigned int         hash_from_key_fn( void *k );
- *      static int                  keys_equal_fn ( void *key1, void *key2 );
- *
- *      h = create_hashtable(16, hash_from_key_fn, keys_equal_fn);
- *      k = (struct some_key *)     malloc(sizeof(struct some_key));
- *      v = (struct some_value *)   malloc(sizeof(struct some_value));
- *
- *      (initialise k and v to suitable values)
- *
- *      if (! hashtable_insert(h,k,v) )
- *      {     exit(-1);               }
- *
- *      if (NULL == (found = hashtable_search(h,k) ))
- *      {    printf("not found!");                  }
- *
- *      if (NULL == (found = hashtable_remove(h,k) ))
- *      {    printf("Not found\n");                 }
- *
- */
-
-/* Macros may be used to define type-safe(r) hashtable access functions, with
- * methods specialized to take known key and value types as parameters.
- *
- * Example:
- *
- * Insert this at the start of your file:
- *
- * DEFINE_HASHTABLE_INSERT(insert_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_SEARCH(search_some, struct some_key, struct some_value);
- * DEFINE_HASHTABLE_REMOVE(remove_some, struct some_key, struct some_value);
- *
- * This defines the functions 'insert_some', 'search_some' and 'remove_some'.
- * These operate just like hashtable_insert etc., with the same parameters,
- * but their function signatures have 'struct some_key *' rather than
- * 'void *', and hence can generate compile time errors if your program is
- * supplying incorrect data as a key (and similarly for value).
- *
- * Note that the hash and key equality functions passed to create_hashtable
- * still take 'void *' parameters instead of 'some key *'. This shouldn't be
- * a difficult issue as they're only defined and passed once, and the other
- * functions will ensure that only valid keys are supplied to them.
- *
- * The cost for this checking is increased code size and runtime overhead
- * - if performance is important, it may be worth switching back to the
- * unsafe methods once your program has been debugged with the safe methods.
- * This just requires switching to some simple alternative defines - eg:
- * #define insert_some hashtable_insert
- *
- */
-
-/*****************************************************************************
- * create_hashtable
-
- * @name                    create_hashtable
- * @param   minsize         minimum initial size of hashtable
- * @param   hashfunction    function for hashing keys
- * @param   key_eq_fn       function for determining key equality
- * @return                  newly created hashtable or NULL on failure
- */
-
-struct hashtable *
-create_hashtable(unsigned int minsize,
-                 unsigned int (*hashfunction) (void*),
-                 int (*key_eq_fn) (void*,void*));
-
-/*****************************************************************************
- * hashtable_insert
-
- * @name        hashtable_insert
- * @param   h   the hashtable to insert into
- * @param   k   the key - hashtable claims ownership and will free on removal
- * @param   v   the value - does not claim ownership
- * @return      non-zero for successful insertion
- *
- * This function will cause the table to expand if the insertion would take
- * the ratio of entries to table size over the maximum load factor.
- *
- * This function does not check for repeated insertions with a duplicate key.
- * The value returned when using a duplicate key is undefined -- when
- * the hashtable changes size, the order of retrieval of duplicate key
- * entries is reversed.
- * If in doubt, remove before insert.
- */
-
-int
-hashtable_insert(struct hashtable *h, void *k, void *v);
-
-#define DEFINE_HASHTABLE_INSERT(fnname, keytype, valuetype) \
-int fnname (struct hashtable *h, keytype *k, valuetype *v) \
-{ \
-    return hashtable_insert(h,k,v); \
-}
-
-/*****************************************************************************
- * hashtable_search
-
- * @name        hashtable_search
- * @param   h   the hashtable to search
- * @param   k   the key to search for  - does not claim ownership
- * @return      the value associated with the key, or NULL if none found
- */
-
-void *
-hashtable_search(struct hashtable *h, void *k);
-
-#define DEFINE_HASHTABLE_SEARCH(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_search(h,k)); \
-}
-
-/*****************************************************************************
- * hashtable_remove
-
- * @name        hashtable_remove
- * @param   h   the hashtable to remove the item from
- * @param   k   the key to search for  - does not claim ownership
- * @return      the value associated with the key, or NULL if none found
- */
-
-void * /* returns value */
-hashtable_remove(struct hashtable *h, void *k);
-
-#define DEFINE_HASHTABLE_REMOVE(fnname, keytype, valuetype) \
-valuetype * fnname (struct hashtable *h, keytype *k) \
-{ \
-    return (valuetype *) (hashtable_remove(h,k)); \
-}
-
-
-/*****************************************************************************
- * hashtable_count
-
- * @name        hashtable_count
- * @param   h   the hashtable
- * @return      the number of items stored in the hashtable
- */
-unsigned int
-hashtable_count(struct hashtable *h);
-
-
-/*****************************************************************************
- * hashtable_destroy
-
- * @name        hashtable_destroy
- * @param   h   the hashtable
- * @param       free_values     whether to call 'free' on the remaining values
- */
-
-void
-hashtable_destroy(struct hashtable *h, int free_values);
-
-#endif /* __HASHTABLE_CWC22_H__ */
-
-/*
- * Copyright (c) 2002, Christopher Clark
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- *
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- *
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- *
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
deleted file mode 100644
index d102453..0000000
--- a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
+++ /dev/null
@@ -1,176 +0,0 @@
-/* Copyright (C) 2002, 2004 Christopher Clark  <firstname.lastname@cl.cam.ac.uk> */
-
-#include "hashtable.h"
-#include "hashtable_private.h"
-#include "hashtable_itr.h"
-#include <stdlib.h> /* defines NULL */
-
-/*****************************************************************************/
-/* hashtable_iterator    - iterator constructor */
-
-struct hashtable_itr *
-hashtable_iterator(struct hashtable *h)
-{
-    unsigned int i, tablelength;
-    struct hashtable_itr *itr = (struct hashtable_itr *)
-        malloc(sizeof(struct hashtable_itr));
-    if (NULL == itr) return NULL;
-    itr->h = h;
-    itr->e = NULL;
-    itr->parent = NULL;
-    tablelength = h->tablelength;
-    itr->index = tablelength;
-    if (0 == h->entrycount) return itr;
-
-    for (i = 0; i < tablelength; i++)
-    {
-        if (NULL != h->table[i])
-        {
-            itr->e = h->table[i];
-            itr->index = i;
-            break;
-        }
-    }
-    return itr;
-}
-
-/*****************************************************************************/
-/* advance - advance the iterator to the next element
- *           returns zero if advanced to end of table */
-
-int
-hashtable_iterator_advance(struct hashtable_itr *itr)
-{
-    unsigned int j,tablelength;
-    struct entry **table;
-    struct entry *next;
-    if (NULL == itr->e) return 0; /* stupidity check */
-
-    next = itr->e->next;
-    if (NULL != next)
-    {
-        itr->parent = itr->e;
-        itr->e = next;
-        return -1;
-    }
-    tablelength = itr->h->tablelength;
-    itr->parent = NULL;
-    if (tablelength <= (j = ++(itr->index)))
-    {
-        itr->e = NULL;
-        return 0;
-    }
-    table = itr->h->table;
-    while (NULL == (next = table[j]))
-    {
-        if (++j >= tablelength)
-        {
-            itr->index = tablelength;
-            itr->e = NULL;
-            return 0;
-        }
-    }
-    itr->index = j;
-    itr->e = next;
-    return -1;
-}
-
-/*****************************************************************************/
-/* remove - remove the entry at the current iterator position
- *          and advance the iterator, if there is a successive
- *          element.
- *          If you want the value, read it before you remove:
- *          beware memory leaks if you don't.
- *          Returns zero if end of iteration. */
-
-int
-hashtable_iterator_remove(struct hashtable_itr *itr)
-{
-    struct entry *remember_e, *remember_parent;
-    int ret;
-
-    /* Do the removal */
-    if (NULL == (itr->parent))
-    {
-        /* element is head of a chain */
-        itr->h->table[itr->index] = itr->e->next;
-    } else {
-        /* element is mid-chain */
-        itr->parent->next = itr->e->next;
-    }
-    /* itr->e is now outside the hashtable */
-    remember_e = itr->e;
-    itr->h->entrycount--;
-    freekey(remember_e->k);
-
-    /* Advance the iterator, correcting the parent */
-    remember_parent = itr->parent;
-    ret = hashtable_iterator_advance(itr);
-    if (itr->parent == remember_e) { itr->parent = remember_parent; }
-    free(remember_e);
-    return ret;
-}
-
-/*****************************************************************************/
-int /* returns zero if not found */
-hashtable_iterator_search(struct hashtable_itr *itr,
-                          struct hashtable *h, void *k)
-{
-    struct entry *e, *parent;
-    unsigned int hashvalue, index;
-
-    hashvalue = hash(h,k);
-    index = indexFor(h->tablelength,hashvalue);
-
-    e = h->table[index];
-    parent = NULL;
-    while (NULL != e)
-    {
-        /* Check hash value to short circuit heavier comparison */
-        if ((hashvalue == e->h) && (h->eqfn(k, e->k)))
-        {
-            itr->index = index;
-            itr->e = e;
-            itr->parent = parent;
-            itr->h = h;
-            return -1;
-        }
-        parent = e;
-        e = e->next;
-    }
-    return 0;
-}
-
-
-/*
- * Copyright (c) 2002, 2004, Christopher Clark
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- *
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- *
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- *
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
deleted file mode 100644
index 5c94a04..0000000
--- a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
+++ /dev/null
@@ -1,112 +0,0 @@
-/* Copyright (C) 2002, 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
-
-#ifndef __HASHTABLE_ITR_CWC22__
-#define __HASHTABLE_ITR_CWC22__
-#include "hashtable.h"
-#include "hashtable_private.h" /* needed to enable inlining */
-
-/*****************************************************************************/
-/* This struct is only concrete here to allow the inlining of two of the
- * accessor functions. */
-struct hashtable_itr
-{
-    struct hashtable *h;
-    struct entry *e;
-    struct entry *parent;
-    unsigned int index;
-};
-
-
-/*****************************************************************************/
-/* hashtable_iterator
- */
-
-struct hashtable_itr *
-hashtable_iterator(struct hashtable *h);
-
-/*****************************************************************************/
-/* hashtable_iterator_key
- * - return the value of the (key,value) pair at the current position */
-
-static inline void *
-hashtable_iterator_key(struct hashtable_itr *i)
-{
-    return i->e->k;
-}
-
-/*****************************************************************************/
-/* value - return the value of the (key,value) pair at the current position */
-
-static inline void *
-hashtable_iterator_value(struct hashtable_itr *i)
-{
-    return i->e->v;
-}
-
-/*****************************************************************************/
-/* advance - advance the iterator to the next element
- *           returns zero if advanced to end of table */
-
-int
-hashtable_iterator_advance(struct hashtable_itr *itr);
-
-/*****************************************************************************/
-/* remove - remove current element and advance the iterator to the next element
- *          NB: if you need the value to free it, read it before
- *          removing. ie: beware memory leaks!
- *          returns zero if advanced to end of table */
-
-int
-hashtable_iterator_remove(struct hashtable_itr *itr);
-
-/*****************************************************************************/
-/* search - overwrite the supplied iterator, to point to the entry
- *          matching the supplied key.
-            h points to the hashtable to be searched.
- *          returns zero if not found. */
-int
-hashtable_iterator_search(struct hashtable_itr *itr,
-                          struct hashtable *h, void *k);
-
-#define DEFINE_HASHTABLE_ITERATOR_SEARCH(fnname, keytype) \
-int fnname (struct hashtable_itr *i, struct hashtable *h, keytype *k) \
-{ \
-    return (hashtable_iterator_search(i,h,k)); \
-}
-
-
-
-#endif /* __HASHTABLE_ITR_CWC22__*/
-
-/*
- * Copyright (c) 2002, 2004, Christopher Clark
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- *
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- *
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- *
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
deleted file mode 100644
index 3a558e6..0000000
--- a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
+++ /dev/null
@@ -1,85 +0,0 @@
-/* Copyright (C) 2002, 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
-
-#ifndef __HASHTABLE_PRIVATE_CWC22_H__
-#define __HASHTABLE_PRIVATE_CWC22_H__
-
-#include "hashtable.h"
-
-/*****************************************************************************/
-struct entry
-{
-    void *k, *v;
-    unsigned int h;
-    struct entry *next;
-};
-
-struct hashtable {
-    unsigned int tablelength;
-    struct entry **table;
-    unsigned int entrycount;
-    unsigned int loadlimit;
-    unsigned int primeindex;
-    unsigned int (*hashfn) (void *k);
-    int (*eqfn) (void *k1, void *k2);
-};
-
-/*****************************************************************************/
-unsigned int
-hash(struct hashtable *h, void *k);
-
-/*****************************************************************************/
-/* indexFor */
-static inline unsigned int
-indexFor(unsigned int tablelength, unsigned int hashvalue) {
-    return (hashvalue % tablelength);
-};
-
-/* Only works if tablelength == 2^N */
-/*static inline unsigned int
-indexFor(unsigned int tablelength, unsigned int hashvalue)
-{
-    return (hashvalue & (tablelength - 1u));
-}
-*/
-
-/*****************************************************************************/
-#define freekey(X) free(X)
-/*define freekey(X) ; */
-
-
-/*****************************************************************************/
-
-#endif /* __HASHTABLE_PRIVATE_CWC22_H__*/
-
-/*
- * Copyright (c) 2002, Christopher Clark
- * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer.
- *
- * * Redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution.
- *
- * * Neither the name of the original author; nor the names of any contributors
- * may be used to endorse or promote products derived from this software
- * without specific prior written permission.
- *
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
- * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
- * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
- * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/
diff --git a/ubifs-utils/mkfs.ubifs/io.c b/ubifs-utils/mkfs.ubifs/io.c
deleted file mode 100644
index 7aba0a6..0000000
--- a/ubifs-utils/mkfs.ubifs/io.c
+++ /dev/null
@@ -1,33 +0,0 @@
-#include "io.h"
-#define PROGRAM_NAME "ubifs-io"
-#include <common.h>
-
-int out_fd;
-int out_ubi;
-libubi_t ubi;
-
-/**
- * write_leb - copy the image of a LEB to the output target.
- * @lnum: LEB number
- * @len: length of data in the buffer
- * @buf: buffer (must be at least c->leb_size bytes)
- */
-int write_leb(struct ubifs_info *c, int lnum, int len, void *buf)
-{
-	off_t pos = (off_t)lnum * c->leb_size;
-
-	dbg_msg(3, "LEB %d len %d", lnum, len);
-	memset(buf + len, 0xff, c->leb_size - len);
-	if (out_ubi)
-		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size))
-			return sys_err_msg("ubi_leb_change_start failed");
-
-	if (lseek(out_fd, pos, SEEK_SET) != pos)
-		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
-
-	if (write(out_fd, buf, c->leb_size) != c->leb_size)
-		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
-				   c->leb_size, pos);
-
-	return 0;
-}
diff --git a/ubifs-utils/mkfs.ubifs/io.h b/ubifs-utils/mkfs.ubifs/io.h
deleted file mode 100644
index e24d0c6..0000000
--- a/ubifs-utils/mkfs.ubifs/io.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/**
- * Header file for the io to ubi volume
- */
-#ifndef __UBIFS_IO_H__
-#define __UBIFS_IO_H__
-
-#include "ubifs_common.h"
-#include "ubifs.h"
-
-extern int out_fd;
-extern int out_ubi;
-extern libubi_t ubi;
-
-int write_leb(struct ubifs_info *c, int lnum, int len, void *buf);
-#endif
diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
deleted file mode 100644
index 39379fd..0000000
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ /dev/null
@@ -1,207 +0,0 @@
-/*
- * This file is part of UBIFS.
- *
- * Copyright (C) 2006-2008 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Artem Bityutskiy (Битюцкий Артём)
- *          Adrian Hunter
- */
-
-/*
- * This header contains various key-related definitions and helper function.
- * UBIFS allows several key schemes, so we access key fields only via these
- * helpers. At the moment only one key scheme is supported.
- *
- * Simple key scheme
- * ~~~~~~~~~~~~~~~~~
- *
- * Keys are 64-bits long. First 32-bits are inode number (parent inode number
- * in case of direntry key). Next 3 bits are node type. The last 29 bits are
- * 4KiB offset in case of inode node, and direntry hash in case of a direntry
- * node. We use "r5" hash borrowed from reiserfs.
- */
-
-#ifndef __UBIFS_KEY_H__
-#define __UBIFS_KEY_H__
-
-/**
- * key_mask_hash - mask a valid hash value.
- * @val: value to be masked
- *
- * We use hash values as offset in directories, so values %0 and %1 are
- * reserved for "." and "..". %2 is reserved for "end of readdir" marker. This
- * function makes sure the reserved values are not used.
- */
-static inline uint32_t key_mask_hash(uint32_t hash)
-{
-	hash &= UBIFS_S_KEY_HASH_MASK;
-	if (unlikely(hash <= 2))
-		hash += 3;
-	return hash;
-}
-
-/**
- * key_r5_hash - R5 hash function (borrowed from reiserfs).
- * @s: direntry name
- * @len: name length
- */
-static inline uint32_t key_r5_hash(const char *s, int len)
-{
-	uint32_t a = 0;
-	const signed char *str = (const signed char *)s;
-
-	len = len;
-	while (*str) {
-		a += *str << 4;
-		a += *str >> 4;
-		a *= 11;
-		str++;
-	}
-
-	return key_mask_hash(a);
-}
-
-/**
- * key_test_hash - testing hash function.
- * @str: direntry name
- * @len: name length
- */
-static inline uint32_t key_test_hash(const char *str, int len)
-{
-	uint32_t a = 0;
-
-	len = min_t(uint32_t, len, 4);
-	memcpy(&a, str, len);
-	return key_mask_hash(a);
-}
-
-/**
- * ino_key_init - initialize inode key.
- * @c: UBIFS file-system description object
- * @key: key to initialize
- * @inum: inode number
- */
-static inline void ino_key_init(union ubifs_key *key, ino_t inum)
-{
-	key->u32[0] = inum;
-	key->u32[1] = UBIFS_INO_KEY << UBIFS_S_KEY_BLOCK_BITS;
-}
-
-/**
- * dent_key_init - initialize directory entry key.
- * @c: UBIFS file-system description object
- * @key: key to initialize
- * @inum: parent inode number
- * @nm: direntry name and length
- */
-static inline void dent_key_init(const struct ubifs_info *c,
-				 union ubifs_key *key, ino_t inum,
-				 const struct qstr *nm)
-{
-	uint32_t hash = c->key_hash(nm->name, nm->len);
-
-	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
-	key->u32[0] = inum;
-	key->u32[1] = hash | (UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS);
-}
-
-/**
- * xent_key_init - initialize extended attribute entry key.
- * @c: UBIFS file-system description object
- * @key: key to initialize
- * @inum: host inode number
- * @nm: extended attribute entry name and length
- */
-static inline void xent_key_init(const struct ubifs_info *c,
-				 union ubifs_key *key, ino_t inum,
-				 const struct qstr *nm)
-{
-	uint32_t hash = c->key_hash(nm->name, nm->len);
-
-	ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
-	key->u32[0] = inum;
-	key->u32[1] = hash | (UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS);
-}
-
-/**
- * data_key_init - initialize data key.
- * @c: UBIFS file-system description object
- * @key: key to initialize
- * @inum: inode number
- * @block: block number
- */
-static inline void data_key_init(union ubifs_key *key, ino_t inum,
-				 unsigned int block)
-{
-	ubifs_assert(!(block & ~UBIFS_S_KEY_BLOCK_MASK));
-	key->u32[0] = inum;
-	key->u32[1] = block | (UBIFS_DATA_KEY << UBIFS_S_KEY_BLOCK_BITS);
-}
-
-/**
- * key_write - transform a key from in-memory format.
- * @c: UBIFS file-system description object
- * @from: the key to transform
- * @to: the key to store the result
- */
-static inline void key_write(const union ubifs_key *from, void *to)
-{
-	union ubifs_key *t = to;
-
-	t->j32[0] = cpu_to_le32(from->u32[0]);
-	t->j32[1] = cpu_to_le32(from->u32[1]);
-	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
-}
-
-/**
- * key_write_idx - transform a key from in-memory format for the index.
- * @c: UBIFS file-system description object
- * @from: the key to transform
- * @to: the key to store the result
- */
-static inline void key_write_idx(const union ubifs_key *from, void *to)
-{
-	union ubifs_key *t = to;
-
-	t->j32[0] = cpu_to_le32(from->u32[0]);
-	t->j32[1] = cpu_to_le32(from->u32[1]);
-}
-
-/**
- * keys_cmp - compare keys.
- * @c: UBIFS file-system description object
- * @key1: the first key to compare
- * @key2: the second key to compare
- *
- * This function compares 2 keys and returns %-1 if @key1 is less than
- * @key2, 0 if the keys are equivalent and %1 if @key1 is greater than @key2.
- */
-static inline int keys_cmp(const union ubifs_key *key1,
-			   const union ubifs_key *key2)
-{
-	if (key1->u32[0] < key2->u32[0])
-		return -1;
-	if (key1->u32[0] > key2->u32[0])
-		return 1;
-	if (key1->u32[1] < key2->u32[1])
-		return -1;
-	if (key1->u32[1] > key2->u32[1])
-		return 1;
-
-	return 0;
-}
-
-#endif /* !__UBIFS_KEY_H__ */
diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/mkfs.ubifs/lpt.c
deleted file mode 100644
index 100d747..0000000
--- a/ubifs-utils/mkfs.ubifs/lpt.c
+++ /dev/null
@@ -1,587 +0,0 @@
-/*
- * This file is part of UBIFS.
- *
- * Copyright (C) 2006, 2007 Nokia Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Adrian Hunter
- *          Artem Bityutskiy
- */
-
-#include "ubifs_common.h"
-
-/* common.h requires the PROGRAM_NAME macro */
-#define PROGRAM_NAME "ubifs-lpt"
-#include "common.h"
-
-#include "crc16.h"
-#include "ubifs.h"
-#include "lpt.h"
-#include "io.h"
-
-/**
- * do_calc_lpt_geom - calculate sizes for the LPT area.
- * @c: the UBIFS file-system description object
- *
- * Calculate the sizes of LPT bit fields, nodes, and tree, based on the
- * properties of the flash and whether LPT is "big" (c->big_lpt).
- */
-static void do_calc_lpt_geom(struct ubifs_info *c)
-{
-	int n, bits, per_leb_wastage;
-	long long sz, tot_wastage;
-
-	c->pnode_cnt = (c->main_lebs + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
-
-	n = (c->pnode_cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
-	c->nnode_cnt = n;
-	while (n > 1) {
-		n = (n + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
-		c->nnode_cnt += n;
-	}
-
-	c->lpt_hght = 1;
-	n = UBIFS_LPT_FANOUT;
-	while (n < c->pnode_cnt) {
-		c->lpt_hght += 1;
-		n <<= UBIFS_LPT_FANOUT_SHIFT;
-	}
-
-	c->space_bits = fls(c->leb_size) - 3;
-	c->lpt_lnum_bits = fls(c->lpt_lebs);
-	c->lpt_offs_bits = fls(c->leb_size - 1);
-	c->lpt_spc_bits = fls(c->leb_size);
-
-	n = (c->max_leb_cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
-	c->pcnt_bits = fls(n - 1);
-
-	c->lnum_bits = fls(c->max_leb_cnt - 1);
-
-	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
-	       (c->big_lpt ? c->pcnt_bits : 0) +
-	       (c->space_bits * 2 + 1) * UBIFS_LPT_FANOUT;
-	c->pnode_sz = (bits + 7) / 8;
-
-	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
-	       (c->big_lpt ? c->pcnt_bits : 0) +
-	       (c->lpt_lnum_bits + c->lpt_offs_bits) * UBIFS_LPT_FANOUT;
-	c->nnode_sz = (bits + 7) / 8;
-
-	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
-	       c->lpt_lebs * c->lpt_spc_bits * 2;
-	c->ltab_sz = (bits + 7) / 8;
-
-	bits = UBIFS_LPT_CRC_BITS + UBIFS_LPT_TYPE_BITS +
-	       c->lnum_bits * c->lsave_cnt;
-	c->lsave_sz = (bits + 7) / 8;
-
-	/* Calculate the minimum LPT size */
-	c->lpt_sz = (long long)c->pnode_cnt * c->pnode_sz;
-	c->lpt_sz += (long long)c->nnode_cnt * c->nnode_sz;
-	c->lpt_sz += c->ltab_sz;
-	c->lpt_sz += c->lsave_sz;
-
-	/* Add wastage */
-	sz = c->lpt_sz;
-	per_leb_wastage = max_t(int, c->pnode_sz, c->nnode_sz);
-	sz += per_leb_wastage;
-	tot_wastage = per_leb_wastage;
-	while (sz > c->leb_size) {
-		sz += per_leb_wastage;
-		sz -= c->leb_size;
-		tot_wastage += per_leb_wastage;
-	}
-	tot_wastage += ALIGN(sz, c->min_io_size) - sz;
-	c->lpt_sz += tot_wastage;
-}
-
-/**
- * calc_dflt_lpt_geom - calculate default LPT geometry.
- * @c: the UBIFS file-system description object
- * @main_lebs: number of main area LEBs is passed and returned here
- * @big_lpt: whether the LPT area is "big" is returned here
- *
- * The size of the LPT area depends on parameters that themselves are dependent
- * on the size of the LPT area. This function, successively recalculates the LPT
- * area geometry until the parameters and resultant geometry are consistent.
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt)
-{
-	int i, lebs_needed;
-	long long sz;
-
-	/* Start by assuming the minimum number of LPT LEBs */
-	c->lpt_lebs = UBIFS_MIN_LPT_LEBS;
-	c->main_lebs = *main_lebs - c->lpt_lebs;
-	if (c->main_lebs <= 0)
-		return -EINVAL;
-
-	/* And assume we will use the small LPT model */
-	c->big_lpt = 0;
-
-	/*
-	 * Calculate the geometry based on assumptions above and then see if it
-	 * makes sense
-	 */
-	do_calc_lpt_geom(c);
-
-	/* Small LPT model must have lpt_sz < leb_size */
-	if (c->lpt_sz > c->leb_size) {
-		/* Nope, so try again using big LPT model */
-		c->big_lpt = 1;
-		do_calc_lpt_geom(c);
-	}
-
-	/* Now check there are enough LPT LEBs */
-	for (i = 0; i < 64 ; i++) {
-		sz = c->lpt_sz * 4; /* Allow 4 times the size */
-		sz += c->leb_size - 1;
-		do_div(sz, c->leb_size);
-		lebs_needed = sz;
-		if (lebs_needed > c->lpt_lebs) {
-			/* Not enough LPT LEBs so try again with more */
-			c->lpt_lebs = lebs_needed;
-			c->main_lebs = *main_lebs - c->lpt_lebs;
-			if (c->main_lebs <= 0)
-				return -EINVAL;
-			do_calc_lpt_geom(c);
-			continue;
-		}
-		if (c->ltab_sz > c->leb_size) {
-			err_msg("LPT ltab too big");
-			return -EINVAL;
-		}
-		*main_lebs = c->main_lebs;
-		*big_lpt = c->big_lpt;
-		return 0;
-	}
-	return -EINVAL;
-}
-
-/**
- * pack_bits - pack bit fields end-to-end.
- * @addr: address at which to pack (passed and next address returned)
- * @pos: bit position at which to pack (passed and next position returned)
- * @val: value to pack
- * @nrbits: number of bits of value to pack (1-32)
- */
-static void pack_bits(uint8_t **addr, int *pos, uint32_t val, int nrbits)
-{
-	uint8_t *p = *addr;
-	int b = *pos;
-
-	if (b) {
-		*p |= ((uint8_t)val) << b;
-		nrbits += b;
-		if (nrbits > 8) {
-			*++p = (uint8_t)(val >>= (8 - b));
-			if (nrbits > 16) {
-				*++p = (uint8_t)(val >>= 8);
-				if (nrbits > 24) {
-					*++p = (uint8_t)(val >>= 8);
-					if (nrbits > 32)
-						*++p = (uint8_t)(val >>= 8);
-				}
-			}
-		}
-	} else {
-		*p = (uint8_t)val;
-		if (nrbits > 8) {
-			*++p = (uint8_t)(val >>= 8);
-			if (nrbits > 16) {
-				*++p = (uint8_t)(val >>= 8);
-				if (nrbits > 24)
-					*++p = (uint8_t)(val >>= 8);
-			}
-		}
-	}
-	b = nrbits & 7;
-	if (b == 0)
-		p++;
-	*addr = p;
-	*pos = b;
-}
-
-/**
- * pack_pnode - pack all the bit fields of a pnode.
- * @c: UBIFS file-system description object
- * @buf: buffer into which to pack
- * @pnode: pnode to pack
- */
-static void pack_pnode(struct ubifs_info *c, void *buf,
-		       struct ubifs_pnode *pnode)
-{
-	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
-	int i, pos = 0;
-	uint16_t crc;
-
-	pack_bits(&addr, &pos, UBIFS_LPT_PNODE, UBIFS_LPT_TYPE_BITS);
-	if (c->big_lpt)
-		pack_bits(&addr, &pos, pnode->num, c->pcnt_bits);
-	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
-		pack_bits(&addr, &pos, pnode->lprops[i].free >> 3,
-			  c->space_bits);
-		pack_bits(&addr, &pos, pnode->lprops[i].dirty >> 3,
-			  c->space_bits);
-		if (pnode->lprops[i].flags & LPROPS_INDEX)
-			pack_bits(&addr, &pos, 1, 1);
-		else
-			pack_bits(&addr, &pos, 0, 1);
-	}
-	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
-		    c->pnode_sz - UBIFS_LPT_CRC_BYTES);
-	addr = buf;
-	pos = 0;
-	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
-}
-
-/**
- * pack_nnode - pack all the bit fields of a nnode.
- * @c: UBIFS file-system description object
- * @buf: buffer into which to pack
- * @nnode: nnode to pack
- */
-static void pack_nnode(struct ubifs_info *c, void *buf,
-		       struct ubifs_nnode *nnode)
-{
-	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
-	int i, pos = 0;
-	uint16_t crc;
-
-	pack_bits(&addr, &pos, UBIFS_LPT_NNODE, UBIFS_LPT_TYPE_BITS);
-	if (c->big_lpt)
-		pack_bits(&addr, &pos, nnode->num, c->pcnt_bits);
-	for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
-		int lnum = nnode->nbranch[i].lnum;
-
-		if (lnum == 0)
-			lnum = c->lpt_last + 1;
-		pack_bits(&addr, &pos, lnum - c->lpt_first, c->lpt_lnum_bits);
-		pack_bits(&addr, &pos, nnode->nbranch[i].offs,
-			  c->lpt_offs_bits);
-	}
-	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
-		    c->nnode_sz - UBIFS_LPT_CRC_BYTES);
-	addr = buf;
-	pos = 0;
-	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
-}
-
-/**
- * pack_ltab - pack the LPT's own lprops table.
- * @c: UBIFS file-system description object
- * @buf: buffer into which to pack
- * @ltab: LPT's own lprops table to pack
- */
-static void pack_ltab(struct ubifs_info *c, void *buf,
-			 struct ubifs_lpt_lprops *ltab)
-{
-	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
-	int i, pos = 0;
-	uint16_t crc;
-
-	pack_bits(&addr, &pos, UBIFS_LPT_LTAB, UBIFS_LPT_TYPE_BITS);
-	for (i = 0; i < c->lpt_lebs; i++) {
-		pack_bits(&addr, &pos, ltab[i].free, c->lpt_spc_bits);
-		pack_bits(&addr, &pos, ltab[i].dirty, c->lpt_spc_bits);
-	}
-	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
-		    c->ltab_sz - UBIFS_LPT_CRC_BYTES);
-	addr = buf;
-	pos = 0;
-	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
-}
-
-/**
- * pack_lsave - pack the LPT's save table.
- * @c: UBIFS file-system description object
- * @buf: buffer into which to pack
- * @lsave: LPT's save table to pack
- */
-static void pack_lsave(struct ubifs_info *c, void *buf, int *lsave)
-{
-	uint8_t *addr = buf + UBIFS_LPT_CRC_BYTES;
-	int i, pos = 0;
-	uint16_t crc;
-
-	pack_bits(&addr, &pos, UBIFS_LPT_LSAVE, UBIFS_LPT_TYPE_BITS);
-	for (i = 0; i < c->lsave_cnt; i++)
-		pack_bits(&addr, &pos, lsave[i], c->lnum_bits);
-	crc = crc16(-1, buf + UBIFS_LPT_CRC_BYTES,
-		    c->lsave_sz - UBIFS_LPT_CRC_BYTES);
-	addr = buf;
-	pos = 0;
-	pack_bits(&addr, &pos, crc, UBIFS_LPT_CRC_BITS);
-}
-
-/**
- * set_ltab - set LPT LEB properties.
- * @c: UBIFS file-system description object
- * @lnum: LEB number
- * @free: amount of free space
- * @dirty: amount of dirty space
- */
-static void set_ltab(struct ubifs_info *c, int lnum, int free, int dirty)
-{
-	dbg_msg(3, "LEB %d free %d dirty %d to %d %d",
-		lnum, c->ltab[lnum - c->lpt_first].free,
-		c->ltab[lnum - c->lpt_first].dirty, free, dirty);
-	c->ltab[lnum - c->lpt_first].free = free;
-	c->ltab[lnum - c->lpt_first].dirty = dirty;
-}
-
-/**
- * calc_nnode_num - calculate nnode number.
- * @row: the row in the tree (root is zero)
- * @col: the column in the row (leftmost is zero)
- *
- * The nnode number is a number that uniquely identifies a nnode and can be used
- * easily to traverse the tree from the root to that nnode.
- *
- * This function calculates and returns the nnode number for the nnode at @row
- * and @col.
- */
-static int calc_nnode_num(int row, int col)
-{
-	int num, bits;
-
-	num = 1;
-	while (row--) {
-		bits = (col & (UBIFS_LPT_FANOUT - 1));
-		col >>= UBIFS_LPT_FANOUT_SHIFT;
-		num <<= UBIFS_LPT_FANOUT_SHIFT;
-		num |= bits;
-	}
-	return num;
-}
-
-/**
- * create_lpt - create LPT.
- * @c: UBIFS file-system description object
- *
- * This function returns %0 on success and a negative error code on failure.
- */
-int create_lpt(struct ubifs_info *c)
-{
-	int lnum, err = 0, i, j, cnt, len, alen, row;
-	int blnum, boffs, bsz, bcnt;
-	struct ubifs_pnode *pnode = NULL;
-	struct ubifs_nnode *nnode = NULL;
-	void *buf = NULL, *p;
-	int *lsave = NULL;
-
-	pnode = malloc(sizeof(struct ubifs_pnode));
-	nnode = malloc(sizeof(struct ubifs_nnode));
-	buf = malloc(c->leb_size);
-	lsave = malloc(sizeof(int) * c->lsave_cnt);
-	if (!pnode || !nnode || !buf || !lsave) {
-		err = -ENOMEM;
-		goto out;
-	}
-	memset(pnode, 0 , sizeof(struct ubifs_pnode));
-	memset(nnode, 0 , sizeof(struct ubifs_nnode));
-
-	c->lscan_lnum = c->main_first;
-
-	lnum = c->lpt_first;
-	p = buf;
-	len = 0;
-	/* Number of leaf nodes (pnodes) */
-	cnt = (c->main_lebs + UBIFS_LPT_FANOUT - 1) >> UBIFS_LPT_FANOUT_SHIFT;
-	//printf("pnode_cnt=%d\n",cnt);
-
-	/*
-	 * To calculate the internal node branches, we keep information about
-	 * the level below.
-	 */
-	blnum = lnum; /* LEB number of level below */
-	boffs = 0; /* Offset of level below */
-	bcnt = cnt; /* Number of nodes in level below */
-	bsz = c->pnode_sz; /* Size of nodes in level below */
-
-	/* Add pnodes */
-	for (i = 0; i < cnt; i++) {
-		if (len + c->pnode_sz > c->leb_size) {
-			alen = ALIGN(len, c->min_io_size);
-			set_ltab(c, lnum, c->leb_size - alen, alen - len);
-			memset(p, 0xff, alen - len);
-			err = write_leb(c, lnum++, alen, buf);
-			if (err)
-				goto out;
-			p = buf;
-			len = 0;
-		}
-		/* Fill in the pnode */
-		for (j = 0; j < UBIFS_LPT_FANOUT; j++) {
-			int k = (i << UBIFS_LPT_FANOUT_SHIFT) + j;
-
-			if (k < c->main_lebs)
-				pnode->lprops[j] = c->lpt[k];
-			else {
-				pnode->lprops[j].free = c->leb_size;
-				pnode->lprops[j].dirty = 0;
-				pnode->lprops[j].flags = 0;
-			}
-		}
-		pack_pnode(c, p, pnode);
-		p += c->pnode_sz;
-		len += c->pnode_sz;
-		/*
-		 * pnodes are simply numbered left to right starting at zero,
-		 * which means the pnode number can be used easily to traverse
-		 * down the tree to the corresponding pnode.
-		 */
-		pnode->num += 1;
-	}
-
-	row = c->lpt_hght - 1;
-	/* Add all nnodes, one level at a time */
-	while (1) {
-		/* Number of internal nodes (nnodes) at next level */
-		cnt = (cnt + UBIFS_LPT_FANOUT - 1) / UBIFS_LPT_FANOUT;
-		if (cnt == 0)
-			cnt = 1;
-		for (i = 0; i < cnt; i++) {
-			if (len + c->nnode_sz > c->leb_size) {
-				alen = ALIGN(len, c->min_io_size);
-				set_ltab(c, lnum, c->leb_size - alen,
-					    alen - len);
-				memset(p, 0xff, alen - len);
-				err = write_leb(c, lnum++, alen, buf);
-				if (err)
-					goto out;
-				p = buf;
-				len = 0;
-			}
-			/* The root is on row zero */
-			if (row == 0) {
-				c->lpt_lnum = lnum;
-				c->lpt_offs = len;
-			}
-			/* Set branches to the level below */
-			for (j = 0; j < UBIFS_LPT_FANOUT; j++) {
-				if (bcnt) {
-					if (boffs + bsz > c->leb_size) {
-						blnum += 1;
-						boffs = 0;
-					}
-					nnode->nbranch[j].lnum = blnum;
-					nnode->nbranch[j].offs = boffs;
-					boffs += bsz;
-					bcnt--;
-				} else {
-					nnode->nbranch[j].lnum = 0;
-					nnode->nbranch[j].offs = 0;
-				}
-			}
-			nnode->num = calc_nnode_num(row, i);
-			pack_nnode(c, p, nnode);
-			p += c->nnode_sz;
-			len += c->nnode_sz;
-		}
-		/* Row zero  is the top row */
-		if (row == 0)
-			break;
-		/* Update the information about the level below */
-		bcnt = cnt;
-		bsz = c->nnode_sz;
-		row -= 1;
-	}
-
-	if (c->big_lpt) {
-		/* Need to add LPT's save table */
-		if (len + c->lsave_sz > c->leb_size) {
-			alen = ALIGN(len, c->min_io_size);
-			set_ltab(c, lnum, c->leb_size - alen, alen - len);
-			memset(p, 0xff, alen - len);
-			err = write_leb(c, lnum++, alen, buf);
-			if (err)
-				goto out;
-			p = buf;
-			len = 0;
-		}
-
-		c->lsave_lnum = lnum;
-		c->lsave_offs = len;
-
-		for (i = 0; i < c->lsave_cnt; i++)
-			lsave[i] = c->main_first + i;
-
-		pack_lsave(c, p, lsave);
-		p += c->lsave_sz;
-		len += c->lsave_sz;
-	}
-
-	/* Need to add LPT's own LEB properties table */
-	if (len + c->ltab_sz > c->leb_size) {
-		alen = ALIGN(len, c->min_io_size);
-		set_ltab(c, lnum, c->leb_size - alen, alen - len);
-		memset(p, 0xff, alen - len);
-		err = write_leb(c, lnum++, alen, buf);
-		if (err)
-			goto out;
-		p = buf;
-		len = 0;
-	}
-
-	c->ltab_lnum = lnum;
-	c->ltab_offs = len;
-
-	/* Update ltab before packing it */
-	len += c->ltab_sz;
-	alen = ALIGN(len, c->min_io_size);
-	set_ltab(c, lnum, c->leb_size - alen, alen - len);
-
-	pack_ltab(c, p, c->ltab);
-	p += c->ltab_sz;
-
-	/* Write remaining buffer */
-	memset(p, 0xff, alen - len);
-	err = write_leb(c, lnum, alen, buf);
-	if (err)
-		goto out;
-
-	c->nhead_lnum = lnum;
-	c->nhead_offs = ALIGN(len, c->min_io_size);
-
-	dbg_msg(1, "lpt_sz:         %lld", c->lpt_sz);
-	dbg_msg(1, "space_bits:     %d", c->space_bits);
-	dbg_msg(1, "lpt_lnum_bits:  %d", c->lpt_lnum_bits);
-	dbg_msg(1, "lpt_offs_bits:  %d", c->lpt_offs_bits);
-	dbg_msg(1, "lpt_spc_bits:   %d", c->lpt_spc_bits);
-	dbg_msg(1, "pcnt_bits:      %d", c->pcnt_bits);
-	dbg_msg(1, "lnum_bits:      %d", c->lnum_bits);
-	dbg_msg(1, "pnode_sz:       %d", c->pnode_sz);
-	dbg_msg(1, "nnode_sz:       %d", c->nnode_sz);
-	dbg_msg(1, "ltab_sz:        %d", c->ltab_sz);
-	dbg_msg(1, "lsave_sz:       %d", c->lsave_sz);
-	dbg_msg(1, "lsave_cnt:      %d", c->lsave_cnt);
-	dbg_msg(1, "lpt_hght:       %d", c->lpt_hght);
-	dbg_msg(1, "big_lpt:        %d", c->big_lpt);
-	dbg_msg(1, "LPT root is at  %d:%d", c->lpt_lnum, c->lpt_offs);
-	dbg_msg(1, "LPT head is at  %d:%d", c->nhead_lnum, c->nhead_offs);
-	dbg_msg(1, "LPT ltab is at  %d:%d", c->ltab_lnum, c->ltab_offs);
-	if (c->big_lpt)
-		dbg_msg(1, "LPT lsave is at %d:%d",
-		        c->lsave_lnum, c->lsave_offs);
-out:
-	free(lsave);
-	free(buf);
-	free(nnode);
-	free(pnode);
-	return err;
-}
diff --git a/ubifs-utils/mkfs.ubifs/lpt.h b/ubifs-utils/mkfs.ubifs/lpt.h
deleted file mode 100644
index 4cde59d..0000000
--- a/ubifs-utils/mkfs.ubifs/lpt.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * Copyright (C) 2008 Nokia Corporation.
- * Copyright (C) 2008 University of Szeged, Hungary
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Artem Bityutskiy
- *          Adrian Hunter
- */
-
-#ifndef __UBIFS_LPT_H__
-#define __UBIFS_LPT_H__
-
-int calc_dflt_lpt_geom(struct ubifs_info *c, int *main_lebs, int *big_lpt);
-int create_lpt(struct ubifs_info *c);
-
-#endif
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/mkfs.ubifs/ubifs.h
deleted file mode 100644
index 2f080a8..0000000
--- a/ubifs-utils/mkfs.ubifs/ubifs.h
+++ /dev/null
@@ -1,450 +0,0 @@
-/*
- * This file is part of UBIFS.
- *
- * Copyright (C) 2008 Nokia Corporation.
- * Copyright (C) 2008 University of Szeged, Hungary
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc., 51
- * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
- *
- * Authors: Artem Bityutskiy
- *          Adrian Hunter
- *          Zoltan Sogor
- */
-
-#ifndef __UBIFS_H__
-#define __UBIFS_H__
-
-/* Maximum logical eraseblock size in bytes */
-#define UBIFS_MAX_LEB_SZ (2*1024*1024)
-
-/* Minimum amount of data UBIFS writes to the flash */
-#define MIN_WRITE_SZ (UBIFS_DATA_NODE_SZ + 8)
-
-/* Largest key size supported in this implementation */
-#define CUR_MAX_KEY_LEN UBIFS_SK_LEN
-
-/*
- * There is no notion of truncation key because truncation nodes do not exist
- * in TNC. However, when replaying, it is handy to introduce fake "truncation"
- * keys for truncation nodes because the code becomes simpler. So we define
- * %UBIFS_TRUN_KEY type.
- */
-#define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT
-
-/*
- * How much a directory entry/extended attribute entry adds to the parent/host
- * inode.
- */
-#define CALC_DENT_SIZE(name_len) ALIGN(UBIFS_DENT_NODE_SZ + (name_len) + 1, 8)
-
-/* How much an extended attribute adds to the host inode */
-#define CALC_XATTR_BYTES(data_len) ALIGN(UBIFS_INO_NODE_SZ + (data_len) + 1, 8)
-
-/* The below union makes it easier to deal with keys */
-union ubifs_key
-{
-	uint8_t u8[CUR_MAX_KEY_LEN];
-	uint32_t u32[CUR_MAX_KEY_LEN/4];
-	uint64_t u64[CUR_MAX_KEY_LEN/8];
-	__le32 j32[CUR_MAX_KEY_LEN/4];
-};
-
-/*
- * LEB properties flags.
- *
- * LPROPS_UNCAT: not categorized
- * LPROPS_DIRTY: dirty > 0, not index
- * LPROPS_DIRTY_IDX: dirty + free > UBIFS_CH_SZ and index
- * LPROPS_FREE: free > 0, not empty, not index
- * LPROPS_HEAP_CNT: number of heaps used for storing categorized LEBs
- * LPROPS_EMPTY: LEB is empty, not taken
- * LPROPS_FREEABLE: free + dirty == leb_size, not index, not taken
- * LPROPS_FRDI_IDX: free + dirty == leb_size and index, may be taken
- * LPROPS_CAT_MASK: mask for the LEB categories above
- * LPROPS_TAKEN: LEB was taken (this flag is not saved on the media)
- * LPROPS_INDEX: LEB contains indexing nodes (this flag also exists on flash)
- */
-enum {
-	LPROPS_UNCAT     =  0,
-	LPROPS_DIRTY     =  1,
-	LPROPS_DIRTY_IDX =  2,
-	LPROPS_FREE      =  3,
-	LPROPS_HEAP_CNT  =  3,
-	LPROPS_EMPTY     =  4,
-	LPROPS_FREEABLE  =  5,
-	LPROPS_FRDI_IDX  =  6,
-	LPROPS_CAT_MASK  = 15,
-	LPROPS_TAKEN     = 16,
-	LPROPS_INDEX     = 32,
-};
-
-/**
- * struct ubifs_lprops - logical eraseblock properties.
- * @free: amount of free space in bytes
- * @dirty: amount of dirty space in bytes
- * @flags: LEB properties flags (see above)
- */
-struct ubifs_lprops
-{
-	int free;
-	int dirty;
-	int flags;
-};
-
-/**
- * struct ubifs_lpt_lprops - LPT logical eraseblock properties.
- * @free: amount of free space in bytes
- * @dirty: amount of dirty space in bytes
- */
-struct ubifs_lpt_lprops
-{
-	int free;
-	int dirty;
-};
-
-struct ubifs_nnode;
-
-/**
- * struct ubifs_cnode - LEB Properties Tree common node.
- * @parent: parent nnode
- * @cnext: next cnode to commit
- * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
- * @iip: index in parent
- * @level: level in the tree (zero for pnodes, greater than zero for nnodes)
- * @num: node number
- */
-struct ubifs_cnode
-{
-	struct ubifs_nnode *parent;
-	struct ubifs_cnode *cnext;
-	unsigned long flags;
-	int iip;
-	int level;
-	int num;
-};
-
-/**
- * struct ubifs_pnode - LEB Properties Tree leaf node.
- * @parent: parent nnode
- * @cnext: next cnode to commit
- * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
- * @iip: index in parent
- * @level: level in the tree (always zero for pnodes)
- * @num: node number
- * @lprops: LEB properties array
- */
-struct ubifs_pnode
-{
-	struct ubifs_nnode *parent;
-	struct ubifs_cnode *cnext;
-	unsigned long flags;
-	int iip;
-	int level;
-	int num;
-	struct ubifs_lprops lprops[UBIFS_LPT_FANOUT];
-};
-
-/**
- * struct ubifs_nbranch - LEB Properties Tree internal node branch.
- * @lnum: LEB number of child
- * @offs: offset of child
- * @nnode: nnode child
- * @pnode: pnode child
- * @cnode: cnode child
- */
-struct ubifs_nbranch
-{
-	int lnum;
-	int offs;
-	union
-	{
-		struct ubifs_nnode *nnode;
-		struct ubifs_pnode *pnode;
-		struct ubifs_cnode *cnode;
-	};
-};
-
-/**
- * struct ubifs_nnode - LEB Properties Tree internal node.
- * @parent: parent nnode
- * @cnext: next cnode to commit
- * @flags: flags (%DIRTY_LPT_NODE or %OBSOLETE_LPT_NODE)
- * @iip: index in parent
- * @level: level in the tree (always greater than zero for nnodes)
- * @num: node number
- * @nbranch: branches to child nodes
- */
-struct ubifs_nnode
-{
-	struct ubifs_nnode *parent;
-	struct ubifs_cnode *cnext;
-	unsigned long flags;
-	int iip;
-	int level;
-	int num;
-	struct ubifs_nbranch nbranch[UBIFS_LPT_FANOUT];
-};
-
-/**
- * struct ubifs_lp_stats - statistics of eraseblocks in the main area.
- * @empty_lebs: number of empty LEBs
- * @taken_empty_lebs: number of taken LEBs
- * @idx_lebs: number of indexing LEBs
- * @total_free: total free space in bytes
- * @total_dirty: total dirty space in bytes
- * @total_used: total used space in bytes (includes only data LEBs)
- * @total_dead: total dead space in bytes (includes only data LEBs)
- * @total_dark: total dark space in bytes (includes only data LEBs)
- */
-struct ubifs_lp_stats {
-	int empty_lebs;
-	int taken_empty_lebs;
-	int idx_lebs;
-	long long total_free;
-	long long total_dirty;
-	long long total_used;
-	long long total_dead;
-	long long total_dark;
-};
-
-/**
- * struct ubifs_zbranch - key/coordinate/length branch stored in znodes.
- * @key: key
- * @znode: znode address in memory
- * @lnum: LEB number of the indexing node
- * @offs: offset of the indexing node within @lnum
- * @len: target node length
- */
-struct ubifs_zbranch
-{
-	union ubifs_key key;
-	struct ubifs_znode *znode;
-	int lnum;
-	int offs;
-	int len;
-};
-
-/**
- * struct ubifs_znode - in-memory representation of an indexing node.
- * @parent: parent znode or NULL if it is the root
- * @cnext: next znode to commit
- * @flags: flags
- * @time: last access time (seconds)
- * @level: level of the entry in the TNC tree
- * @child_cnt: count of child znodes
- * @iip: index in parent's zbranch array
- * @alt: lower bound of key range has altered i.e. child inserted at slot 0
- * @zbranch: array of znode branches (@c->fanout elements)
- */
-struct ubifs_znode
-{
-	struct ubifs_znode *parent;
-	struct ubifs_znode *cnext;
-	unsigned long flags;
-	unsigned long time;
-	int level;
-	int child_cnt;
-	int iip;
-	int alt;
-#ifdef CONFIG_UBIFS_FS_DEBUG
-	int lnum, offs, len;
-#endif
-	struct ubifs_zbranch zbranch[];
-};
-
-/**
- * struct ubifs_info - UBIFS file-system description data structure
- * (per-superblock).
- *
- * @highest_inum: highest used inode number
- * @max_sqnum: current global sequence number
- *
- * @jhead_cnt: count of journal heads
- * @max_bud_bytes: maximum number of bytes allowed in buds
- *
- * @zroot: zbranch which points to the root index node and znode
- * @ihead_lnum: LEB number of index head
- * @ihead_offs: offset of index head
- *
- * @log_lebs: number of logical eraseblocks in the log
- * @lpt_lebs: number of LEBs used for lprops table
- * @lpt_first: first LEB of the lprops table area
- * @lpt_last: last LEB of the lprops table area
- * @main_lebs: count of LEBs in the main area
- * @main_first: first LEB of the main area
- * @default_compr: default compression type
- * @favor_lzo: favor LZO compression method
- * @favor_percent: lzo vs. zlib threshold used in case favor LZO
- *
- * @key_hash_type: type of the key hash
- * @key_hash: direntry key hash function
- * @key_fmt: key format
- * @key_len: key length
- * @fanout: fanout of the index tree (number of links per indexing node)
- *
- * @min_io_size: minimal input/output unit size
- * @leb_size: logical eraseblock size in bytes
- * @leb_cnt: count of logical eraseblocks
- * @max_leb_cnt: maximum count of logical eraseblocks
- *
- * @old_idx_sz: size of index on flash
- * @lst: lprops statistics
- *
- * @dead_wm: LEB dead space watermark
- * @dark_wm: LEB dark space watermark
- *
- * @di: UBI device information
- * @vi: UBI volume information
- *
- * @gc_lnum: LEB number used for garbage collection
- * @rp_size: reserved pool size
- *
- * @space_bits: number of bits needed to record free or dirty space
- * @lpt_lnum_bits: number of bits needed to record a LEB number in the LPT
- * @lpt_offs_bits: number of bits needed to record an offset in the LPT
- * @lpt_spc_bits: number of bits needed to space in the LPT
- * @pcnt_bits: number of bits needed to record pnode or nnode number
- * @lnum_bits: number of bits needed to record LEB number
- * @nnode_sz: size of on-flash nnode
- * @pnode_sz: size of on-flash pnode
- * @ltab_sz: size of on-flash LPT lprops table
- * @lsave_sz: size of on-flash LPT save table
- * @pnode_cnt: number of pnodes
- * @nnode_cnt: number of nnodes
- * @lpt_hght: height of the LPT
- *
- * @lpt_lnum: LEB number of the root nnode of the LPT
- * @lpt_offs: offset of the root nnode of the LPT
- * @nhead_lnum: LEB number of LPT head
- * @nhead_offs: offset of LPT head
- * @big_lpt: flag that LPT is too big to write whole during commit
- * @space_fixup: flag indicating that free space in LEBs needs to be cleaned up
- * @lpt_sz: LPT size
- *
- * @ltab_lnum: LEB number of LPT's own lprops table
- * @ltab_offs: offset of LPT's own lprops table
- * @lpt: lprops table
- * @ltab: LPT's own lprops table
- * @lsave_cnt: number of LEB numbers in LPT's save table
- * @lsave_lnum: LEB number of LPT's save table
- * @lsave_offs: offset of LPT's save table
- * @lsave: LPT's save table
- * @lscan_lnum: LEB number of last LPT scan
- */
-struct ubifs_info
-{
-	ino_t highest_inum;
-	unsigned long long max_sqnum;
-
-	int jhead_cnt;
-	long long max_bud_bytes;
-
-	struct ubifs_zbranch zroot;
-	int ihead_lnum;
-	int ihead_offs;
-
-	int log_lebs;
-	int lpt_lebs;
-	int lpt_first;
-	int lpt_last;
-	int orph_lebs;
-	int main_lebs;
-	int main_first;
-	int default_compr;
-	int favor_lzo;
-	int favor_percent;
-
-	uint8_t key_hash_type;
-	uint32_t (*key_hash)(const char *str, int len);
-	int key_fmt;
-	int key_len;
-	int fanout;
-
-	int min_io_size;
-	int leb_size;
-	int leb_cnt;
-	int max_leb_cnt;
-
-	unsigned long long old_idx_sz;
-	struct ubifs_lp_stats lst;
-
-	int dead_wm;
-	int dark_wm;
-
-	struct ubi_dev_info di;
-	struct ubi_vol_info vi;
-
-	int gc_lnum;
-	long long rp_size;
-
-	int space_bits;
-	int lpt_lnum_bits;
-	int lpt_offs_bits;
-	int lpt_spc_bits;
-	int pcnt_bits;
-	int lnum_bits;
-	int nnode_sz;
-	int pnode_sz;
-	int ltab_sz;
-	int lsave_sz;
-	int pnode_cnt;
-	int nnode_cnt;
-	int lpt_hght;
-
-	int lpt_lnum;
-	int lpt_offs;
-	int nhead_lnum;
-	int nhead_offs;
-	int big_lpt;
-	int space_fixup;
-	long long lpt_sz;
-
-	int ltab_lnum;
-	int ltab_offs;
-	struct ubifs_lprops *lpt;
-	struct ubifs_lpt_lprops *ltab;
-	int lsave_cnt;
-	int lsave_lnum;
-	int lsave_offs;
-	int *lsave;
-	int lscan_lnum;
-
-};
-
-/**
- * ubifs_idx_node_sz - return index node size.
- * @c: the UBIFS file-system description object
- * @child_cnt: number of children of this index node
- */
-static inline int ubifs_idx_node_sz(const struct ubifs_info *c, int child_cnt)
-{
-	return UBIFS_IDX_NODE_SZ + (UBIFS_BRANCH_SZ + c->key_len) * child_cnt;
-}
-
-/**
- * ubifs_idx_branch - return pointer to an index branch.
- * @c: the UBIFS file-system description object
- * @idx: index node
- * @bnum: branch number
- */
-static inline
-struct ubifs_branch *ubifs_idx_branch(const struct ubifs_info *c,
-				      const struct ubifs_idx_node *idx,
-				      int bnum)
-{
-	return (struct ubifs_branch *)((void *)idx->branches +
-				       (UBIFS_BRANCH_SZ + c->key_len) * bnum);
-}
-
-#endif /* __UBIFS_H__ */
diff --git a/ubifs-utils/mkfs.ubifs/ubifs_common.h b/ubifs-utils/mkfs.ubifs/ubifs_common.h
deleted file mode 100644
index 958c20a..0000000
--- a/ubifs-utils/mkfs.ubifs/ubifs_common.h
+++ /dev/null
@@ -1,50 +0,0 @@
-#ifndef __UBIFS_COMMON_H__
-#define __UBIFS_COMMON_H__
-
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <limits.h>
-#include <string.h>
-#include <stdint.h>
-#include <endian.h>
-#include <byteswap.h>
-#include <linux/types.h>
-#include <linux/fs.h>
-
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
-#include <dirent.h>
-#include <errno.h>
-#include <libgen.h>
-#include <ctype.h>
-#include <uuid/uuid.h>
-#include <sys/file.h>
-
-#include <mtd/ubifs-media.h>
-
-#include "libubi.h"
-#include "defs.h"
-
-extern int verbose;
-extern int debug_level;
-
-#define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
-	printf("ubifs: %s: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
-} while(0)
-
-#define err_msg(fmt, ...) ({                                \
-	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__); \
-	-1;                                                 \
-})
-
-#define sys_err_msg(fmt, ...) ({                                         \
-	int err_ = errno;                                                \
-	fprintf(stderr, "Error: " fmt "\n", ##__VA_ARGS__);              \
-	fprintf(stderr, "       %s (error %d)\n", strerror(err_), err_); \
-	-1;                                                              \
-})
-#endif
-- 
1.8.4.2
