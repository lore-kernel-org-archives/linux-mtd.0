Received: from mail.presenzia.net ([193.127.102.120])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ebzgg-0002i5-RK
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 07:13:27 -0500
From: "Daniel Alomar" <dalomar@serrasold.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 15 Nov 2005 13:12:12 +0100
Message-ID: <003c01c5e9dd$d57d9ab0$091a1bac@serra.es>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_003D_01C5E9E6.374202B0"
Subject: Mtd under kernel 2.6
Reply-To: dalomar@serrasold.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


------=_NextPart_000_003D_01C5E9E6.374202B0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="US-ASCII"

Hi,

My name is Daniel Alomar, and I'm working in to an embedded linux (Coldfire
5282) with mtd drivers. I have a problem, and I wonder if this list could
help me.... (I hope).

I'm trying to port a board from kernel 2.4 to 2.6. I'm using uClinux and
with the 2.4 Kernel I have no problem to use the flash. (I have 8 Mb flash.
An Intel strata flash 28F640J3). I put my own device driver, but when I
boot, my system doesn't detect the flash chip.

This is my 2.4 output:
======================
.....
fec.c: Probe number 1 with 0x0000
eth0: FEC ENET Version 0.2, 00:50:dd:00:4e:61
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
uclinux[mtd]: RAM probe address=0x11d4c8 size=0x208000
uclinux[mtd]: root filesystem index=0
avnet5282 flash device: 200000 at ff800000
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
Creating 3 MTD partitions on "AVNET5282 flash device":
0x00000000-0x00040000 : "uboot (256 KB)"
0x00040000-0x00340000 : "kernel (3 MB)"
0x00340000-0x00800000 : "rootfs (4,75 MB)"
...

And this my 2.6 output:
=======================
...
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth%d: FEC ENET Version 0.2, 00:50:dd:00:2a:35
PPP generic driver version 2.4.2
FEC: No PHY device found.
Using cfq io scheduler
uclinux[mtd]: RAM probe address=0x14a180 size=0x218000
Creating 1 MTD partitions on "RAM":
0x00000000-0x00218000 : "ROMfs"
uclinux[mtd]: set ROMfs to be root filesystem
MCF5282 flash device: 200000 at ff800000
CFI: Found no SERRA 5282 flash device device at location zero
NET: Registered protocol family 

It seems 2.6 can't detect my flash device, and uClinux creates the
partition from the uclinux.c instead the one from avnet5282.c. I can't 
understand why with 2.4 use the avnet5282.c partitions but with 2.6 use 
the uclinux.c one.

Somebody have 2cents??

Daniel Alomar i Claramonte
Research & Development Electronic Dept.
SERRA SOLDADURA, S.A.
WEB Site: http://www.serrasold.com
Knowledge Site: http://serratron.serrasold.com 

------=_NextPart_000_003D_01C5E9E6.374202B0
Content-Type: application/octet-stream;
	name="avnet5282.c"
Content-Disposition: attachment;
	filename="avnet5282.c"
Content-Transfer-Encoding: base64

LyoKICoKICogTm9ybWFsIG1hcHBpbmdzIG9mIGNoaXBzIGluIHBoeXNpY2FsIG1lbW9yeQogKi8K
I2luY2x1ZGUgPGxpbnV4L2NvbmZpZy5oPgojaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgojaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+CiNpbmNsdWRlIDxhc20vaW8uaD4KI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQu
aD4KI2luY2x1ZGUgPGxpbnV4L210ZC9tYXAuaD4KI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRp
b25zLmg+CgojZGVmaW5lIFdJTkRPV19BRERSIDB4ZmY4MDAwMDAKI2RlZmluZSBXSU5ET1dfU0la
RSAweDgwMDAwMAojZGVmaW5lIEJVU1dJRFRIIDIKCi8qKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqLwoKc3RhdGljIHN0cnVjdCBtdGRfcGFydGl0aW9uIGF2bmV0NTI4Ml9wYXJ0aXRpb25zW10g
PSB7CiAgICAgICAgewoJCS5uYW1lCT0JInVib290ICgyNTYgS0IpIiwKCQkuc2l6ZQk9CTB4NDAw
MDAsCgkJLm9mZnNldAk9CTB4MAogICAgICAgIH0sCiAgICAgICAgewoJCS5uYW1lCT0JImtlcm5l
bCAoMyBNQikiLAoJCS5zaXplCT0JMHgzMDAwMDAsCgkJLm9mZnNldAk9CTB4NDAwMDAKICAgICAg
ICB9LAogICAgICAgIHsKCQkubmFtZQk9CSJyb290ZnMgKDQsNzUgTUIpIiwKCQkuc2l6ZQk9CTB4
NEMwMDAwLAoJCS5vZmZzZXQJPQkweDM0MDAwMAogICAgICAgIH0KfTsKCiNkZWZpbmUgTlVNX1BB
UlRJVElPTlMgKHNpemVvZihhdm5ldDUyODJfcGFydGl0aW9ucykgLyBzaXplb2YgKGF2bmV0NTI4
Ml9wYXJ0aXRpb25zWzBdKSkKCi8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwoKc3RydWN0
IG1hcF9pbmZvIGF2bmV0NTI4Ml9tYXAgPSB7CgkubmFtZQkJPQkiU0VSUkEgNTI4MiBmbGFzaCBk
ZXZpY2UiLAoJLnNpemUJCT0JV0lORE9XX1NJWkUsCgkuYmFua3dpZHRoCT0JQlVTV0lEVEgsCn07
CgpzdGF0aWMgc3RydWN0IG10ZF9pbmZvICpteW10ZDsKCi8qKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqLwoKI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IDB4MjAyMTIgJiYgZGVmaW5lZChNT0RV
TEUpCiNkZWZpbmUgaW5pdF9hdm5ldDUyODIgaW5pdF9tb2R1bGUKI2RlZmluZSBjbGVhbnVwX2F2
bmV0NTI4MiBjbGVhbnVwX21vZHVsZQojZW5kaWYKCmludCBfX2luaXQgaW5pdF9hdm5ldDUyODIo
dm9pZCkKewoJcHJpbnRrKEtFUk5fTk9USUNFICJNQ0Y1MjgyIGZsYXNoIGRldmljZTogJXggYXQg
JXhcbiIsIFdJTkRPV19TSVpFLCBXSU5ET1dfQUREUik7CiAgICAgICAgYXZuZXQ1MjgyX21hcC5t
YXBfcHJpdl8xID0gKHVuc2lnbmVkIGxvbmcpaW9yZW1hcChXSU5ET1dfQUREUiwgV0lORE9XX1NJ
WkUpOwoJCglzaW1wbGVfbWFwX2luaXQoJmF2bmV0NTI4Ml9tYXApOwoJCiAgICAgICAgLyppZiAo
IWF2bmV0NTI4Ml9tYXAubWFwX3ByaXZfMSkgewogICAgICAgICAgICAgICAgcHJpbnRrKCJGYWls
ZWQgdG8gaW9yZW1hcFxuIik7CiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTzsKICAgICAgICB9
Ki8KICAgICAgICBteW10ZCA9IGRvX21hcF9wcm9iZSgiY2ZpX3Byb2JlIiwgJmF2bmV0NTI4Ml9t
YXApOwogICAgICAgIC8qaWYgKG15bXRkKSB7CiAgICAgICAgICAgICAgICBteW10ZC0+b3duZXIg
PSBUSElTX01PRFVMRTsKICAgICAgICAgICAgICAgIG15bXRkLT5lcmFzZXNpemUgPSAweDQwMDAw
OwogICAgICAgICAgICAgICAgcmV0dXJuIGFkZF9tdGRfcGFydGl0aW9ucyhteW10ZCwgYXZuZXQ1
MjgyX3BhcnRpdGlvbnMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZihhdm5ldDUyODJfcGFydGl0aW9ucykgLwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IG10ZF9wYXJ0aXRpb24pKTsKICAgICAgICB9
CiAgICAgICAgaW91bm1hcCgodm9pZCAqKWF2bmV0NTI4Ml9tYXAubWFwX3ByaXZfMSk7Ki8KCWlm
KCFteW10ZCkgcmV0dXJuIC1FTlhJTzsKCW15bXRkLT5vd25lciA9IFRISVNfTU9EVUxFOwoJCglh
ZGRfbXRkX3BhcnRpdGlvbnMobXltdGQsIGF2bmV0NTI4Ml9wYXJ0aXRpb25zLCBOVU1fUEFSVElU
SU9OUyk7CiAgICAgICAgcmV0dXJuIDA7Cn0KCi8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
LwoKc3RhdGljIHZvaWQgX19leGl0IGNsZWFudXBfYXZuZXQ1MjgyKHZvaWQpCnsKICAgICAgICBp
ZiAobXltdGQpIHsKICAgICAgICAgICAgICAgIGRlbF9tdGRfcGFydGl0aW9ucyhteW10ZCk7CiAg
ICAgICAgICAgICAgICBtYXBfZGVzdHJveShteW10ZCk7CiAgICAgICAgfQogICAgICAgIGlmIChh
dm5ldDUyODJfbWFwLm1hcF9wcml2XzEpIHsKICAgICAgICAgICAgICAgIGlvdW5tYXAoKHZvaWQg
Kilhdm5ldDUyODJfbWFwLm1hcF9wcml2XzEpOwogICAgICAgICAgICAgICAgYXZuZXQ1MjgyX21h
cC5tYXBfcHJpdl8xID0gMDsKICAgICAgICB9Cn0KCi8qKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqLwoKbW9kdWxlX2luaXQoaW5pdF9hdm5ldDUyODIpOwptb2R1bGVfZXhpdChjbGVhbnVwX2F2
bmV0NTI4Mik7CgpNT0RVTEVfQVVUSE9SKCJEYW5pZWwgQWxvbWFyIGkgQ2xhcmFtb250ZSIpOwpN
T0RVTEVfREVTQ1JJUFRJT04oIk1hcGVqYXQgWGlwIEZsYXNoIDI4RjY0MEpBIik7Ck1PRFVMRV9M
SUNFTlNFKCJHUEwiKTsKCi8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo=


------=_NextPart_000_003D_01C5E9E6.374202B0--
