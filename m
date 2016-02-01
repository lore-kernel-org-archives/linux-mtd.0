Message-ID: <1454336486.133285.293.camel@infradead.org>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
From: David Woodhouse <dwmw2@infradead.org>
To: deng.chao1@zte.com.cn
Cc: jiang.xuexin@zte.com.cn, linux-mtd@lists.infradead.org,
 liu.song11@zte.com.cn, cui.yunfeng@zte.com.cn
Date: Mon, 01 Feb 2016 14:21:26 +0000
In-Reply-To: <OF6F83B391.3EABE3CC-ON48257EEA.000ABC6F-48257EEA.0012425C@zte.com.cn>
References: <OF2CCB8417.29770A56-ON48257EE5.0004DBEE-48257EE5.0004E5CC@LocalDomain>
 <OF6F83B391.3EABE3CC-ON48257EEA.000ABC6F-48257EEA.0012425C@zte.com.cn>
Content-Type: multipart/signed; micalg="sha-1";
 protocol="application/x-pkcs7-signature";
 boundary="=-hJxbk12uQX06kTeNNTXz"
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hJxbk12uQX06kTeNNTXz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-10-26 at 11:19 +0800, deng.chao1@zte.com.cn wrote:
> I have recently found a bug in this patch.
> When we mount jffs2 file system, call function
> jffs2_build_filesystem->jffs2_build_inode_pass1.
...
> In this function, when jffs2_get_ino_cache can't find child_ic for
> child fd and return NULL, the processing loop will continue and leave
> this child's fd->ic remains as fd->raw because they are union in
> struct jffs2_full_dirent:

> Then following code in jffs2_build_filesystem:
> static int jffs2_build_filesystem(struct jffs2_sb_info *c)
> {
> 	...
> 	/* Finally, we can scan again and free the dirent structs */
> 	for_each_inode(i, c, ic) {
> 		while(ic->scan_dents) {
> 			fd =3D ic->scan_dents;
> 			ic->scan_dents =3D fd->next;
> 			/* We do use the pino_nlink field to count nlink of
> 			* directories during fs build, so set it to the
> 			* parent ino# now. Now that there's hopefully only
> 			* one. */
> 			if (fd->type =3D=3D DT_DIR) {
> 				if (dir_hardlinks && fd->ic->pino_nlink) {
> 					JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u is also hard =
linked from dir ino #%u\n",
> 								=C2=A0=C2=A0=C2=A0=C2=A0fd->name, fd->ino, ic->ino, fd->ic->pino_=
nlink);
> 					/* Should we unlink it from its previous parent? */
> 				}
> 				fd->ic->pino_nlink =3D ic->ino;
> 			}
> 			jffs2_free_full_dirent(fd);
> 		}
> 		ic->scan_dents =3D NULL;
> 		cond_resched();
> 	}
> 	...
> }
> The code here "fd->ic->pino_nlink =3D ic->ino;" will access wrong
> pointer when fd->ic remains as fd->raw.
> To solve this problem, we can let fd->ic and fd->raw do not share the
> union, and make a mark by setting fd->ic=3D0 when jffs2_get_ino_cache
> can't find child_ic for child fd in function jffs2_build_inode_pass1,
> so that we can only do "fd->ic->pino_nlink =3D ic->ino" when fd->ic!=3D0.

Alternatively, we *do* continue to save memory by having that union,
and we just ensure that we *do* clear fd->ic in the case where
jffs2_get_ino_cache() fails. Then cope with it being NULL. New patch
below.

> And I have a question, what situation will cause jffs2_get_ino_cache
> can't find child_ic for child fd in jffs2_build_inode_pass1? This
> really happens.
> I have thought it over, and not figure it out ;(

It can happen if the parent directory has an entry indicating a child
(either file or directory) which does't actually exist =E2=80=94 there are =
no
physical nodes on the medium which belong to that child inode.

I suspect that this should only ever happen when the parent directory
itself has been deleted but not yet completely obsoleted from the
flash. Which is precisely the situation you originally described, isn't
it?

----
From: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] Fix directory hardlinks from deleted directories

When a directory is deleted, we don't take too much care about killing off
all the dirents that belong to it =E2=80=94 on the basis that on remount, t=
he scan
will conclude that the directory is dead anyway.

This doesn't work though, when the deleted directory contained a child
directory which was moved *out*. In the early stages of the fs build
we can then end up with an apparent hard link, with the child directory
appearing both in its true location, and as a child of the original
directory which are this stage of the mount process we don't *yet* know
is defunct.

To resolve this, take out the early special-casing of the "directories
shall not have hard links" rule in jffs2_build_inode_pass1(), and let the
normal nlink processing happen for directories as well as other inodes.

Then later in the build process we can set ic->pino_nlink to the parent
inode#, as is required for directories during normal operaton, instead
of the nlink. And complain only *then* about hard links which are still
in evidence even after killing off all the unreachable paths.

Reported-by: Liu Song <liu.song11@zte.com.cn>
Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
---
=C2=A0fs/jffs2/build.c=C2=A0=C2=A0=C2=A0=C2=A0| 75 ++++++++++++++++++++++++=
++++++++++++++++-------------
=C2=A0fs/jffs2/nodelist.h |=C2=A0=C2=A06 ++++-
=C2=A02 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index a3750f9..c1f0494 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -49,7 +49,8 @@ next_inode(int *i, struct jffs2_inode_cache *ic, struct j=
ffs2_sb_info *c)
=C2=A0
=C2=A0
=C2=A0static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
-				=C2=A0=C2=A0=C2=A0=C2=A0struct jffs2_inode_cache *ic)
+				=C2=A0=C2=A0=C2=A0=C2=A0struct jffs2_inode_cache *ic,
+				=C2=A0=C2=A0=C2=A0=C2=A0int *dir_hardlinks)
=C2=A0{
=C2=A0	struct jffs2_full_dirent *fd;
=C2=A0
@@ -68,19 +69,21 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_inf=
o *c,
=C2=A0			dbg_fsbuild("child \"%s\" (ino #%u) of dir ino #%u doesn't exist!\=
n",
=C2=A0				=C2=A0=C2=A0fd->name, fd->ino, ic->ino);
=C2=A0			jffs2_mark_node_obsolete(c, fd->raw);
+			/* Clear the ic/raw union so it doesn't cause problems later. */
+			fd->ic =3D NULL;
=C2=A0			continue;
=C2=A0		}
=C2=A0
+		/* From this point, fd->raw is no longer used so we can set fd->ic */
+		fd->ic =3D child_ic;
+		child_ic->pino_nlink++;
+		/* If we appear (at this stage) to have hard-linked directories,
+		=C2=A0* set a flag to trigger a scan later */
=C2=A0		if (fd->type =3D=3D DT_DIR) {
-			if (child_ic->pino_nlink) {
-				JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u appears to be a=
 hard link\n",
-					=C2=A0=C2=A0=C2=A0=C2=A0fd->name, fd->ino, ic->ino);
-				/* TODO: What do we do about it? */
-			} else {
-				child_ic->pino_nlink =3D ic->ino;
-			}
-		} else
-			child_ic->pino_nlink++;
+			child_ic->flags |=3D INO_FLAGS_IS_DIR;
+			if (child_ic->pino_nlink > 1)
+				*dir_hardlinks =3D 1;
+		}
=C2=A0
=C2=A0		dbg_fsbuild("increased nlink for child \"%s\" (ino #%u)\n", fd->nam=
e, fd->ino);
=C2=A0		/* Can't free scan_dents so far. We might need them in pass 2 */
@@ -94,8 +97,7 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_info =
*c,
=C2=A0*/
=C2=A0static int jffs2_build_filesystem(struct jffs2_sb_info *c)
=C2=A0{
-	int ret;
-	int i;
+	int ret, i, dir_hardlinks =3D 0;
=C2=A0	struct jffs2_inode_cache *ic;
=C2=A0	struct jffs2_full_dirent *fd;
=C2=A0	struct jffs2_full_dirent *dead_fds =3D NULL;
@@ -119,7 +121,7 @@ static int jffs2_build_filesystem(struct jffs2_sb_info =
*c)
=C2=A0	/* Now scan the directory tree, increasing nlink according to every =
dirent found. */
=C2=A0	for_each_inode(i, c, ic) {
=C2=A0		if (ic->scan_dents) {
-			jffs2_build_inode_pass1(c, ic);
+			jffs2_build_inode_pass1(c, ic, &dir_hardlinks);
=C2=A0			cond_resched();
=C2=A0		}
=C2=A0	}
@@ -155,6 +157,20 @@ static int jffs2_build_filesystem(struct jffs2_sb_info=
 *c)
=C2=A0	}
=C2=A0
=C2=A0	dbg_fsbuild("pass 2a complete\n");
+
+	if (dir_hardlinks) {
+		/* If we detected directory hardlinks earlier, *hopefully*
+		=C2=A0* they are gone now because some of the links were from
+		=C2=A0* dead directories which still had some old dirents lying
+		=C2=A0* around and not yet garbage-collected, but which have
+		=C2=A0* been discarded above. So clear the pino_nlink field
+		=C2=A0* in each directory, so that the final scan below can
+		=C2=A0* print appropriate warnings. */
+		for_each_inode(i, c, ic) {
+			if (ic->flags & INO_FLAGS_IS_DIR)
+				ic->pino_nlink =3D 0;
+		}
+	}
=C2=A0	dbg_fsbuild("freeing temporary data structures\n");
=C2=A0
=C2=A0	/* Finally, we can scan again and free the dirent structs */
@@ -162,6 +178,33 @@ static int jffs2_build_filesystem(struct jffs2_sb_info=
 *c)
=C2=A0		while(ic->scan_dents) {
=C2=A0			fd =3D ic->scan_dents;
=C2=A0			ic->scan_dents =3D fd->next;
+			/* We do use the pino_nlink field to count nlink of
+			=C2=A0* directories during fs build, so set it to the
+			=C2=A0* parent ino# now. Now that there's hopefully only
+			=C2=A0* one. */
+			if (fd->type =3D=3D DT_DIR) {
+				if (!fd->ic) {
+					/* We'll have complained about it and marked the coresponding
+					=C2=A0=C2=A0=C2=A0raw node obsolete already. Just skip it. */
+					continue;
+				}
+
+				/* We *have* to have set this in jffs2_build_inode_pass1() */
+				BUG_ON(!(fd->ic->flags & INO_FLAGS_IS_DIR));
+
+				/* We clear ic->pino_nlink =E2=88=80 directories' ic *only* if dir_har=
dlinks
+				=C2=A0* is set. Otherwise, we know this should never trigger anyway, s=
o
+				=C2=A0* we don't do the check. And ic->pino_nlink still contains the n=
link
+				=C2=A0* value (which is 1). */
+				if (dir_hardlinks && fd->ic->pino_nlink) {
+					JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u is also hard l=
inked from dir ino #%u\n",
+						=C2=A0=C2=A0=C2=A0=C2=A0fd->name, fd->ino, ic->ino, fd->ic->pino_nli=
nk);
+					/* Should we unlink it from its previous parent? */
+				}
+
+				/* For directories, ic->pino_nlink holds that parent inode # */
+				fd->ic->pino_nlink =3D ic->ino;
+			}
=C2=A0			jffs2_free_full_dirent(fd);
=C2=A0		}
=C2=A0		ic->scan_dents =3D NULL;
@@ -240,11 +283,7 @@ static void jffs2_build_remove_unlinked_inode(struct j=
ffs2_sb_info *c,
=C2=A0
=C2=A0			/* Reduce nlink of the child. If it's now zero, stick it on the
=C2=A0			=C2=A0=C2=A0=C2=A0dead_fds list to be cleaned up later. Else just =
free the fd */
-
-			if (fd->type =3D=3D DT_DIR)
-				child_ic->pino_nlink =3D 0;
-			else
-				child_ic->pino_nlink--;
+			child_ic->pino_nlink--;
=C2=A0
=C2=A0			if (!child_ic->pino_nlink) {
=C2=A0				dbg_fsbuild("inode #%u (\"%s\") now has no links; adding to dead_=
fds list.\n",
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index fa35ff7..0637271 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -194,6 +194,7 @@ struct jffs2_inode_cache {
=C2=A0#define INO_STATE_CLEARING	6	/* In clear_inode() */
=C2=A0
=C2=A0#define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
+#define INO_FLAGS_IS_DIR	0x02	/* is a directory */
=C2=A0
=C2=A0#define RAWNODE_CLASS_INODE_CACHE	0
=C2=A0#define RAWNODE_CLASS_XATTR_DATUM	1
@@ -249,7 +250,10 @@ struct jffs2_readinode_info
=C2=A0
=C2=A0struct jffs2_full_dirent
=C2=A0{
-	struct jffs2_raw_node_ref *raw;
+	union {
+		struct jffs2_raw_node_ref *raw;
+		struct jffs2_inode_cache *ic; /* Just during part of build */
+	};
=C2=A0	struct jffs2_full_dirent *next;
=C2=A0	uint32_t version;
=C2=A0	uint32_t ino; /* =3D=3D zero for unlink */
--=C2=A0
2.5.0

--=20
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation


--=-hJxbk12uQX06kTeNNTXz
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIISjjCCBicw
ggUPoAMCAQICAw3vNzANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0
YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcx
ODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENB
MB4XDTE1MDUwNTA5NDM0MVoXDTE2MDUwNTA5NTMzNlowQjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFk
ZWFkLm9yZzEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMkbm9kPbx1j/X4RVyf/pPKSYwelcco69TvnQQbKM8m8xkWjXJI1
jpJ1jMaGUZGFToINMSZi7lZawUozudWbXSKy1SikENSTJHffsdRAIlsp+hR8vWvjsKUry6sEdqPG
doa5RY7+N4WRusWZDYW/RRWE6i9EL9qV86CVPYqw22UBOUw4/j/HVGCV6TSB8yE5iEwhk/hUuzRr
FZm1MJMR7mCS7BCR8Lr5jFY61lWpBiXNXIxLZCvDc26KR5L5tYX43iUVO3fzES1GRVoYnxxk2tmz
fcsZG5vK+Trc9L8OZJfkYrEHH3+Iw41MQ0w/djVtYr1+HYldx0QmYXAtnhIj+UMCAwEAAaOCAtkw
ggLVMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD
BDAdBgNVHQ4EFgQUszC96C3w5/2+d+atSr0IpT26YI4wHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+
ljVO8tS4UYIwHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzCCAUwGA1UdIASCAUMwggE/
MIIBOwYLKwYBBAGBtTcBAgMwggEqMC4GCCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNv
bS9wb2xpY3kucGRmMIH3BggrBgEFBQcCAjCB6jAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1
dGhvcml0eTADAgEBGoG+VGhpcyBjZXJ0aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0
aGUgQ2xhc3MgMSBWYWxpZGF0aW9uIHJlcXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20gQ0EgcG9s
aWN5LCByZWxpYW5jZSBvbmx5IGZvciB0aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21wbGlhbmNl
IG9mIHRoZSByZWx5aW5nIHBhcnR5IG9ibGlnYXRpb25zLjA2BgNVHR8ELzAtMCugKaAnhiVodHRw
Oi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsG
AQUFBzABhi1odHRwOi8vb2NzcC5zdGFydHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYI
KwYBBQUHMAKGNmh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xpZW50
LmNhLmNydDAjBgNVHRIEHDAahhhodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcNAQEF
BQADggEBAHMQmxHHodpS85X8HRyxhvfkys7r+taCNOaNU9cxQu/cZ/6k5nS2qGNMzZ6jb7ueY/V7
7p+4DW/9ZWODDTf4Fz00mh5SSVc20Bz7t+hhxwHd62PZgENh5i76Qq2tw48U8AsYo5damHby1epf
neZafLpUkLLO7AGBJIiRVTevdvyXQ0qnixOmKMWyvrhSNGuVIKVdeqLP+102Dwf+dpFyw+j1hz28
jEEKpHa+NR1b2kXuSPi/rMGhexwlJOh4tK8KQ6Ryr0rIN//NSbOgbyYZrzc/ZUWX9V5OA84ChFb2
vkFl0OcYrttp/rhDBLITwffPxSZeoBh9H7zYzkbCXKL3BUIwggYnMIIFD6ADAgECAgMN7zcwDQYJ
KoZIhvcNAQEFBQAwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYD
VQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENv
bSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTAeFw0xNTA1MDUwOTQzNDFa
Fw0xNjA1MDUwOTUzMzZaMEIxHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcxIjAgBgkqhkiG
9w0BCQEWE2R3bXcyQGluZnJhZGVhZC5vcmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQDJG5vZD28dY/1+EVcn/6TykmMHpXHKOvU750EGyjPJvMZFo1ySNY6SdYzGhlGRhU6CDTEmYu5W
WsFKM7nVm10istUopBDUkyR337HUQCJbKfoUfL1r47ClK8urBHajxnaGuUWO/jeFkbrFmQ2Fv0UV
hOovRC/alfOglT2KsNtlATlMOP4/x1Rglek0gfMhOYhMIZP4VLs0axWZtTCTEe5gkuwQkfC6+YxW
OtZVqQYlzVyMS2Qrw3NuikeS+bWF+N4lFTt38xEtRkVaGJ8cZNrZs33LGRubyvk63PS/DmSX5GKx
Bx9/iMONTENMP3Y1bWK9fh2JXcdEJmFwLZ4SI/lDAgMBAAGjggLZMIIC1TAJBgNVHRMEAjAAMAsG
A1UdDwQEAwIEsDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwHQYDVR0OBBYEFLMwvegt
8Of9vnfmrUq9CKU9umCOMB8GA1UdIwQYMBaAFFNy7ZKc4NrLAVx8fpY1TvLUuFGCMB4GA1UdEQQX
MBWBE2R3bXcyQGluZnJhZGVhZC5vcmcwggFMBgNVHSAEggFDMIIBPzCCATsGCysGAQQBgbU3AQID
MIIBKjAuBggrBgEFBQcCARYiaHR0cDovL3d3dy5zdGFydHNzbC5jb20vcG9saWN5LnBkZjCB9wYI
KwYBBQUHAgIwgeowJxYgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwAwIBARqBvlRo
aXMgY2VydGlmaWNhdGUgd2FzIGlzc3VlZCBhY2NvcmRpbmcgdG8gdGhlIENsYXNzIDEgVmFsaWRh
dGlvbiByZXF1aXJlbWVudHMgb2YgdGhlIFN0YXJ0Q29tIENBIHBvbGljeSwgcmVsaWFuY2Ugb25s
eSBmb3IgdGhlIGludGVuZGVkIHB1cnBvc2UgaW4gY29tcGxpYW5jZSBvZiB0aGUgcmVseWluZyBw
YXJ0eSBvYmxpZ2F0aW9ucy4wNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5zdGFydHNzbC5j
b20vY3J0dTEtY3JsLmNybDCBjgYIKwYBBQUHAQEEgYEwfzA5BggrBgEFBQcwAYYtaHR0cDovL29j
c3Auc3RhcnRzc2wuY29tL3N1Yi9jbGFzczEvY2xpZW50L2NhMEIGCCsGAQUFBzAChjZodHRwOi8v
YWlhLnN0YXJ0c3NsLmNvbS9jZXJ0cy9zdWIuY2xhc3MxLmNsaWVudC5jYS5jcnQwIwYDVR0SBBww
GoYYaHR0cDovL3d3dy5zdGFydHNzbC5jb20vMA0GCSqGSIb3DQEBBQUAA4IBAQBzEJsRx6HaUvOV
/B0csYb35MrO6/rWgjTmjVPXMULv3Gf+pOZ0tqhjTM2eo2+7nmP1e+6fuA1v/WVjgw03+Bc9NJoe
UklXNtAc+7foYccB3etj2YBDYeYu+kKtrcOPFPALGKOXWph28tXqX53mWny6VJCyzuwBgSSIkVU3
r3b8l0NKp4sTpijFsr64UjRrlSClXXqiz/tdNg8H/naRcsPo9Yc9vIxBCqR2vjUdW9pF7kj4v6zB
oXscJSToeLSvCkOkcq9KyDf/zUmzoG8mGa83P2VFl/VeTgPOAoRW9r5BZdDnGK7baf64QwSyE8H3
z8UmXqAYfR+82M5Gwlyi9wVCMIIGNDCCBBygAwIBAgIBHjANBgkqhkiG9w0BAQUFADB9MQswCQYD
VQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwg
Q2VydGlmaWNhdGUgU2lnbmluZzEpMCcGA1UEAxMgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMDcxMDI0MjEwMTU1WhcNMTcxMDI0MjEwMTU1WjCBjDELMAkGA1UEBhMCSUwxFjAU
BgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRl
IFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUg
Q2xpZW50IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxwmDzM4t2BqxKaQuE6uW
vooyg4ymiEGWVUet1G8SD+rqvyNH4QrvnEIaFHxOhESip7vMz39ScLpNLbL1QpOlPW/tFIzNHS3q
d2XRNYG5Sv9RcGE+T4qbLtsjjJbi6sL7Ls/f/X9ftTyhxvxWkf8KW37iKrueKsxw2HqolH7GM6FX
5UfNAwAu4ZifkpmZzU1slBhyWwaQPEPPZRsWoTb7q8hmgv6Nv3Hg9rmA1/VPBIOQ6SKRkHXG0Hhm
q1dOFoAFI411+a/9nWm5rcVjGcIWZ2v/43Yksq60jExipA4l5uv9/+Hm33mbgmCszdj/Dthf13tg
Av2O83hLJ0exTqfrlwIDAQABo4IBrTCCAakwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
AQYwHQYDVR0OBBYEFFNy7ZKc4NrLAVx8fpY1TvLUuFGCMB8GA1UdIwQYMBaAFE4L7xqkQFulF2mH
MMo0aEPQQa7yMGYGCCsGAQUFBwEBBFowWDAnBggrBgEFBQcwAYYbaHR0cDovL29jc3Auc3RhcnRz
c2wuY29tL2NhMC0GCCsGAQUFBzAChiFodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9zZnNjYS5jcnQw
WwYDVR0fBFQwUjAnoCWgI4YhaHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3JsMCegJaAj
hiFodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9zZnNjYS5jcmwwgYAGA1UdIAR5MHcwdQYLKwYBBAGB
tTcBAgEwZjAuBggrBgEFBQcCARYiaHR0cDovL3d3dy5zdGFydHNzbC5jb20vcG9saWN5LnBkZjA0
BggrBgEFBQcCARYoaHR0cDovL3d3dy5zdGFydHNzbC5jb20vaW50ZXJtZWRpYXRlLnBkZjANBgkq
hkiG9w0BAQUFAAOCAgEACoMIfXirLAZcuGOMXq4cuSN3TaFx2H2GvD5VSy/6rV55BYHbWNaPeQn3
oBSU8KgQZn/Kck1JxbLpAxVCNtsxeW1R87ifhsYZ0qjdrA9anrW2MAWCtosmAOT4OxK9QPoSjCMx
M3HbkZCDJgnlE8jMopH21BbyAYr7b5EfGRQJNtgWcvqSXwKHnTutR08+Kkn0KAkXCzeQNLeA5LlY
UzFyM7kPAp8pIRMQ+seHunmyG642S2+y/qHEdMuGIwpfz3eDF1PdctL04qYK/zu+Qg1Bw0RwgigV
Zs/0c5HP2/e9DBHh7eSwtzYlk4AUr6yxLlcwSjOfOmKEQ/Q8tzh0IFiNu9IPuTGAPBn4CPxD0+Ru
8T2wg8/s43R/PT3kd1OEqOJUl7q+h+r6fpvU0Fzxd2tC8Ga6fDEPme+1Nbi+03pVjuZQKbGwKJ66
gEn06WqaxVZC+J8hh/jR0k9mST1iAZPNYulcNJ8tKmVtjYsv0L1TSm2+NwON58tO+pIVzu3DWwSE
XSf+qkDavQam+QtEOZxLBXI++aMUEapSn+k3Lxm48ZCYfAWLb/Xj7F5JQMbZvCexglAbYR0kIHqW
5DnsYSdMD/IplJMojx0NBrxJ3fN9dvX2Y6BIXRsF1du4qESm4/3CKuyUV7p9DW3mPlHTGLvYxnyK
Qy7VFBkoLINszBrOUeIxggNvMIIDawIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0
YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcx
ODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENB
AgMN7zcwCQYFKw4DAhoFAKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMTYwMjAxMTQyMTI2WjAjBgkqhkiG9w0BCQQxFgQUEeAUnrqUgzWNvk9EBaCKEH1me7Iw
gaUGCSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0
ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMT
L1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMN7zcwgacG
CyqGSIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRk
LjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMv
U3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAw3vNzANBgkq
hkiG9w0BAQEFAASCAQAmS1Uvq+eLI/6SKNQxhPTuEz9RBhBQShxsst2vB2UVuRI2GA2xny0BTIa2
czNRZiXDThbRJiM0INY3GRHGxz8jVBXaM7faOo/aiMXnLyxv0p6L0ygeIPQiK7ltddtOnupeCoux
7PKhzZRaCv46jFvEEBkYH+QUJfORh9pD+HH9F7hQzIiPO4js0fV4I4uJCw7ohvfHHmqrBDNKLFQw
V49V+Y8IUOi1xIMdqfvySkBEYJvJfI+LcxzGwIxcoullGNRCRe2kfuFJ4gIB1OQyyZ8k/ps7+pGx
zOIBDN4/6mL0/1ePupz0VpS3i+ER0I/51AnBdvLkcjZqCFj+n9h85/a1AAAAAAAA


--=-hJxbk12uQX06kTeNNTXz--
