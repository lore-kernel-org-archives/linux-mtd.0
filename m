From: gary@mlbassoc.com (Gary Thomas)
Date: 05 Feb 2003 06:58:14 -0700
Subject: Patch - remove unused CDL
Message-ID: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-ABQaa9Z0oH6xGJKIKQ+8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

David,

Jonathan has pointed out at some of the CDL used for JFFS2
is obsolete (not used by the package).  The attached patch
will take care of it.

Two questions:
 * How do patches get reviewed, applied, etc?
 * What about my change to the RedBoot partition scanning?

Thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------

--=-ABQaa9Z0oH6xGJKIKQ+8
Content-Disposition: attachment; filename=diffs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=diffs; charset=ISO-8859-1

Index: fs/jffs2/ecos/cdl/jffs2.cdl
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/fs/jffs2/ecos/cdl/jffs2.cdl,v
retrieving revision 1.3
diff -u -5 -p -r1.3 jffs2.cdl
--- fs/jffs2/ecos/cdl/jffs2.cdl	21 Jan 2003 18:12:15 -0000	1.3
+++ fs/jffs2/ecos/cdl/jffs2.cdl	5 Feb 2003 13:53:40 -0000
@@ -97,35 +97,10 @@ cdl_package CYGPKG_FS_JFFS2 {
 	    This option modifies the set of compiler flags for
             building the JFFS2 package. These flags are removed from
             the set of global flags if present."
         }
=20
-    cdl_option CYGNUM_FS_JFFS2_SECTOR_SIZE {
-       display         "Physical sector size of the flash devices"
-       flavor          data
-       default_value   { 0x10000 }
-       description     "64 KiB for synthetic target."
-    }
-
-    cdl_option CYGNUM_FS_JFFS2_FLASH_SIZE {
-       display         "Amount of flash committed to JFFS2"
-       flavor          data
-       default_value   { 0x100000 }
-       description     "1 MiB (giving 16 sectors, realistic minimum!)"
-    }
-
-    cdl_option CYGNUM_FS_JFFS2_BASE_ADDRESS {
-       display         "Base of the JFFS2 filesystem in memory"
-       flavor          data
-       default_value   { 0x40000000 }
-       description     "Set this value to the base address of the JFFS2
-               filesystem in memory. By coincidence, this matches the
-               address at which the synthetic target will mmap its
-               backing store. Perhaps we should make it work through
-               something other than coincidence?"
-    }
-
     # ----------------------------------------------------------------
     # Tests
=20
     cdl_option CYGPKG_FS_JFFS2_TESTS {
 	display "JFFS2 FS tests"

--=-ABQaa9Z0oH6xGJKIKQ+8--
