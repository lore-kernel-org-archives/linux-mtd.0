Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nhX4-0007QV-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 14:53:10 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nhWx-0007QP-00
	for mtd@infradead.org; Thu, 12 Apr 2001 14:53:03 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Kári Davíðsson'" <kd@flaga.is>, <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Thu, 12 Apr 2001 15:52:44 +0200
Message-ID: <009901c0c357$da1bf410$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_009A_01C0C368.9DA4C410"
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A9134@kolkrabbi.flaga.is>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------=_NextPart_000_009A_01C0C368.9DA4C410
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi

I been all the time wrong! I just discovered that hexl-mode i emacs is
broken!
Emacs in hexl-mode displays 81ff81ff81ff ... and od -x says fffffff ...

Sorry about that.

While I am at it perhaps someone can enlighten me somewhat ...

I am a bit confused about how add_mtd_device() and add_mtd_partitions()
work.
Looking in nora.c it looks like you can partition a flash by doing 
a few calls to add_mtd_device() with different offsets, but if you can do
that with add_mtd_device(), what's the point with add_mtd_partitions()?

I am missing something here, can someone explain when and how you are
supposed to
use these two functions?

 Jocke



-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of Kári Davíðsson
Sent: Thursday, April 12, 2001 14:42
To: mtd@infradead.org
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 




> -----Original Message-----
> From: Joakim Tjernlund [mailto:joakim.tjernlund@lumentis.se]
> Sent: 11. apríl 2001 15:05
> To: mtd@infradead.org
> Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 

<snip>
 
3) 2 partitions( tried a few different sizes) - Not OK, here I get
81ff81ff81ff ... !

You get this behaviour for both partitions? Also one that has all
sectors of the same size?

<snip>

> 
> Apparently this is chip with 2 erase sectors sizes. I suspect 
> the different
> sector sizes
> is the cause to my problems, but I cant figure out where the 
> problem is. I
> have
> tried with&whithout virtual regions.

Get it to work without the viertual regions. Then add the virtual
regions if you need them. Stricly speeking you anly need them if you
have a partition that you need to manage that crosses erase region
boundary. It is hightly experimental code
that has only be tested on my single 16bit wide Intel chip so it is
bound to fail
on more complex setups.

K.D.

<snip>


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

------=_NextPart_000_009A_01C0C368.9DA4C410
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
0CwQKBt4Sy5EKBt8Xx4FaAAg+0mQR5BiBPIekDxwESAmkfYiqYloMiKZVGNgCyADcBZvaH8d4X2t
0B4AQhABAAAAPAAAADxFQURCMTBCQUMyNjZBMTRBODVFQ0JGODY4NkE3M0UzMTBBOTEzNEBrb2xr
cmFiYmkuZmxhZ2EuaXM+AAMACVkBAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAAD
AAiACCAGAAAAAADAAAAAAAAARgAAAABShQAAfW4BAB4ACYAIIAYAAAAAAMAAAAAAAABGAAAAAFSF
AAABAAAABAAAADkuMAALAAqACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAAMAC4AIIAYAAAAA
AMAAAAAAAABGAAAAAAGFAAAAAAAACwAQgAggBgAAAAAAwAAAAAAAAEYAAAAAA4UAAAAAAAALABWA
CCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAAAAMAFoAIIAYAAAAAAMAAAAAAAABGAAAAABGFAAAA
AAAAAwAYgAggBgAAAAAAwAAAAAAAAEYAAAAAGIUAAAAAAAACAfgPAQAAABAAAAAcXUkejweGRZqd
ZW9TFZa8AgH6DwEAAAAQAAAAHF1JHo8HhkWanWVvUxWWvAIB+w8BAAAAeAAAAAAAAAA4obsQBeUQ
GqG7CAArKlbCAABtc3BzdC5kbGwAAAAAAE5JVEH5v7gBAKoAN9luAAAAQzpcRG9jdW1lbnRzIGFu
ZCBTZXR0aW5nc1xKb2FraW0gVGplcm5sdW5kXG91dGxvb2t0ZXN0XG91dHRlc3QucHN0AAMA/g8F
AAAAAwANNP03AAACAX8AAQAAADEAAAAwMDAwMDAwMDFDNUQ0OTFFOEYwNzg2NDU5QTlENjU2RjUz
MTU5NkJDQzQxNTNFMDAAAAAAAwAGEKsqjg8DAAcQ+QUAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAA
AGUAAABISUlCRUVOQUxMVEhFVElNRVdST05HSUpVU1RESVNDT1ZFUkVEVEhBVEhFWEwtTU9ERUlF
TUFDU0lTQlJPS0VORU1BQ1NJTkhFWEwtTU9ERURJU1BMQVlTODFGRjgxRkY4MUZGAAAAABe1

------=_NextPart_000_009A_01C0C368.9DA4C410--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
