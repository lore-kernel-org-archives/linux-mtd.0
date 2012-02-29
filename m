Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2iHy-0001nb-DO
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 12:05:47 +0000
Received: by yhjj52 with SMTP id j52so1254588yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Feb 2012 04:05:45 -0800 (PST)
Message-ID: <1330517290.3545.107.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] jffs2: logging message neatening
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
Date: Wed, 29 Feb 2012 14:08:10 +0200
In-Reply-To: <cover.1329349881.git.joe@perches.com>
References: <cover.1329349881.git.joe@perches.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DUeS6NuylrFk6p5kRC1e"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DUeS6NuylrFk6p5kRC1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-15 at 15:56 -0800, Joe Perches wrote:
> Joe Perches (4):
>   jffs2: Convert most D1/D2 macros to jffs2_dbg
>   jffs2: Convert printks to pr_<level>
>   jffs2: Use pr_fmt and remove jffs: from formats
>   jffs2: Standardize JFFS_<LEVEL> uses

Thanks for the work, appreciated. But your patch introduces new sparse
and smatch warnings, which did not exist before your patch:

Successfully built configuration "l2_mxs_defconfig,arm,arm-unknown-linux-gn=
ueabi-", results:

--- before_patching.log
+++ after_patching.log=20
@@ @@
+fs/jffs2/file.c:330:2: warning: signed and unsigned type in conditional ex=
pression [-Wsign-compare]
@@ @@
-fs/jffs2/read.c:154 jffs2_read_dnode(129) warn: possible memory leak of 'd=
ecomprbuf' [smatch]
-fs/jffs2/read.c:154 jffs2_read_dnode(129) warn: possible memory leak of 'r=
eadbuf' [smatch]
+fs/jffs2/read.c:154 jffs2_read_dnode(131) warn: possible memory leak of 'd=
ecomprbuf' [smatch]
+fs/jffs2/read.c:154 jffs2_read_dnode(131) warn: possible memory leak of 'r=
eadbuf' [smatch]
@@ @@
-fs/jffs2/scan.c:108:54: warning: suggest braces around empty body in an 'i=
f' statement [-Wempty-body]
@@ @@
+fs/jffs2/super.c:377:1: error: directive in argument list [sparse]
+fs/jffs2/super.c:379:1: error: directive in argument list [sparse]
+fs/jffs2/super.c:380:1: error: directive in argument list [sparse]
+fs/jffs2/super.c:382:1: error: directive in argument list [sparse]

Would you please take a look? Ideally patches should eliminate warnings,
not introduce new ones.

Also, your patch does not apply cleanly to my l2-mtd tree - and this is
the tree which is currently used for merging MTD and JFFS2 stuff
upstream, and it is in linux-next as well. Would you send patches
against the l2 tree?

Also, there are several checkpatch.pl complaints, please, take a look:

---------------------------------------------------------------------------=
-----

checkpatch.pl has some complaints:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH 2/4] jffs2: Convert printks to pr_<=
level>"

WARNING:LONG_LINE: line over 80 characters
#893: FILE: fs/jffs2/nodemgmt.c:269:
+                               list_empty(&c->erase_pending_list) ? "yes" =
: "no");

WARNING:LONG_LINE: line over 80 characters
#1094: FILE: fs/jffs2/scan.c:31:
+                       pr_notice("Further such events for this erase block=
 will not be printed\n"); \

total: 0 errors, 2 warnings, 1523 lines checked

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH 3/4] jffs2: Use pr_fmt and remove j=
ffs: from formats"

WARNING:LONG_LINE: line over 80 characters
#102: FILE: fs/jffs2/build.c:312:
+       dbg_fsbuild("trigger levels (size %d KiB, block size %d KiB, %d blo=
cks)\n",

total: 0 errors, 1 warnings, 432 lines checked

---------------------------------------------------------------------------=
-----

checkpatch.pl results for the entire squashed patch-set

WARNING:LONG_LINE: line over 80 characters
#3480: FILE: fs/jffs2/nodemgmt.c:269:
+                               list_empty(&c->erase_pending_list) ? "yes" =
: "no");

WARNING:LONG_LINE: line over 80 characters
#3681: FILE: fs/jffs2/scan.c:31:
+                       pr_notice("Further such events for this erase block=
 will not be printed\n"); \

WARNING:LONG_LINE: line over 80 characters
#4448: FILE: fs/jffs2/build.c:312:
+       dbg_fsbuild("trigger levels (size %d KiB, block size %d KiB, %d blo=
cks)\n",

total: 0 errors, 3 warnings, 4324 lines checked

---------------------------------------------------------------------------=
-----

--=20
Best Regards,
Artem Bityutskiy

--=-DUeS6NuylrFk6p5kRC1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPThUqAAoJECmIfjd9wqK0MwUP/2Zqg92PUXG78NU5Fl2/To2z
T1stQcJHjRCjt7IELjeZvbl4xWUpW+ayqEz4cx710rFbIKpQ2pmEdzJg4kjIsh/r
qKstZ8zKeq5rmydJkF4WHva2t5FKtHSsMR5b0sBGyZlT7+9x77FTn1IVFKtXgyfq
9gxWN85roV8lSj/dK5sZAtLK/xhMCHJca6xwriRfgfLD1c1lDJwK8M+ek205KQ8o
HjvmEuygTmhzE1VglqeZaNQdrV9fsKwRXNYE3Jot184AdOcYEW+PsZR3enz2YOIc
/1RD8QGzRNRP2fHTeXyd+O4AsOXcGHeGHtQBgcqKZvZq2pLIiEJ1w3vhyd0m2qa7
r4EKLdahd1aYxWEQqjKFL05sXGtW3ZbPArghjQQ83T/9vZJwAaHi/AUywtthX+2w
Z+vhPEBzPneTYwIYBnaBgb99Wu6xzcRTZaHnc5OwByAb6YZqn23omqNZWE6HvXfR
qOH8Zl4rHrLQN8MS1TYjSV1qxHrQuNvJHv2WEjLPwE32oAn/4LK6LpFYUjuwlesC
dyLZg1/7lGvkngR76Qy/Xkhzc4sXcKWZ5PfGAuRKRHkhj0WjuL+P84s8SAICVT5I
aC/uy2suFG3xjdeMnMxzLTFc5D1JtKH78MTydaOhzLWTtxtiI0hJGvAAQNevLEax
Afz+H1HbF2ERFkka0+I+
=lXR9
-----END PGP SIGNATURE-----

--=-DUeS6NuylrFk6p5kRC1e--
