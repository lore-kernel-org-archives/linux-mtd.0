From: chaffmanus@yahoo.com (tony Tong)
Date: Fri, 7 Feb 2003 01:11:59 -0800 (PST)
Subject: grub-doc patch problem
In-Reply-To: <20030207090602.24812.16377.Mailman@localhost.localdomain>
Message-ID: <20030207091159.93150.qmail@web20807.mail.yahoo.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

sorry , because the previous two letters is unreadable
,I have to change a emailaddress to resend it.

I want to use grub to boot  from my DOC2000 (32M). 
According to " GRUB on DoC Millennium/2000 -
Instructions (Revised) "
http://lists.infradead.org/pipermail/linux-mtd/2002-October/006166.html
,
I use grub-0.92 and the patch file is
grub-2002-10-08-doc.patch
but everytime I use"patch -p0 -i
grub-2002-10-08-doc.patch" ,I will get the following
"
patching file ./AUTHORS
Hunk #1 FAILED at 42.
1 out of 1 hunk FAILED -- saving rejects to file
./AUTHORS.rej
patching file ./ChangeLog
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 88.
2 out of 2 hunks FAILED -- saving rejects to file
./ChangeLog.rej
patching file ./README_DiskOnChip
patching file ./configure.in
Hunk #1 succeeded at 228 (offset -13 lines).
patching file ./stage1/Makefile.am
patching file ./stage1/doc_stage1.S
patching file ./stage1/doc_stage1.h
patching file ./stage1/makecsum.c
patching file ./stage2/Makefile.am
Hunk #1 FAILED at 83.
1 out of 1 hunk FAILED -- saving rejects to file
./stage2/Makefile.am.rej
"

The AUTHORS and CHANGLOG problems has been pointed in
the instrution ,but the last one hasnot been.
why this happened?
If I ignore this error , continue "aclocal && automake
--add-missing && autoconf"
I will get two warnings:
configure.in:17: warning: do not use m4_patsubst: use
patsubst or m4_bpatsubst
configure.in:681: warning: do not use m4_regexp: use
regexp or m4_bregexp

Then 
"./configure --enable-diskonchip-2000
-enable-diskonchip-ctrlbypass -enable-ext2fs " and 
"make" ,
it will stop ,and dump the following error infomation:

"
stage2.c: In function `cmain':
stage2.c:1019: `current_term' undeclared (first use in
this function)
stage2.c:1019: (Each undeclared identifier is reported
only once
stage2.c:1019: for each function it appears in.)
stage2.c:1019: `TERM_DUMB' undeclared (first use in
this function)
make[2]: *** [pre_stage2_exec-stage2.o] Error 1
make[1]: *** [all-recursive] Error 1
make: *** [all] Error 2
"


what is wrong with my steps? 
Anything I missed?
Hope some kind guys could  give me a hand and thanks
in advandce
 

BTW:
I have tried grub-2003-01-08-doc.patch ,but I got the
same result 
My linux is redhat7.1 , kernel is 2.4.2 , 
I have used rpm package to update automake to 1.5 and
autoconf to 2.53







 

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
