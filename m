Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCZjP-0003de-Lo
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 18:03:24 +0000
Received: by mail-ie0-f178.google.com with SMTP id c13so6624837ieb.9
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 10:03:22 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 4 Mar 2013 13:03:20 -0500
Message-ID: <CAGNmLEN8OJw5AmbGE2LHoWMRdb8tTh4ySojnFbSY6ZY1EfgWmQ@mail.gmail.com>
Subject: [PATCH] mtd omap2 driver fix IOERR
From: Toan Pham <tpham3783@gmail.com>
To: jzhang@ti.com
Content-Type: multipart/mixed; boundary=e89a8f3bb0671bf86304d71d2cae
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--e89a8f3bb0671bf86304d71d2cae
Content-Type: multipart/alternative; boundary=e89a8f3bb0671bf85f04d71d2cac

--e89a8f3bb0671bf85f04d71d2cac
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I am running the omap2 nand driver on kernel 2.6.39 and i am having a
problem formatting JFFS2 filesystem.  Normal flash erase by issuing
"flash_erase /dev/mtd4 0 0" would work fine.  However, nand erase with
JFFS2 formatting by issuing "flash_erase -j /dev/mtd4 0 0"  would fail with
IO errors.  Below is the description of the error generated from
mtd-utils-1.4.9 or mtd-utils-1.5.0.

localhost# flash_erase -j /dev/mtd4 0 0

Erasing 128 Kibyte @ 1f920000 -- 99 % complete libmtd: error!: MEMERASE64
ioctl failed for eraseblock 4041 (mtd4)
        error 5 (Input/output error)
flash_erase: error!: /dev/mtd4: MTD Erase failure
             error 5 (Input/output error)
Erasing 128 Kibyte @ 1f940000 -- 99 % complete libmtd: error!: MEMERASE64
ioctl failed for eraseblock 4042 (mtd4)
        error 5 (Input/output error)
flash_erase: error!: /dev/mtd4: MTD Erase failure
             error 5 (Input/output error)
etc......

Attached is a bug fix to properly use Jiffies tick timer.  Previous code
was buggy b/c it did not account for scheduler tick (HZ) to be less than
50HZ.  When kernel config HZ tick is set below 50HZ, the omap driver does
not wait at all after executing a status request command, because:

timeo += (HZ * 20) / 1000;

evaluates to zero.  Again, this bug should only surface when HZ is set
below 50Hz.


thank you,

Toan

--e89a8f3bb0671bf85f04d71d2cac
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<br><br>I am running the omap2 nand driver on kernel 2.6.39 and i am=
 having a problem formatting JFFS2 filesystem.=A0 Normal flash erase by iss=
uing &quot;flash_erase /dev/mtd4 0 0&quot; would work fine.=A0 However, nan=
d erase with JFFS2 formatting by issuing &quot;flash_erase -j /dev/mtd4 0 0=
&quot;=A0 would fail with IO errors.=A0 Below is the description of the err=
or generated from mtd-utils-1.4.9 or mtd-utils-1.5.0.<br>
<br>localhost# flash_erase -j /dev/mtd4 0 0<br><br>Erasing 128 Kibyte @ 1f9=
20000 -- 99 % complete libmtd: error!: MEMERASE64 ioctl failed for eraseblo=
ck 4041 (mtd4)<br>=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/output error)<br>fla=
sh_erase: error!: /dev/mtd4: MTD Erase failure<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/output error)<br>Erasin=
g 128 Kibyte @ 1f940000 -- 99 % complete libmtd: error!: MEMERASE64 ioctl f=
ailed for eraseblock 4042 (mtd4)<br>=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/ou=
tput error)<br>flash_erase: error!: /dev/mtd4: MTD Erase failure<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error 5 (Input/output error)<br>etc...=
...<br><br>Attached is a bug fix to properly use Jiffies tick timer.=A0 Pre=
vious code was buggy b/c it did not account for scheduler tick (HZ) to be l=
ess than 50HZ.=A0 When kernel config HZ tick is set below 50HZ, the omap dr=
iver does not wait at all after executing a status request command, because=
:<br>
<br>timeo +=3D (HZ * 20) / 1000;<br><br>evaluates to zero.=A0 Again, this b=
ug should only surface when HZ is set below 50Hz.<br><br><br>thank you,<br>=
<br>Toan<br><br>

--e89a8f3bb0671bf85f04d71d2cac--

--e89a8f3bb0671bf86304d71d2cae
Content-Type: application/octet-stream; name="nand_omap2_IOERR.patch"
Content-Disposition: attachment; filename="nand_omap2_IOERR.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hdvxo6l60

LS0tIGRyaXZlcnMvbXRkL25hbmQvb21hcDIuYy5vcmlnCTIwMTMtMDItMjggMTg6MTc6MDEuMDAw
MDAwMDAwIC0wNTAwCisrKyBkcml2ZXJzL210ZC9uYW5kL29tYXAyLmMJMjAxMy0wMy0wNCAxMjoz
NzowMC4wMDAwMDAwMDAgLTA1MDAKQEAgLTg4OCw5ICs4ODgsOSBAQAogCWludCBzdGF0dXMgPSBO
QU5EX1NUQVRVU19GQUlMLCBzdGF0ZSA9IHRoaXMtPnN0YXRlOwogCiAJaWYgKHN0YXRlID09IEZM
X0VSQVNJTkcpCi0JCXRpbWVvICs9IChIWiAqIDQwMCkgLyAxMDAwOwotCWVsc2UKLQkJdGltZW8g
Kz0gKEhaICogMjApIC8gMTAwMDsKKyAgICAgICAgICAgICAgICB0aW1lbyArPSBtc2Vjc190b19q
aWZmaWVzKDQwMCk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgICB0aW1lbyArPSBtc2Vj
c190b19qaWZmaWVzKDIwKTsKIAogCWdwbWNfbmFuZF93cml0ZShpbmZvLT5ncG1jX2NzLAogCQkJ
R1BNQ19OQU5EX0NPTU1BTkQsIChOQU5EX0NNRF9TVEFUVVMgJiAweEZGKSk7Cg==
--e89a8f3bb0671bf86304d71d2cae--
