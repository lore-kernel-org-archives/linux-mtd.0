Received: from web20725.mail.yahoo.com ([216.136.226.107])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Algfx-00019o-Km
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2004 03:47:37 +0000
Message-ID: <20040128034734.77883.qmail@web20725.mail.yahoo.com>
Date: Tue, 27 Jan 2004 19:47:34 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-636223974-1075261654=:74496"
Subject: 64 bit bus access on a customed MPC8245 board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0-636223974-1075261654=:74496
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Hi,

I'm working on a customed MPC8245 board with flash
chip Am29LV320 and trying to enable MTD driver
support.

The configuration is 32 bit bus width in each chip
with 2 chips interleaved. So CONFIG_MTD_CFI_B8 and
CONFIG_MTD_CFI_I2 are defined.

MPC8245 requires the following memory mapping:
bank 0: 0xFF800000 - 0xFFFFFFFF
bank 1: 0xFF000000 - 0xFF7FFFFF

I noticed that FPU must be enabled for 64-bit
read/write from/to flash.

I use read64() and write64() functions in the
attachment, which are copied from sbc8240.c. However
no chip can be found. Any suggestions? Thank you very
much.

The message is shown below.

mpc8245:Probing 0x00800000 at 0xff800000
mpc8245_write64 adr 0xff800000 data 0x000000f0000000f0
mpc8245_write64 adr 0xff8002a8 data 0x0000009800000098
mpc8245_read64 ofs 0xff800080 result
0xffffffffffffffff
CFI: Found no mpc8245 Flash Bank #0 device at location
zero
mpc8245:Probing 0x00800000 at 0xff000000
mpc8245_write64 adr 0xff000000 data 0x000000f0000000f0
mpc8245_write64 adr 0xff0002a8 data 0x0000009800000098
mpc8245_read64 ofs 0xff000080 result
0xffffffffffffffff
CFI: Found no MPC8245 Flash Bank #1 device at location
zero
mpc8245:No suppported flash chips found!

-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
--0-636223974-1075261654=:74496
Content-Type: application/octet-stream; name="flash.c"
Content-Transfer-Encoding: base64
Content-Description: flash.c
Content-Disposition: attachment; filename="flash.c"

X191NjQgbXBjODI0NV9yZWFkNjQoc3RydWN0IG1hcF9pbmZvICptYXAsIHVu
c2lnbmVkIGxvbmcgb2ZzKQp7Cgl1bnNpZ25lZCBsb25nIGZsYWdzLCBtc3Is
IHNhdmVkX21zcjsKCXZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgKnA7CgoJc2F2
ZV9mbGFncyhmbGFncyk7CgljbGkoKTsKCgkvKiB0dXJuIG9mZiBmbG9hdGlu
ZyBwb2ludCB1bmF2YWlsYWJsZSBleGNlcHRpb25zICovCgoJX19hc21fXyBf
X3ZvbGF0aWxlX18gKAoJCSJtZm1zciAlMCIgCgkJOiAiPXIiIChtc3IpIDop
OwoKCXNhdmVkX21zciA9IG1zcjsKCW1zciB8PSBNU1JfRlA7Cgltc3IgJj0g
fihNU1JfRkUwIHwgTVNSX0ZFMSk7CgoJX19hc21fXyBfX3ZvbGF0aWxlX18g
KAoJCSJtdG1zciAlMFxuIgoJCSJpc3luY1xuIgoJCTogOiAiciIgKG1zcikp
OwoKCS8qIHJlYWQgdGhlIGRhdGEgdmlhIGEgZmxvYXRpbmcgcG9pbnQgcmVn
aXN0ZXIgKi8KCglvZnMgPSBtYXAtPm1hcF9wcml2XzEgKyBvZnM7CglwID0g
KHVuc2lnbmVkIGxvbmcgKikgJnJlc3VsdDY0OwoKCV9fYXNtX18gX192b2xh
dGlsZV9fICgKCQkibGZkICAxLDAoJTEpXG4iCgkJInN0ZmQgMSwwKCUwKVxu
IgoJCTogOiAiciIgKHApLCAiciIgKG9mcykKCQkpOwoKCS8qIHJlc3RvcmUg
c3RhdGUgKi8KCglfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCgkJIm10bXNyICUw
XG4iCgkJImlzeW5jXG4iCgkJOiA6ICJyIiAoc2F2ZWRfbXNyKSk7CgoJcmVz
dG9yZV9mbGFncyhmbGFncyk7CgoJcCA9ICh1bnNpZ25lZCBsb25nICopICZy
ZXN1bHQ2NDsKCWRlYnVnaygibXBjODI0NV9yZWFkNjQgb2ZzIDB4JXggcmVz
dWx0IDB4JTA4eCUwOHhcbiIsIG9mcywgKnAsICoocCsxKSk7CgoJcmV0dXJu
IHJlc3VsdDY0Owp9Cg0Kdm9pZCBtcGM4MjQ1X3dyaXRlNjQoc3RydWN0IG1h
cF9pbmZvICptYXAsIF9fdTY0IGQsIHVuc2lnbmVkIGxvbmcgYWRyKQp7Cgl1
bnNpZ25lZCBsb25nIGxvbmcgdG1wOwoJdW5zaWduZWQgbG9uZyBmbGFncywg
bXNyLCBzYXZlZF9tc3IsICpwOwoJdm9sYXRpbGUgbG9uZyBzYXZlZF9mclsy
XTsKCglzYXZlX2ZsYWdzKGZsYWdzKTsKCWNsaSgpOwoKCS8qIHR1cm4gb2Zm
IGZsb2F0aW5nIHBvaW50IHVuYXZhaWxhYmxlIGV4Y2VwdGlvbnMgKi8KCglf
X2FzbV9fIF9fdm9sYXRpbGVfXyAoCgkJIm1mbXNyICUwIiAKCQk6ICI9ciIg
KG1zcikgOik7CgoJc2F2ZWRfbXNyID0gbXNyOwoJbXNyIHw9IE1TUl9GUDsK
CW1zciAmPSB+KE1TUl9GRTAgfCBNU1JfRkUxKTsKCglfX2FzbV9fIF9fdm9s
YXRpbGVfXyAoCgkJIm10bXNyICUwXG4iCgkJImlzeW5jXG4iCgkJOiA6ICJy
IiAobXNyKSk7CgoKCS8qIHdyaXRlIHRoZSBkYXRhIHZpYSBhIGZsb2F0aW5n
IHBvaW50IHJlZ2lzdGVyICovCgoJdG1wID0gZDsKCXAgPSAodW5zaWduZWQg
bG9uZyAqKSAmdG1wOwoJYWRyID0gbWFwLT5tYXBfcHJpdl8xICsgYWRyOwoJ
ZGVidWdrKCJtcGM4MjQ1X3dyaXRlNjQgYWRyIDB4JXggZGF0YSAweCUwOHgl
MDh4XG4iLCBhZHIsICpwLCAqKHArMSkpOwoKCV9fYXNtX18gX192b2xhdGls
ZV9fICgKCQkic3RmZCAxLDAoJTIpXG4iCgkJImxmZCAgMSwwKCUwKVxuIgoJ
CSJzdGZkIDEsMCglMSlcbiIKCQkibGZkICAxLDAoJTIpXG4iCgkJOiA6ICJy
IiAocCksICJyIiAoYWRyKSwgImIiIChzYXZlZF9mcikKCQkpOwoKCS8qIHJl
c3RvcmUgc3RhdGUgKi8KCglfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCgkJIm10
bXNyICUwXG4iCgkJImlzeW5jXG4iCgkJOiA6ICJyIiAoc2F2ZWRfbXNyKSk7
CgoJcmVzdG9yZV9mbGFncyhmbGFncyk7Cn0K

--0-636223974-1075261654=:74496--
