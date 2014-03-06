Received: from blu0-omc1-s8.blu0.hotmail.com ([65.55.116.19])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLQWD-0003TR-RA
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 05:06:54 +0000
Message-ID: <BLU0-SMTP222D7E8438812853BF4B0AAD880@phx.gbl>
Date: Thu, 6 Mar 2014 13:06:33 +0800
From: ayaka <lxr1234@hotmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: about porting ubiblock to make squashfs work on it
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,
   I will do a overlayfs on nand flash, about overlayfs, I will ask
linux-fsdevel for help, now I want to talking about ubiblcok.
As I know that the squashfs is not suitable for raw nand flash, so I
need the ubiblock to manage the nand flash then I will create a squashfs
on it as the lower of overlayfs, about the upper, I will try, ubifs,
jffs2 and logfs. The real work I do is writing a report about
achieving a restoring function.
   The kernel I am going to use maybe the 3.10 version, as my platform
 is samsung s3c6410, I have made that version worked using the board file.
P.S if there is any information about overlayfs and porting overlayfs,
don't mind to offer it to me, I will thank you.


thank you

ayaka
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJTGAJZAAoJEPb4VsMIzTziJNsH/0+ymNd9oaP2qbn+nHS6Utr4
Zzhhknj71nGxV5GM9MVbdKDT48hTgE8dWebsuWEKqnbjKNTdkMk0x3ndAroLefk/
Jg1OLVIMzCTSenrztbCFr3t0qA4TDMureLE+MHgSNml3FZurKcMWZT6ODO65ZVv+
qoYvJJJlDnn2IXClz3uNjMJcXdV4gjegJtJboipyQil2U05H0VHo2wqIALa2pFqh
7WIORp54WhqYN3GIe6wfXBVwDmipKBXh2nNM7ab/qOKWAoNRzt83BbP/7GGs+NuR
BP4RyT/5O+I/wOB0NdMHXlnQ2fVgvsP766AvjK/qgLpbowqyY8JCT8+Ta2lwOJQ=
=yHXg
-----END PGP SIGNATURE-----
