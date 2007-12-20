Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5KOs-0002r3-C0
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:21:24 +0000
Date: Thu, 20 Dec 2007 12:46:38 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Josh Boyer <jwboyer@gmail.com>
Subject: [PATCH][MTD-UTILS] Set mkfs.jffs2 page size runtime instead of fixed
	[respoin]
In-Reply-To: <20071207070354.02e020b2@weaponx>
Message-ID: <Pine.LNX.4.64.0712201241410.21948@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
	<20071207070354.02e020b2@weaponx>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="218815243-1547530156-1198151045=:21948"
Content-ID: <Pine.LNX.4.64.0712201244110.21948@lnxricardw.se.axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-1547530156-1198151045=:21948
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-1; FORMAT=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.0712201244111.21948@lnxricardw.se.axis.com>


On Fri, 7 Dec 2007, Josh Boyer wrote:

> On Thu, 6 Dec 2007 12:43:47 +0100 (CET)
> Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
>>
>> This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
>> mkfs.jffs2 is running on, instead of just setting it to 4096 (which of
>> course is valid for most systems but not all).
>
> This makes sense overall.  I'd like to do it a slightly different way=20
> though.

I think I see what you mean. I had inadvertently put the setting=20
of the page_size variable at the start of write_regular_file() instead of=
=20
at the start of main() where I wanted it. Fixed.

> Could we add an additional check here to see if page_size !=3D 4096, and
> print a loud warning with the page size that is actually being used and
> suggest the --pagesize option if that isn't what is desired?
>
> It's not that we have tons of systems using a page size different than
> 4KiB, but it's a change in behavior for those that do and I'd like to
> at least warn users about it.  Otherwise the patch looks fine.

Ok, good point, something like this then:

--------------------------

This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
mkfs.jffs2 is running on, instead of just setting it to 4096 (which of
course is valid for most systems but not all).

This is useful if mkfs.jffs2 is running on the target system, e.g. to
create a backup image during firmware upgrade, so that the page size does
not have to be set explicitly using a command line parameter.

The --pagesize option is supported just as before.

If the user has not set the page size explicitly with --pagesize, and
the system page size is anything other than 4096, warn the user that
an unusual page size is being used, since this behavior is different
from before.

Patch is included both as an attachment for patching and inline for
review. (Patch made against git head).

Signed-off-by Ricard Wanderl=F6f <ricardw@axis.com> .

diff -u org/mkfs.jffs2.c work/mkfs.jffs2.c
--- org/mkfs.jffs2.c=092007-12-06 11:49:39.545489000 +0100
+++ work/mkfs.jffs2.c=092007-12-20 12:39:33.842344000 +0100
@@ -672,9 +672,9 @@
  =090xff, 0xff, 0xff, 0xff, 0xff
  };

-/* We default to 4096, per x86.  When building a fs for
- * 64-bit arches and whatnot, use the --pagesize=3DSIZE option */
-int page_size =3D 4096;
+/* We set this at start of main() using sysconf(), -1 means we don't know =
*/
+/* When building an fs for non-native systems, use --pagesize=3DSIZE optio=
n */
+int page_size =3D -1;

  #include "compr.h"

@@ -1617,9 +1617,16 @@
  =09struct filesystem_entry *root;
  =09char *compr_name =3D NULL;
  =09int compr_prior  =3D -1;
+=09int warn_page_size =3D 0;

  =09jffs2_compressors_init();

+=09page_size =3D sysconf(_SC_PAGESIZE);
+=09if (page_size < 0) /* System doesn't know so ... */
+=09=09page_size =3D 4096; /* ... we make an educated guess */
+=09if (page_size !=3D 4096)
+=09=09warn_page_size =3D 1; /* warn user if page size not 4096 */
+
  =09while ((opt =3D getopt_long(argc, argv,
  =09=09=09=09=09"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, =
&c)) >=3D 0)
  =09{
@@ -1642,6 +1649,7 @@

  =09=09=09case 's':
  =09=09=09=09page_size =3D strtol(optarg, NULL, 0);
+=09=09=09=09warn_page_size =3D 0; /* set by user, so don't need to warn */
  =09=09=09=09break;

  =09=09=09case 'o':
@@ -1800,6 +1808,10 @@
  #endif
  =09=09}
  =09}
+=09if (warn_page_size) {
+=09=09error_msg("Page size for this system is by default %d", page_size);
+=09=09error_msg("Use the --pagesize=3DSIZE option if this is not what you =
want");
+=09}
  =09if (out_fd =3D=3D -1) {
  =09=09if (isatty(1)) {
  =09=09=09error_msg_and_die(helptext);

--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-1547530156-1198151045=:21948
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=patch2
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0712201244050.21948@lnxricardw.se.axis.com>
Content-Description: Patch file
Content-Disposition: ATTACHMENT; FILENAME=patch2

ZGlmZiAtdSBvcmcvbWtmcy5qZmZzMi5jIHdvcmsvbWtmcy5qZmZzMi5jDQot
LS0gb3JnL21rZnMuamZmczIuYwkyMDA3LTEyLTA2IDExOjQ5OjM5LjU0NTQ4
OTAwMCArMDEwMA0KKysrIHdvcmsvbWtmcy5qZmZzMi5jCTIwMDctMTItMjAg
MTI6Mzk6MzMuODQyMzQ0MDAwICswMTAwDQpAQCAtNjcyLDkgKzY3Miw5IEBA
DQogCTB4ZmYsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDB4ZmYNCiB9Ow0KIA0KLS8q
IFdlIGRlZmF1bHQgdG8gNDA5NiwgcGVyIHg4Ni4gIFdoZW4gYnVpbGRpbmcg
YSBmcyBmb3INCi0gKiA2NC1iaXQgYXJjaGVzIGFuZCB3aGF0bm90LCB1c2Ug
dGhlIC0tcGFnZXNpemU9U0laRSBvcHRpb24gKi8NCi1pbnQgcGFnZV9zaXpl
ID0gNDA5NjsNCisvKiBXZSBzZXQgdGhpcyBhdCBzdGFydCBvZiBtYWluKCkg
dXNpbmcgc3lzY29uZigpLCAtMSBtZWFucyB3ZSBkb24ndCBrbm93ICovDQor
LyogV2hlbiBidWlsZGluZyBhbiBmcyBmb3Igbm9uLW5hdGl2ZSBzeXN0ZW1z
LCB1c2UgLS1wYWdlc2l6ZT1TSVpFIG9wdGlvbiAqLw0KK2ludCBwYWdlX3Np
emUgPSAtMTsNCiANCiAjaW5jbHVkZSAiY29tcHIuaCINCiANCkBAIC0xNjE3
LDkgKzE2MTcsMTYgQEANCiAJc3RydWN0IGZpbGVzeXN0ZW1fZW50cnkgKnJv
b3Q7DQogCWNoYXIgKmNvbXByX25hbWUgPSBOVUxMOw0KIAlpbnQgY29tcHJf
cHJpb3IgID0gLTE7DQorCWludCB3YXJuX3BhZ2Vfc2l6ZSA9IDA7DQogDQog
CWpmZnMyX2NvbXByZXNzb3JzX2luaXQoKTsNCiANCisJcGFnZV9zaXplID0g
c3lzY29uZihfU0NfUEFHRVNJWkUpOw0KKwlpZiAocGFnZV9zaXplIDwgMCkg
LyogU3lzdGVtIGRvZXNuJ3Qga25vdyBzbyAuLi4gKi8NCisJCXBhZ2Vfc2l6
ZSA9IDQwOTY7IC8qIC4uLiB3ZSBtYWtlIGFuIGVkdWNhdGVkIGd1ZXNzICov
DQorCWlmIChwYWdlX3NpemUgIT0gNDA5NikNCisJCXdhcm5fcGFnZV9zaXpl
ID0gMTsgLyogd2FybiB1c2VyIGlmIHBhZ2Ugc2l6ZSBub3QgNDA5NiAqLw0K
Kw0KIAl3aGlsZSAoKG9wdCA9IGdldG9wdF9sb25nKGFyZ2MsIGFyZ3YsDQog
CQkJCQkiRDpkOnI6czpvOnFVUGZoP3ZWZTpsYnA6Om5jOm06eDpYOkx0eTpp
OiIsIGxvbmdfb3B0aW9ucywgJmMpKSA+PSAwKQ0KIAl7DQpAQCAtMTY0Miw2
ICsxNjQ5LDcgQEANCiANCiAJCQljYXNlICdzJzoNCiAJCQkJcGFnZV9zaXpl
ID0gc3RydG9sKG9wdGFyZywgTlVMTCwgMCk7DQorCQkJCXdhcm5fcGFnZV9z
aXplID0gMDsgLyogc2V0IGJ5IHVzZXIsIHNvIGRvbid0IG5lZWQgdG8gd2Fy
biAqLw0KIAkJCQlicmVhazsNCiANCiAJCQljYXNlICdvJzoNCkBAIC0xODAw
LDYgKzE4MDgsMTAgQEANCiAjZW5kaWYNCiAJCX0NCiAJfQ0KKwlpZiAod2Fy
bl9wYWdlX3NpemUpIHsNCisJCWVycm9yX21zZygiUGFnZSBzaXplIGZvciB0
aGlzIHN5c3RlbSBpcyBieSBkZWZhdWx0ICVkIiwgcGFnZV9zaXplKTsNCisJ
CWVycm9yX21zZygiVXNlIHRoZSAtLXBhZ2VzaXplPVNJWkUgb3B0aW9uIGlm
IHRoaXMgaXMgbm90IHdoYXQgeW91IHdhbnQiKTsNCisJfQ0KIAlpZiAob3V0
X2ZkID09IC0xKSB7DQogCQlpZiAoaXNhdHR5KDEpKSB7DQogCQkJZXJyb3Jf
bXNnX2FuZF9kaWUoaGVscHRleHQpOw0K

--218815243-1547530156-1198151045=:21948--
