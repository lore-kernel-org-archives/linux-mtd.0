Received: from ip101.enterness.net ([195.138.130.101] helo=empdc.emness)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JwUw-0006Fv-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2001 13:20:15 +0100
Received: from ronin (ronin.emness [192.168.10.19])
	by empdc.emness (8.11.2/8.9.3) with SMTP id f6ACR1f03973
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2001 15:27:01 +0300
Content-Type: Multipart/Mixed;
  charset="windows-1251";
  boundary="------------Boundary-00=_3MP9Y11PVSE6MY7OXNW5"
From: Anton Todorov <a.todorov@emness.com>
To: linux-mtd@lists.infradead.org
Subject: MTD on MBX860
Date: Tue, 10 Jul 2001 15:22:51 -0200
MIME-Version: 1.0
Message-Id: <01071015225100.01159@ronin>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--------------Boundary-00=_3MP9Y11PVSE6MY7OXNW5
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: 8bit

Hi,

I am using linuxppc_2_4 (2.4.6) with current mtd support from cvs tree.
The board is with JEDEC AMD 29F016 x4 flash chips (8M Flash space).
Map file which I use for this board is attached (I use rpxlite.c and 
tqm8xxl.c (for partitioning) as reference).
The problem I found is that mtd says:

"mtd: Failed. Cannot handle unsymetric banking"

I enabled some debug info in jedec.c (uncommenting some printks and add some) 
and found that it is looking for banked and find bank[0] is 8M bank[1] is 0M  
- realy unsymetric :)
but I think it is linear flash.
I worarounded it commentig one condition:

--- jedec.c.orig        Tue Jul 10 10:06:41 2001
+++ jedec.c     Tue Jul 10 10:07:41 2001
@@ -159,7 +159,7 @@
       are empty banks. Note, the last bank does not count here, only the
       first banks are important. Holes on non-bank boundaries can not exist
       due to the way the detection algorithm works. */
-   if (priv.size < my_bank_size)
+/*   if (priv.size < my_bank_size) */
       my_bank_size = priv.size;
    priv.is_banked = 0;
    //printk("priv.size is %x, my_bank_size is %x\n",priv.size,my_bank_size);

but I think it is not the right action ...

now flash and partitioning(I think ) is working:
fromm booting kernel:
<>
Motorola MBX flash device: 800000 at fe000000
        MTD Part: MBX flash 4*[AMD Am29F016]
MTD->erasesize is 40000
MTD->size is 800000
mtd: Giving out device 0 to MBX flash
Creating 3 MTD partitions on "MBX flash":
0x00000000-0x00080000 : "MBX flash BOOT partition"
mtd: Giving out device 1 to MBX flash BOOT partition
0x00080000-0x00600000 : "MBX flash DATA partition"
mtd: Giving out device 2 to MBX flash DATA partition
0x00600000-0x00800000 : "MBX flash APPLICATION partition"
mtd: Giving out device 3 to MBX flash APPLICATION partition
<>
sh-2.03# ./mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0
 
sh-2.03# ./mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 524288 (512K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0
 
sh-2.03# ./mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 5767168 (5M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0
 
sh-2.03# ./mtd_debug info /dev/mtd3
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 2097152 (2M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

I managed to mount /dev/mtdblock3 as jffs and can create and delete files 
there.

My question is why jedec driver find it as banked?
maybe it is my fault in mbx860.c map file?
My patch is not the right solution curently I will add some ifdefs
to comment patched line when I am using MBX board.
also I found that the einfo utility is not working on this board
it says:
<>
sh-2.03# ./einfo /dev/mtd0
Device /dev/mtd0 has 0 erase regions
<>
but mtd_debug util is working ass seen above.
I have RPX Classic board with CFI AMD flash and same binary is working.

comments?

Best Regards,
Anton Todorov
Emness Technology
--------------Boundary-00=_3MP9Y11PVSE6MY7OXNW5
Content-Type: text/x-c;
  charset="windows-1251";
  name="mbx860.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mbx860.c"

LyoKICogJElkOiBtYnguYyx2IDEuMCAyMDAxLzA2LzE4IDE1OjQwOjIzIGFudG9uIEV4cCAkCiAq
CiAqIEhhbmRsZSBtYXBwaW5nIG9mIHRoZSBmbGFzaCBvbiBNQlggYm9hcmRzCiAqLwoKI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgojaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPgojaW5jbHVkZSA8YXNtL2lvLmg+CiNpbmNsdWRlIDxsaW51eC9tdGQvbXRk
Lmg+CiNpbmNsdWRlIDxsaW51eC9tdGQvbWFwLmg+CiNpbmNsdWRlIDxsaW51eC9tdGQvcGFydGl0
aW9ucy5oPgoKCiNkZWZpbmUgV0lORE9XX0FERFIgMHhmZTAwMDAwMAojZGVmaW5lIFdJTkRPV19T
SVpFIDB4MDAyMDAwMDAKCi8qIEZsYXNoIC8gUGFydGl0aW9uIHNpemluZyAqLwojZGVmaW5lIE1B
WF9TSVpFX0tpQiAgICAgICAgICAgICAgODE5MgojZGVmaW5lIEJPT1RfUEFSVElUSU9OX1NJWkVf
S2lCICAgIDUxMgojZGVmaW5lIEtFUk5FTF9QQVJUSVRJT05fU0laRV9LaUIgNTYzMgojZGVmaW5l
IEFQUF9QQVJUSVRJT05fU0laRV9LaUIgICAgMjA0OAoKI2RlZmluZSBOVU1fUEFSVElUSU9OUyAz
CgovKiBwYXJ0aXRpb25faW5mbyBnaXZlcyBkZXRhaWxzIG9uIHRoZSBsb2dpY2FsIHBhcnRpdGlv
bnMgdGhhdCB0aGUgc3BsaXQgdGhlCiAqIHNpbmdsZSBmbGFzaCBkZXZpY2UgaW50by4gSWYgdGhl
IHNpemUgaWYgemVybyB3ZSB1c2UgdXAgdG8gdGhlIGVuZCBvZiB0aGUKICogZGV2aWNlLiAqLwpz
dGF0aWMgc3RydWN0IG10ZF9wYXJ0aXRpb24gcGFydGl0aW9uX2luZm9bXT17Cgl7IG5hbWU6ICJN
QlggZmxhc2ggQk9PVCBwYXJ0aXRpb24iLAoJb2Zmc2V0OiAwLAoJc2l6ZTogICBCT09UX1BBUlRJ
VElPTl9TSVpFX0tpQioxMDI0IH0sCgl7IG5hbWU6ICJNQlggZmxhc2ggREFUQSBwYXJ0aXRpb24i
LAoJb2Zmc2V0OiBCT09UX1BBUlRJVElPTl9TSVpFX0tpQioxMDI0LAoJc2l6ZTogKEtFUk5FTF9Q
QVJUSVRJT05fU0laRV9LaUIpKjEwMjQgfSwKCXsgbmFtZTogIk1CWCBmbGFzaCBBUFBMSUNBVElP
TiBwYXJ0aXRpb24iLAoJb2Zmc2V0OiAoQk9PVF9QQVJUSVRJT05fU0laRV9LaUIrS0VSTkVMX1BB
UlRJVElPTl9TSVpFX0tpQikqMTAyNCB9Cn07CgkJCQkgICAKCnN0YXRpYyBzdHJ1Y3QgbXRkX2lu
Zm8gKm15bXRkOwoKX191OCBtYnhfcmVhZDgoc3RydWN0IG1hcF9pbmZvICptYXAsIHVuc2lnbmVk
IGxvbmcgb2ZzKQp7CglyZXR1cm4gcmVhZGIobWFwLT5tYXBfcHJpdl8xICsgb2ZzKTsKfQoKX191
MTYgbWJ4X3JlYWQxNihzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgdW5zaWduZWQgbG9uZyBvZnMpCnsK
CXJldHVybiByZWFkdyhtYXAtPm1hcF9wcml2XzEgKyBvZnMpOwp9CgpfX3UzMiBtYnhfcmVhZDMy
KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCB1bnNpZ25lZCBsb25nIG9mcykKewoJcmV0dXJuIHJlYWRs
KG1hcC0+bWFwX3ByaXZfMSArIG9mcyk7Cn0KCnZvaWQgbWJ4X2NvcHlfZnJvbShzdHJ1Y3QgbWFw
X2luZm8gKm1hcCwgdm9pZCAqdG8sIHVuc2lnbmVkIGxvbmcgZnJvbSwgc3NpemVfdCBsZW4pCnsK
CW1lbWNweV9mcm9taW8odG8sICh2b2lkICopKG1hcC0+bWFwX3ByaXZfMSArIGZyb20pLCBsZW4p
Owp9Cgp2b2lkIG1ieF93cml0ZTgoc3RydWN0IG1hcF9pbmZvICptYXAsIF9fdTggZCwgdW5zaWdu
ZWQgbG9uZyBhZHIpCnsKCXdyaXRlYihkLCBtYXAtPm1hcF9wcml2XzEgKyBhZHIpOwp9Cgp2b2lk
IG1ieF93cml0ZTE2KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBfX3UxNiBkLCB1bnNpZ25lZCBsb25n
IGFkcikKewoJd3JpdGV3KGQsIG1hcC0+bWFwX3ByaXZfMSArIGFkcik7Cn0KCnZvaWQgbWJ4X3dy
aXRlMzIoc3RydWN0IG1hcF9pbmZvICptYXAsIF9fdTMyIGQsIHVuc2lnbmVkIGxvbmcgYWRyKQp7
Cgl3cml0ZWwoZCwgbWFwLT5tYXBfcHJpdl8xICsgYWRyKTsKfQoKdm9pZCBtYnhfY29weV90byhz
dHJ1Y3QgbWFwX2luZm8gKm1hcCwgdW5zaWduZWQgbG9uZyB0bywgY29uc3Qgdm9pZCAqZnJvbSwg
c3NpemVfdCBsZW4pCnsKCW1lbWNweV90b2lvKCh2b2lkICopKG1hcC0+bWFwX3ByaXZfMSArIHRv
KSwgZnJvbSwgbGVuKTsKfQoKc3RydWN0IG1hcF9pbmZvIG1ieF9tYXAgPSB7CgluYW1lOiAiTUJY
IGZsYXNoIiwKCXNpemU6IFdJTkRPV19TSVpFLAoJYnVzd2lkdGg6IDQsCglyZWFkODogbWJ4X3Jl
YWQ4LAoJcmVhZDE2OiBtYnhfcmVhZDE2LAoJcmVhZDMyOiBtYnhfcmVhZDMyLAoJY29weV9mcm9t
OiBtYnhfY29weV9mcm9tLAoJd3JpdGU4OiBtYnhfd3JpdGU4LAoJd3JpdGUxNjogbWJ4X3dyaXRl
MTYsCgl3cml0ZTMyOiBtYnhfd3JpdGUzMiwKCWNvcHlfdG86IG1ieF9jb3B5X3RvCn07CgojaWYg
TElOVVhfVkVSU0lPTl9DT0RFIDwgMHgyMDIxMiAmJiBkZWZpbmVkKE1PRFVMRSkKI2RlZmluZSBp
bml0X21ieCBpbml0X21vZHVsZQojZGVmaW5lIGNsZWFudXBfbWJ4IGNsZWFudXBfbW9kdWxlCiNl
bmRpZgoKaW50IF9faW5pdCBpbml0X21ieCh2b2lkKQp7CglwcmludGsoS0VSTl9OT1RJQ0UgIk1v
dG9yb2xhIE1CWCBmbGFzaCBkZXZpY2U6ICV4IGF0ICV4XG4iLCBXSU5ET1dfU0laRSo0LCBXSU5E
T1dfQUREUik7CgltYnhfbWFwLm1hcF9wcml2XzEgPSAodW5zaWduZWQgbG9uZylpb3JlbWFwKFdJ
TkRPV19BRERSLCBXSU5ET1dfU0laRSAqIDQpOwoKCWlmICghbWJ4X21hcC5tYXBfcHJpdl8xKSB7
CgkJcHJpbnRrKCJGYWlsZWQgdG8gaW9yZW1hcFxuIik7CgkJcmV0dXJuIC1FSU87Cgl9CglteW10
ZCA9IGRvX21hcF9wcm9iZSgiamVkZWMiLCAmbWJ4X21hcCk7CglpZiAobXltdGQpIHsKCQlteW10
ZC0+bW9kdWxlID0gVEhJU19NT0RVTEU7CgkJYWRkX210ZF9kZXZpY2UobXltdGQpOwogICAgICAg
ICAgICAgICAgYWRkX210ZF9wYXJ0aXRpb25zKG15bXRkLCBwYXJ0aXRpb25faW5mbywgTlVNX1BB
UlRJVElPTlMpOwoJCXJldHVybiAwOwoJfQoKCWlvdW5tYXAoKHZvaWQgKiltYnhfbWFwLm1hcF9w
cml2XzEpOwoJcmV0dXJuIC1FTlhJTzsKfQoKc3RhdGljIHZvaWQgX19leGl0IGNsZWFudXBfbWJ4
KHZvaWQpCnsKCWlmIChteW10ZCkgewoJCWRlbF9tdGRfZGV2aWNlKG15bXRkKTsKCQltYXBfZGVz
dHJveShteW10ZCk7Cgl9CglpZiAobWJ4X21hcC5tYXBfcHJpdl8xKSB7CgkJaW91bm1hcCgodm9p
ZCAqKW1ieF9tYXAubWFwX3ByaXZfMSk7CgkJbWJ4X21hcC5tYXBfcHJpdl8xID0gMDsKCX0KfQoK
bW9kdWxlX2luaXQoaW5pdF9tYngpOwptb2R1bGVfZXhpdChjbGVhbnVwX21ieCk7Cg==

--------------Boundary-00=_3MP9Y11PVSE6MY7OXNW5--
