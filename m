Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14iyXY-0007af-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 14:02:08 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14iyXT-0007a9-00
	for mtd@infradead.org; Fri, 30 Mar 2001 14:02:03 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id PAA29449
	for <mtd@infradead.org>; Fri, 30 Mar 2001 15:01:15 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <mtd@infradead.org>
Subject: Nand Flash & JFFS
Date: Fri, 30 Mar 2001 15:01:55 +0200
Message-ID: <000f01c0b919$99886e30$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0010_01C0B92A.5D113E30"
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A9125@kolkrabbi.flaga.is>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0010_01C0B92A.5D113E30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi all

We are buliding a custom PPC860 board, which will use JFFS/JFFS2 as a root
file system which will hold all files we need. The FS must survive sudden
power loss.
My plan was to use NOR flash(128MB or more)which will partioned into a
Firmware/boot, 
raw linux kernel partition(if we can't find a boot SW will can boot linux
from JFFS) and the rest
will linux root FS with our apps.

Now, our HW guy wants to put NAND flash on since it is cheaper and has
higher density.
I dont think it's a good idea to have boot code in NAND flash due to the
possibility of
bad blocks, so I envision a board with a NOR flash as boot device and then
we could use NAND for a raw linux kernel partition and JFFS partition.

Is this a good idea?

Does JFFS/MTD support NAND flashes well yet?
Can it handle bad blocks?
Which chip models?
Which geometries are supported(4x8, 2x8 1x8)?
Can RedBoot(when JFFS support has been impl.) read a kernel from JFFS
and boot it?   

  Regards
           Joakim Tjernlund

------=_NextPart_000_0010_01C0B92A.5D113E30
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IjgNAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANEHAwAeAA8AAQAAAAUADgEB
A5AGAJQHAAAlAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADAC4AAAAAAAMANgAA
AAAAHgBwAAEAAAASAAAATmFuZCBGbGFzaCAmIEpGRlMAAAACAXEAAQAAABYAAAABwLkZmOiOxmcL
Bw1KOqg2k5bkHZNYAAACAR0MAQAAACIAAABTTVRQOkpPQUtJTS5USkVSTkxVTkRATFVNRU5USVMu
U0UAAAALAAEOAAAAAEAABg4ATrR3GbnAAQIBCg4BAAAAGAAAAAAAAAAcXUkejweGRZqdZW9TFZa8
4oAAAAMAFA4BAAAACwAfDgEAAAACAQkQAQAAAIADAAB8AwAAWwUAAExaRnWpQwHSAwAKAHJjcGcx
MjXiMgNDdGV4BUEBAwH3/wqAAqQD5AcTAoAP8wBQBFY/CFUHshElDlEDAQIAY2jhCsBzZXQyBgAG
wxEl9jMERhO3MBIsETMI7wn3tjsYHw4wNREiDGBjAFAzCwkBZDM2FlALpiBIfGkgB0AYAAqxCoQK
gFcGZR0QGCAgYnVsaQpkC4BnHRAgY3VzgnQDcCBQUEM4HDFDBuALESwgd2gN4GgfIHADEAMgH0Ae
IEpGRuxTLyFyFEBhBCAfEANgNG90HVRmAxAeIHN5rR9QZR+AIIloBvBkHRJWICMSBCB3HiBuCeBk
MC4gVGgeICGQIG1HH0EjUAhwdml2I0F15mQBAAOgcG8lcAXAF7DlBBAuHVRNeSegC2ADoI53IiEf
YCEjTk9SJQARC2BzaCgOIDhNQm4gBbEEYBggKSCJCrF0dmkCIAmAIAuAKYEfEEbYaXJtKUAYIC8G
4CKQMyBgHVRyYQfgHqBudWh4IGsEkWUsBSxSKGsGkCViYwBwJwVAIxBu7ySxIAEikAYAVyDUMJEx
VLcuxANSIWMpHRAxEXQmEf8YIB9QHVQg4y7EInImMgPwzzQQKuAIcB0QcHAoRh1ULk4nwCBgNnJI
McBndU8o0ClAAjApY3B1BUBOeEFORCokKuADoACQbr5jHiAv0CywBCAT0GU2sN8SgTPSE+AEICCQ
ZyYQBcDTJ3EAkHR5KFVJPJACIas0AQuAazrBJyIyZyKA/yyhAQAfECmBE+AnETFjBaD3AQAssTmK
ZApQKXI0EiewuQQQaWIDEDzhKuBmHVQMYmEksAJgb2Nrc/0gYHMpkD2ACfAm8ACQOkH/MUILETYU
HxAp9yISMWMBAP8m8DqhM9ULkDSkMHEIYCSh/ymzOaMFsSJRLp8vpjPDIXK7L4g2+0kpYSCQPos/
HVrMRG8HkSFzTVQ5wCbA3zbAF8E5iSVDIQF5FCBOpf5DA5E60RPgMRAjMUNYTqW+VyCTE9AFICsR
AQBsVAz8Z2UDcBQgCIEiMR5RUFWhCYAoNHg4IGAyWABUIDFYAClSKVIJgEJ9IoEoIIAngUvDUFY7
8mLrCeEssG0LUC4zsBggQ2F/HxAvJTMnHVQz0jFjL9A/XiBeoB1aXqBZcGcLEXNrXzZgh0ogIGsH
cCXwai8EkQpAMRAdVH1ioB4AQhABAAAAPAAAADxFQURCMTBCQUMyNjZBMTRBODVFQ0JGODY4NkE3
M0UzMTBBOTEyNUBrb2xrcmFiYmkuZmxhZ2EuaXM+AAMACVkBAAAAAwAAgAggBgAAAAAAwAAAAAAA
AEYAAAAAEIUAAAAAAAADAAiACCAGAAAAAADAAAAAAAAARgAAAABShQAAfW4BAB4ACYAIIAYAAAAA
AMAAAAAAAABGAAAAAFSFAAABAAAABAAAADkuMAALAAqACCAGAAAAAADAAAAAAAAARgAAAAAGhQAA
AAAAAAMAC4AIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAACwAQgAggBgAAAAAAwAAAAAAAAEYA
AAAAA4UAAAAAAAALABWACCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAAAAMAFoAIIAYAAAAAAMAA
AAAAAABGAAAAABGFAAAAAAAAAwAYgAggBgAAAAAAwAAAAAAAAEYAAAAAGIUAAAAAAAACAfgPAQAA
ABAAAAAcXUkejweGRZqdZW9TFZa8AgH6DwEAAAAQAAAAHF1JHo8HhkWanWVvUxWWvAIB+w8BAAAA
eAAAAAAAAAA4obsQBeUQGqG7CAArKlbCAABtc3BzdC5kbGwAAAAAAE5JVEH5v7gBAKoAN9luAAAA
QzpcRG9jdW1lbnRzIGFuZCBTZXR0aW5nc1xKb2FraW0gVGplcm5sdW5kXG91dGxvb2t0ZXN0XG91
dHRlc3QucHN0AAMA/g8FAAAAAwANNP03AAACAX8AAQAAADEAAAAwMDAwMDAwMDFDNUQ0OTFFOEYw
Nzg2NDU5QTlENjU2RjUzMTU5NkJDMDRGMDNEMDAAAAAAAwAGECsUWY0DAAcQDgMAAAMAEBAAAAAA
AwAREAAAAAAeAAgQAQAAAGUAAABISUFMTFdFQVJFQlVMSURJTkdBQ1VTVE9NUFBDODYwQk9BUkQs
V0hJQ0hXSUxMVVNFSkZGUy9KRkZTMkFTQVJPT1RGSUxFU1lTVEVNV0hJQ0hXSUxMSE9MREFMTEZJ
TEVTV0VOAAAAADXD

------=_NextPart_000_0010_01C0B92A.5D113E30--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
