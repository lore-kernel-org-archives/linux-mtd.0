Received: from nz-out-0102.google.com ([64.233.162.198])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GS87C-0002rx-6X
	for linux-mtd@lists.infradead.org; Tue, 26 Sep 2006 09:16:30 +0100
Received: by nz-out-0102.google.com with SMTP id s1so869821nze
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Sep 2006 01:15:24 -0700 (PDT)
Message-ID: <305035a40609260115ia8f04bcv94bd4c0342be4835@mail.gmail.com>
Date: Tue, 26 Sep 2006 10:15:23 +0200
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Exporting jffs2 by nfs with kernel 2.6
In-Reply-To: <305035a40609060838s253d9810id4fd549a9f8adee6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1188_27816756.1159258523856"
References: <305035a40609060838s253d9810id4fd549a9f8adee6@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_1188_27816756.1159258523856
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

On 2.4.18 we managed to export a jffs2 filesystem by nfs.
Now on 2.6.16 we can't.
I found 2 problems for it:
First, changed was made in nfs, and now they test if
s_export_op is not a void pointer. By dding a pointer on
this structure (even this structure is void) makes nfs happy.
If the structure is void nfs use generic function, so for this part
I think it's ok

Second, nfs need to identify the filesystem to export. It is done
either by the device of the filesystem or by a "fsid". I didfn't see any
filesystem use a "fsid" and I don't know how to use it. So identification
is made if FS_REQUIRES_DEV is set. The problem was in kernel 2.5.7,
this flag was removed because "We never really used the block device anyway".
Do you mind setting this flag again? Or have you a better idea?

I joined my patch which make jffs2 exportable by nfs:


PS: I sent this mail 3 weeks ago to jffs-dev@axis.com before notice
that now jffs2 is discussed on this mailing-list.
--
Gregory CLEMENT
Adeneo

------=_Part_1188_27816756.1159258523856
Content-Type: text/x-patch; name=jffs2_exported_by_nfs.patch;
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_errvm1oj
Content-Disposition: attachment; filename="jffs2_exported_by_nfs.patch"

SW5kZXg6IGxpbnV4LTIuNi4xNi9mcy9qZmZzMi9zdXBlci5jCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KZGlmZiAtdSAt
cjEuMSAtcjEuMgotLS0gbGludXgtMi42LjE2L2ZzL2pmZnMyL3N1cGVyLmMJNiBKdW4gMjAwNiAx
NjoxODoyNCAtMDAwMAkxLjEKKysrIGxpbnV4LTIuNi4xNi9mcy9qZmZzMi9zdXBlci5jCTYgU2Vw
IDIwMDYgMTQ6MTQ6MzcgLTAwMDAJMS4yCkBAIC04MCw2ICs4MCwxMCBAQAogCS5zeW5jX2ZzID0J
amZmczJfc3luY19mcywKIH07CiAKKy8qIEp1c3QgZGVjbGFyZSBhIHZvaWQgc3RydWN0dXJlIGFz
IEEgTlVMTCB2YWx1ZSBpbXBsaWVzIHRoZSBkZWZhdWx0ICovCitzdGF0aWMgc3RydWN0IGV4cG9y
dF9vcGVyYXRpb25zIGpmZnMyX2V4cG9ydF9vcHM7CisKKwogc3RhdGljIGludCBqZmZzMl9zYl9j
b21wYXJlKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IGpm
ZnMyX3NiX2luZm8gKnAgPSBkYXRhOwpAQCAtMTUwLDYgKzE1NCw3IEBACiAJc3Bpbl9sb2NrX2lu
aXQoJmMtPmlub2NhY2hlX2xvY2spOwogCiAJc2ItPnNfb3AgPSAmamZmczJfc3VwZXJfb3BlcmF0
aW9uczsKKwlzYi0+c19leHBvcnRfb3AgPSAmamZmczJfZXhwb3J0X29wczsKIAlzYi0+c19mbGFn
cyA9IGZsYWdzIHwgTVNfTk9BVElNRTsKIAogCXJldCA9IGpmZnMyX2RvX2ZpbGxfc3VwZXIoc2Is
IGRhdGEsIChmbGFncyZNU19WRVJCT1NFKT8xOjApOwpAQCAtMzE0LDYgKzMxOSw3IEBACiAJLm5h
bWUgPQkJImpmZnMyIiwKIAkuZ2V0X3NiID0JamZmczJfZ2V0X3NiLAogCS5raWxsX3NiID0JamZm
czJfa2lsbF9zYiwKKwkuZnNfZmxhZ3MgPSBGU19SRVFVSVJFU19ERVYsCiB9OwogCiBzdGF0aWMg
aW50IF9faW5pdCBpbml0X2pmZnMyX2ZzKHZvaWQpCg==
------=_Part_1188_27816756.1159258523856--
