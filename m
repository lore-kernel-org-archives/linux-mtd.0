Received: from zproxy.gmail.com ([64.233.162.197])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8bqq-0001wt-L8
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 06:54:30 -0400
Received: by zproxy.gmail.com with SMTP id s18so298378nze
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Aug 2005 03:54:22 -0700 (PDT)
Message-ID: <82e4189c05082603546248689a@mail.gmail.com>
Date: Fri, 26 Aug 2005 15:54:22 +0500
From: Adil Hafeez <adilhafeez80@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5748_2625876.1125053662173"
Subject: Flash erase wait time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_5748_2625876.1125053662173
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I am using a custom mips board that includes 8 MB Am29LV641D flash
chip. This chip is 16-bit, has 128 sectors of 64k each.

This flash is memory mapped and starts at address 1c40:0000. I can
read the flash using dd utility. But I cannot erase flash. Erase
operation using 'eraseall' utility doesnt take more than 6 seconds to
finish and erases only first two blocks i.e. 128k. Whereas, full flash
erase from our custom developed flash utlity takes 60 seconds to erase
flash.

Then after hacking into cmd cfi commad set. The erase issue was fixed by=20
adding a while loop for checking polarity bit in do_erase_oneblock function=
.

while (!sectorDone) {
    unsigned volatile short *flash_addr =3D adr + map->map_priv_1;
    if( (*flash_addr) & 0x0080 )
        sectorDone =3D 1;
}

Was it really required to double check the polarity bit, or there are
some timeout timer issues with my mips port ?


- Adil

------=_Part_5748_2625876.1125053662173
Content-Type: application/octet-stream; name="erase_all_fix.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="erase_all_fix.patch"

SW5kZXg6IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jDQo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpS
Q1MgZmlsZTogL2hvbWUvZW1iZWRkZWQvbGludXgtMi40LjIwX3BhbG1jaGlwL2RyaXZlcnMvbXRk
L2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jLHYNCnJldHJpZXZpbmcgcmV2aXNpb24gMS4xDQpkaWZm
IC1yMS4xIGNmaV9jbWRzZXRfMDAwMi5jDQoyNDBjMjQwDQo8ICAgICAgICAgICAgICAgY2ZpLT5m
YXN0X3Byb2cgPSAwOw0KLS0tDQo+ICAgICAgICAgICAgICAgY2ZpLT5mYXN0X3Byb2cgPSAxOw0K
ODk3YTg5OA0KPg0KOTc1YTk3Nyw5ODkNCj4gICAgIHsNCj4gICAgIGludCBzZWN0b3JEb25lID0g
MDsNCj4gICAgIHdoaWxlICghc2VjdG9yRG9uZSkgew0KPiAgICAgICAgIHVuc2lnbmVkIHZvbGF0
aWxlIHNob3J0ICpmbGFzaF9hZGRyID0gYWRyICsgbWFwLT5tYXBfcHJpdl8xOw0KPiAgICAgICAg
IGlmKCAoKmZsYXNoX2FkZHIpICYgMHgwMDgwICkgIHsNCj4gICAgICAgICAgICAgICAgIHNlY3Rv
ckRvbmUgPSAxOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBlbHNlIHsNCj4gICAgICAgICB9DQo+
DQo+ICAgICB9DQo+ICAgICB9DQo+DQoxMTI1YTExNDANCj4NCg==
------=_Part_5748_2625876.1125053662173--
