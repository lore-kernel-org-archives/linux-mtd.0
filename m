From: chaffmanus@yahoo.com (tony Tong)
Date: Sun, 9 Feb 2003 04:52:45 -0800 (PST)
Subject: grub-doc patch problem
In-Reply-To: <200302081157.05636.mark@lakeshoremicro.com>
Message-ID: <20030209125245.17383.qmail@web20801.mail.yahoo.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--- Mark Meade <mark@lakeshoremicro.com> wrote:
> Use the grub-2003-01-08-doc.patch with the latest
> GRUB cvs.  You will get 
> errors when patching ChangeLog, but those don't
> matter. 
Today I have used grub-2003-01-08-doc.patch to patch
the GRUB cvs version . But I get more than one errors
,the following is selected from  my patch output
result :
1 out of 1 hunk FAILED -- saving rejects to file
./AUTHORS.rej
3 out of 3 hunks FAILED -- saving rejects to file
./ChangeLog.rej
1 out of 1 hunk FAILED -- saving rejects to file
./configure.in.rej
2 out of 2 hunks FAILED -- saving rejects to file
./stage1/Makefile.am.rej
1 out of 1 hunk FAILED -- saving rejects to file
./stage2/Makefile.am.rej
2 out of 2 hunks FAILED -- saving rejects to file
./stage2/asm.S.rej
......................
.......................

> I tested this combination today, and the patch
> worked, as well as the 
> aclocal/automake/autoconf, configure, and make
> steps.

Because patch cannot pass ,these steps are untested  

> Make sure you use automake version 1.5 and autoconf
> version 2.53.  On some 
> systems, this can be specified by exporting
> WANT_AUTOMAKE_1_5=1 and 
> WANT_AUTOCONF_2_5=1. 

I am sure I have the proper version of automake and
autoconf.
"automake --version" and "rpm -q automake" both tell
me I have the right version. The same as autoconf.
And I also do "export WANT_AUTOMAKE_1_5=1" and "export
WANT_AUTOCONF_2_5=1".

Even after these efforts  ,I still cannot make the
combination of 03-01-08.patch and GRUB cvs work.
what important  did  I miss ?

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
