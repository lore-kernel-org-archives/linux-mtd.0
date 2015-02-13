Message-ID: <1423826881.5969.33.camel@infradead.org>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
From: David Woodhouse <dwmw2@infradead.org>
To: liu.song11@zte.com.cn
Date: Fri, 13 Feb 2015 11:28:01 +0000
In-Reply-To: <1423822421.5969.11.camel@infradead.org>
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
 <1423748599.15180.10.camel@infradead.org>
 <OF4EF0DB08.789494F2-ON48257DEB.0016B74A-48257DEB.0016DF0F@zte.com.cn>
 <1423822421.5969.11.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-1";
 protocol="application/x-pkcs7-signature";
 boundary="=-wqNEMhNnSFARD3/SHy6f"
Mime-Version: 1.0
Cc: jiang.xuexin@zte.com.cn, wang.bo116@zte.com.cn,
 linux-mtd@lists.infradead.org, deng.chao1@zte.com.cn, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wqNEMhNnSFARD3/SHy6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-02-13 at 10:13 +0000, David Woodhouse wrote:
>=20
> If <ino#71> is somehow ending up linked as /mnt/foo again when it should
> have been unlinked, *that* is the problem we need to be looking at. The
> zombie *children* of <ino#71> are just a symptom of its reincarnation.

Ah, I think I understand a little better.

At the time the problem happens, it's too *early* in the scan/build
process. We don't yet *know* that ino#71 is dead, because we haven't yet
scanned the whole flash looking for dirents that might point to it.

In the problematic case, the directory SW1<#2> is first discovered when
we see its dirent from the *dead* directory <#71>, and we fill in
ic<2>->pino_nlink =3D 71.

And then *later* we find the *real* dirent which links SW1<#2> from the
root directory, and we hit that 'appears to be a hard link' message in
jffs2_build_inode_pass1().

The problem really comes when we *later* kill ino#71 because we realise
it doesn't have any valid dirents keeping it alive, and we *also* kill
all its children. Some of which weren't *really* supposed to be its
children :)

If we happened to hit the real dirent for SW1<#2> *first*, and the
dirent linking it from <#71> *later*, then we'd be OK.

This is all because of the NFS export support, which means we have to
know the parent inode# for directories. If we were still storing nlink
for directories as we do for plain files, we could fix this fairly
easily.

Your approach is to fix the garbage collection, to ensure that the old
deletion dirents "unlinking" SW1<#2> from the dead <ino#71> aren't
actually allowed to expire until all previous *positive* dirents linking
it into that dead parent directory have also expired =E2=80=94 much like we
already do for garbage collection of deletion dirents in a live
directory.

That makes sense, but I'm not sure I like it very much. It's complex,
and it really does violate my sense of decency a little =E2=80=94 if <ino#7=
1> is
dead when it should *stay* dead, and not return to bother us.

I'll see if I can come up with a simpler solution purely within the scan
code. Can you test this, please?

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index a3750f9..f5a9b0e 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -49,7 +49,8 @@ next_inode(int *i, struct jffs2_inode_cache *ic, struct j=
ffs2_sb_info *c)
=20
=20
 static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
-				    struct jffs2_inode_cache *ic)
+				    struct jffs2_inode_cache *ic,
+				    int *dir_hardlinks)
 {
 	struct jffs2_full_dirent *fd;
=20
@@ -71,16 +72,16 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_inf=
o *c,
 			continue;
 		}
=20
+		/* From this point, fd->raw is no longer used so we can set fd->ic */
+		fd->ic =3D child_ic;
+		child_ic->pino_nlink++;
+		/* If we appear (at this stage) to have hard-linked directories,
+		 * set a flag to trigger a scan later */
 		if (fd->type =3D=3D DT_DIR) {
-			if (child_ic->pino_nlink) {
-				JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u appears to be a=
 hard link\n",
-					    fd->name, fd->ino, ic->ino);
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
=20
 		dbg_fsbuild("increased nlink for child \"%s\" (ino #%u)\n", fd->name, fd=
->ino);
 		/* Can't free scan_dents so far. We might need them in pass 2 */
@@ -94,8 +95,7 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_info =
*c,
 */
 static int jffs2_build_filesystem(struct jffs2_sb_info *c)
 {
-	int ret;
-	int i;
+	int ret, i, dir_hardlinks =3D 0;
 	struct jffs2_inode_cache *ic;
 	struct jffs2_full_dirent *fd;
 	struct jffs2_full_dirent *dead_fds =3D NULL;
@@ -119,7 +119,7 @@ static int jffs2_build_filesystem(struct jffs2_sb_info =
*c)
 	/* Now scan the directory tree, increasing nlink according to every diren=
t found. */
 	for_each_inode(i, c, ic) {
 		if (ic->scan_dents) {
-			jffs2_build_inode_pass1(c, ic);
+			jffs2_build_inode_pass1(c, ic, &dir_hardlinks);
 			cond_resched();
 		}
 	}
@@ -155,6 +155,20 @@ static int jffs2_build_filesystem(struct jffs2_sb_info=
 *c)
 	}
=20
 	dbg_fsbuild("pass 2a complete\n");
+
+	if (dir_hardlinks) {
+		/* If we detected directory hardlinks earlier, *hopefully*
+		 * they are gone now because some of the links were from
+		 * dead directories which still had some old dirents lying
+		 * around and not yet garbage-collected, but which have
+		 * been discarded above. So clear the pino_nlink field
+		 * in each directory, so that the final scan below can
+		 * print appropriate warnings. */
+		for_each_inode(i, c, ic) {
+			if (ic->flags & INO_FLAGS_IS_DIR)
+				ic->pino_nlink =3D 0;
+		}
+	}
 	dbg_fsbuild("freeing temporary data structures\n");
=20
 	/* Finally, we can scan again and free the dirent structs */
@@ -162,6 +176,18 @@ static int jffs2_build_filesystem(struct jffs2_sb_info=
 *c)
 		while(ic->scan_dents) {
 			fd =3D ic->scan_dents;
 			ic->scan_dents =3D fd->next;
+			/* We do use the pino_nlink field to count nlink of
+			 * directories during fs build, so set it to the
+			 * parent ino# now. Now that there's hopefully only
+			 * one. */
+			if (fd->type =3D=3D DT_DIR) {
+				if (dir_hardlinks && fd->ic->pino_nlink) {
+					JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u is also hard l=
inked from dir ino #%u\n",
+						    fd->name, fd->ino, ic->ino, fd->ic->pino_nlink);
+					/* Should we unlink it from its previous parent? */
+				}
+				fd->ic->pino_nlink =3D ic->ino;
+			}
 			jffs2_free_full_dirent(fd);
 		}
 		ic->scan_dents =3D NULL;
@@ -240,11 +266,7 @@ static void jffs2_build_remove_unlinked_inode(struct j=
ffs2_sb_info *c,
=20
 			/* Reduce nlink of the child. If it's now zero, stick it on the
 			   dead_fds list to be cleaned up later. Else just free the fd */
-
-			if (fd->type =3D=3D DT_DIR)
-				child_ic->pino_nlink =3D 0;
-			else
-				child_ic->pino_nlink--;
+			child_ic->pino_nlink--;
=20
 			if (!child_ic->pino_nlink) {
 				dbg_fsbuild("inode #%u (\"%s\") now has no links; adding to dead_fds l=
ist.\n",
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index fa35ff7..0637271 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -194,6 +194,7 @@ struct jffs2_inode_cache {
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
=20
 #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
+#define INO_FLAGS_IS_DIR	0x02	/* is a directory */
=20
 #define RAWNODE_CLASS_INODE_CACHE	0
 #define RAWNODE_CLASS_XATTR_DATUM	1
@@ -249,7 +250,10 @@ struct jffs2_readinode_info
=20
 struct jffs2_full_dirent
 {
-	struct jffs2_raw_node_ref *raw;
+	union {
+		struct jffs2_raw_node_ref *raw;
+		struct jffs2_inode_cache *ic; /* Just during part of build */
+	};
 	struct jffs2_full_dirent *next;
 	uint32_t version;
 	uint32_t ino; /* =3D=3D zero for unlink */


--=20
dwmw2

--=-wqNEMhNnSFARD3/SHy6f
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIISxDCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIGQjCCBSqg
AwIBAgIDCdkyMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTQwNTA0MTczMDIyWhcNMTUwNTA0MjM0MTAxWjBdMRkwFwYDVQQNExAzODNCMTVkSHFQSUR0cDZO
MRwwGgYDVQQDDBNkd213MkBpbmZyYWRlYWQub3JnMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZy
YWRlYWQub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy7K+t+REIdZGFUfgR8Io
QrJ/VLZil9I00JcwqTo8BiGy1dqSIB2y923siya5SDKMh1YurtCPsX96cNzwPmmN2cs0MKeVPQWz
iQhHk3uKcB6LvvS7pzTahRWMRmTyW3CH+RphRM9plvyClY23GEeEnpBnGz4GaJJiPcJjGgzyZ/tI
q473pOlSrDPZnZk43vt/5CJN46nIZOZ2I+PzlgINI+EbiwsXVn3VohHB7nVTwGaRLk5oywGt8ZT7
tDdxn3BQ3inO1sr5MtkV1o2cHlenIC8mlU8nL/mrqqVve7Vib1YQUycW+Pj4CBYm4FTeuctAvNzK
U/daeBclOZ8ofgQe2wIDAQABo4IC2TCCAtUwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRAjCSCV70BpLBeXge5DXi+mPhHTTAf
BgNVHSMEGDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAeBgNVHREEFzAVgRNkd213MkBpbmZyYWRl
YWQub3JnMIIBTAYDVR0gBIIBQzCCAT8wggE7BgsrBgEEAYG1NwECAzCCASowLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0
YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdh
cyBpc3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRz
IG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRl
ZCBwdXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMu
MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNybC5jcmww
gY4GCCsGAQUFBwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9z
dWIvY2xhc3MxL2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20v
Y2VydHMvc3ViLmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3Rh
cnRzc2wuY29tLzANBgkqhkiG9w0BAQUFAAOCAQEAWS2KNN7O3vZVtNHXVqgbmijeptKwt+8b6yiF
wT3kJoywInPl5U+OeKRZfQKTHghM4Ohof6lF244ZMxhir/xp7l/zkZ/BUbxLwp6kIL27Gi5pgP4D
KLnTZheQL9N5Yi/vMONxMWcpcW+ZNv5hnDCfEsfVcLXC8sNLPjx2ezfMIhSSPwBuJpmOun70te4E
P0YBqjSalPfvc5fC5KgaYtqTDFwo9Mw25X5HHDC0r6BK5aNrF1nD/xYTX7cdvZZWl7cUApr4PCrn
uI2DEn7OWQ/rY407ytV1c5pjvmuv/IT/ZUb/kXV6Q47UvrJp2Ifi2VhsBcnHHasKavjtRCmpDsGM
rTCCBkIwggUqoAMCAQICAwnZMjANBgkqhkiG9w0BAQUFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNV
BAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNp
Z25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xp
ZW50IENBMB4XDTE0MDUwNDE3MzAyMloXDTE1MDUwNDIzNDEwMVowXTEZMBcGA1UEDRMQMzgzQjE1
ZEhxUElEdHA2TjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzEiMCAGCSqGSIb3DQEJARYT
ZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMuyvrfk
RCHWRhVH4EfCKEKyf1S2YpfSNNCXMKk6PAYhstXakiAdsvdt7IsmuUgyjIdWLq7Qj7F/enDc8D5p
jdnLNDCnlT0Fs4kIR5N7inAei770u6c02oUVjEZk8ltwh/kaYUTPaZb8gpWNtxhHhJ6QZxs+BmiS
Yj3CYxoM8mf7SKuO96TpUqwz2Z2ZON77f+QiTeOpyGTmdiPj85YCDSPhG4sLF1Z91aIRwe51U8Bm
kS5OaMsBrfGU+7Q3cZ9wUN4pztbK+TLZFdaNnB5XpyAvJpVPJy/5q6qlb3u1Ym9WEFMnFvj4+AgW
JuBU3rnLQLzcylP3WngXJTmfKH4EHtsCAwEAAaOCAtkwggLVMAkGA1UdEwQCMAAwCwYDVR0PBAQD
AgSwMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUQIwkgle9AaSwXl4H
uQ14vpj4R00wHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwHgYDVR0RBBcwFYETZHdt
dzJAaW5mcmFkZWFkLm9yZzCCAUwGA1UdIASCAUMwggE/MIIBOwYLKwYBBAGBtTcBAgMwggEqMC4G
CCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMIH3BggrBgEFBQcC
AjCB6jAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoG+VGhpcyBjZXJ0
aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0aGUgQ2xhc3MgMSBWYWxpZGF0aW9uIHJl
cXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LCByZWxpYW5jZSBvbmx5IGZvciB0
aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21wbGlhbmNlIG9mIHRoZSByZWx5aW5nIHBhcnR5IG9i
bGlnYXRpb25zLjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLnN0YXJ0c3NsLmNvbS9jcnR1
MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5zdGFy
dHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYIKwYBBQUHMAKGNmh0dHA6Ly9haWEuc3Rh
cnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xpZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRw
Oi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZIhvcNAQEFBQADggEBAFktijTezt72VbTR11aoG5oo
3qbSsLfvG+sohcE95CaMsCJz5eVPjnikWX0Ckx4ITODoaH+pRduOGTMYYq/8ae5f85GfwVG8S8Ke
pCC9uxouaYD+Ayi502YXkC/TeWIv7zDjcTFnKXFvmTb+YZwwnxLH1XC1wvLDSz48dns3zCIUkj8A
biaZjrp+9LXuBD9GAao0mpT373OXwuSoGmLakwxcKPTMNuV+RxwwtK+gSuWjaxdZw/8WE1+3Hb2W
Vpe3FAKa+Dwq57iNgxJ+zlkP62ONO8rVdXOaY75rr/yE/2VG/5F1ekOO1L6yadiH4tlYbAXJxx2r
Cmr47UQpqQ7BjK0xggNvMIIDawIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2
BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMJ
2TIwCQYFKw4DAhoFAKCCAa8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMTUwMjEzMTEyODAxWjAjBgkqhkiG9w0BCQQxFgQUBYy7WCt9/dX6j7LUmxku4AYobyowgaUG
CSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4x
KzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0
YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMJ2TIwgacGCyqG
SIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjEr
MCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3Rh
cnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwnZMjANBgkqhkiG
9w0BAQEFAASCAQA/uweEhi6MP5+1O1XjGHclTDoSio7mWa9aWhqIsWDe/2MzabAKasoYJ8fR++Di
Qo0PGDHm1XPRLgssaxot0iK87UvZHn2BaYqFOR7ihb7pQRAJkn5MN8FaDBAF1spnKX+UFSFcRKCQ
s0QUg04xxg1cF7jMKf6v8LuFKDTspnbTDl4wypLZxSCmg/9m4voqBHO7nd9y7ony9Sql1tORnR9Z
f7brUtg5er0naFLWmmj62qJyG9QT6SBNWAapYgbebSUNtDlKLfXllVqviH/UOfc+VtT1+3kSeEt+
eXJLt2Lb9r7aYD806uAbvb537PrEcb1p4MLSJoypBCdFEjwXleUcAAAAAAAA


--=-wqNEMhNnSFARD3/SHy6f--
