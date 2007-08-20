Received: from rv-out-0910.google.com ([209.85.198.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMy19-0006GS-Sj
	for linux-mtd@lists.infradead.org; Sun, 19 Aug 2007 23:33:31 -0400
Received: by rv-out-0910.google.com with SMTP id c24so890951rvf
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Aug 2007 20:33:25 -0700 (PDT)
Message-ID: <46C90B84.1060208@gmail.com>
Date: Sun, 19 Aug 2007 20:33:24 -0700
From: Zac Medico <zmedico@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2 kernel dump with 2.6.22-rc7
References: <8c7950360708011141w3a716a8aua185e9f1931f17e3@mail.gmail.com>	<46C5D764.5000303@andorsystems.com>	<625fc13d0708181442k5efc6eb3g783ad32b2efdcadc@mail.gmail.com>
	<1187513787.28494.9.camel@shinybook.infradead.org>
In-Reply-To: <1187513787.28494.9.camel@shinybook.infradead.org>
Content-Type: multipart/mixed; boundary="------------070403050609000701050901"
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org,
	Joakim.Tjernlund@transmode.se, giulio fedel <giulio.fedel@andorsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070403050609000701050901
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:
> I think I'd prefer to make the can_mark_obsolete path also hold
> alloc_sem while it's doing its thing.
> 
> Giulio, please could you verify that this patch also fixes the problem?
> 
> diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
> index bc61859..664c164 100644
> --- a/fs/jffs2/write.c
> +++ b/fs/jffs2/write.c
> @@ -566,6 +566,9 @@ int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
>  		struct jffs2_full_dirent **prev = &dir_f->dents;
>  		uint32_t nhash = full_name_hash(name, namelen);
>  
> +		/* We don't actually want to reserve any space, but we do
> +		   want to be holding the alloc_sem when we write to flash */
> +		down(&c->alloc_sem);
>  		down(&dir_f->sem);
>  
>  		while ((*prev) && (*prev)->nhash <= nhash) {
> 
> 

I've tested this patch with a 2.6.23-rc3-git2 snapshot and it solves
the problem for me (see attachment for an example of what I was
experiencing).

Zac

--------------070403050609000701050901
Content-Type: text/plain;
 name="bug.txt"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="bug.txt"

S2VybmVsIEJVRyBhdCBmZmZmZmZmZjg4MjNlZWRjIFt2ZXJib3NlIGRlYnVnIGluZm8gdW5h
dmFpbGFibGVdCmludmFsaWQgb3Bjb2RlOiAwMDAwIFsxXSBQUkVFTVBUIFNNUApDUFUgMApN
b2R1bGVzIGxpbmtlZCBpbjogc3F1YXNoZnMgbG9vcCBqZmZzMiBibG9jazJtdGQgbXRkYmxv
Y2sgbXRkX2Jsa2RldnMgbXRkY2hhciBtdGQgODEzOXRvbyBlMTAwIG1paSBldmRldiBwc21v
dXNlIGNwdWZyZXFfb25kZW1hbmQgZnJlcV90YWJsZSBpcHY2IHNuZF9wY21fb3NzIHNuZF9t
aXhlcl9vc3Mgc25kX3NlcV9kdW1teSBzbmRfc2VxX29zcyBzbmRfc2VxX21pZGlfZXZlbnQg
c25kX3NlcSBzbmRfc2VxX2RldmljZSBzbmRfaW50ZWw4eDAgc25kX2FjOTdfY29kZWMgYWM5
N19idXMgc25kX3BjbSBzbmRfdGltZXIgc25kIHNvdW5kY29yZSBzbmRfcGFnZV9hbGxvYyBu
ZnNkIGV4cG9ydGZzIGxvY2tkIHN1bnJwYyBpcHRfUkVKRUNUIHh0X3RjcHVkcCBpcHRfTE9H
IHh0X2xpbWl0IGlwdF9yZWNlbnQgbmZfY29ubnRyYWNrX2lwdjQgeHRfc3RhdGUgbmZfY29u
bnRyYWNrIG5mbmV0bGluayBpcHRhYmxlX2ZpbHRlciBpcF90YWJsZXMgeF90YWJsZXMgcnRj
IHVzYmNvcmUgbnRmcyBkbV9tb2QKUGlkOiA3Mzc5LCBjb21tOiByc3luYyBOb3QgdGFpbnRl
ZCAyLjYuMjMtcmMyLTA4MDcteDg2LTY0ICMxClJJUDogMDAxMDpbPGZmZmZmZmZmODgyM2Vl
ZGM+XSAgWzxmZmZmZmZmZjg4MjNlZWRjPl0gOmpmZnMyOmpmZnMyX2xpbmtfbm9kZV9yZWYr
MHgxZC8weDE1MwpSU1A6IDAwMDA6ZmZmZjgxMDAzODU0N2MzOCAgRUZMQUdTOiAwMDIxMDI0
NgpSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmYzIwMDAwOGNlZjQwIFJDWDogZmZm
ZjgxMDAzODBiYjViMApSRFg6IDAwMDAwMDAwMDFlYThkZmYgUlNJOiBmZmZmYzIwMDAwOGNl
ZjQwIFJESTogZmZmZjgxMDAzN2RiYTAwMApSQlA6IGZmZmY4MTAwMzg1NDdjNjggUjA4OiBm
ZmZmODEwMDM4MGJiNWIwIFIwOTogMDAwMDAwMDAwMDAwMDA0NApSMTA6IDAwMDAwMDAwMDAw
MDAwNDQgUjExOiAwMDAwMDAwMDAwMjAwMjk2IFIxMjogZmZmZjgxMDAzN2RiYTAwMApSMTM6
IDAwMDAwMDAwMDAwMDAwNDQgUjE0OiBmZmZmODEwMDM3ZGJhMTg4IFIxNTogZmZmZjgxMDAz
ODBiYjViMApGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZmZmZmY4MDU4MTAw
MCgwMDYzKSBrbmxHUzowMDAwMDAwMGY3Yzc0OGQwCkNTOiAgMDAxMCBEUzogMDAyYiBFUzog
MDAyYiBDUjA6IDAwMDAwMDAwODAwNTAwM2IKQ1IyOiAwMDAwMDAwMGY2OWZhMDAwIENSMzog
MDAwMDAwMDAzZWQzNTAwMCBDUjQ6IDAwMDAwMDAwMDAwMDA2ZTAKRFIwOiAwMDAwMDAwMDAw
MDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKRFIz
OiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZmMGZmMCBEUjc6IDAwMDAwMDAw
MDAwMDA0MDAKUHJvY2VzcyByc3luYyAocGlkOiA3Mzc5LCB0aHJlYWRpbmZvIGZmZmY4MTAw
Mzg1NDYwMDAsIHRhc2sgZmZmZjgxMDAyMDI2MDhhMCkKU3RhY2s6ICAwMDAwMDAwMDAwMDAw
MDAxIGZmZmZmZmZmZmZmZmZmMTAgZmZmZmZmZmY4MDI4MGJjZSBmZmZmYzIwMDAwOGNlZjQw
CiBmZmZmODEwMDM3ZGJhMDAwIDAwMDAwMDAwMDFlYThkZmYgZmZmZjgxMDAzODU0N2NhOCBm
ZmZmZmZmZjg4MjQwNTQwCiAwMDAwMDA0NDM4YjRjY2E4IDAwMDAwMDAwMDFlYThkZmMgMDAw
MDAwMDAwMDAwMDAwMCBmZmZmODEwMDM3ZGJhMDAwCkNhbGwgVHJhY2U6CiBbPGZmZmZmZmZm
ODAyODBiY2U+XSBrbWVtX2NhY2hlX2FsbG9jKzB4NDkvMHg2ZgogWzxmZmZmZmZmZjg4MjQw
NTQwPl0gOmpmZnMyOmpmZnMyX2FkZF9waHlzaWNhbF9ub2RlX3JlZisweDllLzB4MTI5CiBb
PGZmZmZmZmZmODgyNDJlOTI+XSA6amZmczI6amZmczJfd3JpdGVfZG5vZGUrMHgyZDAvMHgz
MzcKIFs8ZmZmZmZmZmY4ODI0N2QwNj5dIDpqZmZzMjpqZmZzMl9kb19zZXRhdHRyKzB4Mzg1
LzB4NTJkCiBbPGZmZmZmZmZmODAyMzllZWU+XSBjdXJyZW50X2ZzX3RpbWUrMHgyMi8weDI5
CiBbPGZmZmZmZmZmODgyNDdmMzE+XSA6amZmczI6amZmczJfc2V0YXR0cisweGQvMHhmCiBb
PGZmZmZmZmZmODAyOThiMjI+XSBub3RpZnlfY2hhbmdlKzB4MTYwLzB4MzBlCiBbPGZmZmZm
ZmZmODAyODMxYmY+XSBzeXNfZmNobW9kYXQrMHhhYy8weGQ1CiBbPGZmZmZmZmZmODAyOWEx
YmE+XSBtbnRwdXRfbm9fZXhwaXJlKzB4MjAvMHhhMgogWzxmZmZmZmZmZjgwMjI0Y2JhPl0g
c3lzMzJfbHN0YXQ2NCsweDI5LzB4MzQKIFs8ZmZmZmZmZmY4MDI4MzFmYj5dIHN5c19jaG1v
ZCsweDEzLzB4MTUKIFs8ZmZmZmZmZmY4MDIyNDVjMj5dIGlhMzJfc3lzcmV0KzB4MC8weGEK

--------------070403050609000701050901--
