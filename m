Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uzOO-0007jZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 17:22:21 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Wed, 2 May 2001 16:22:35 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Wed, 2 May 2001 16:22:35 +0000
content-class: urn:content-classes:message
Subject: RE: Flash driver probe/commandset separation. 
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C0D324.1862EAFC"
Date: Wed, 2 May 2001 16:22:34 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A915A@kolkrabbi.flaga.is>
From: =?Windows-1252?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Nicolas Pitre" <nico@cam.org>
Cc: <linux-mtd@lists.infradead.org>
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C0D324.1862EAFC
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I am adapting a new bootloader to our modules and do not have time at
the moment to fix and test the virtual region stuff. If you want to send
stuff to
Linus soon I suggest simply to revert to the original code (before
virtual regions), and I will add the virtual regions stuff again soon.
I wouldn't be supprised if I was the only one using the virtual regions
anyway, so no harm done if it does not make it just jet in the offical
kernel (or am I wrong?).

K.D.

-----Original Message-----
From:	David Woodhouse
Sent:	Wed 5/2/2001 3:39 PM
To:	Nicolas Pitre
Cc:	linux-mtd@lists.infradead.org; ahennessy@mvista.com;
ds@schleef.org; jonas.holmberg@axis.com; cwryu@debian.org;
eauth@softsys.co.at
Subject:	Re: Flash driver probe/commandset separation.=20


nico@cam.org said:
>  Personally I think it would be best to send the curent code to Linus
> and resend another update eventually when the new stuff would have
> been proven stable.

> 	"release early, release often"=20

Yes, you're probably right.

TODO list then:

	1. Make cfi_cmdset_000[12].c compile again :)
	2. Fix the partition stuff as discussed, removing VIRTUAL_ER
	3. Sanity check DiskOnChip and NFTL drivers.=20

Anything else?

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/










------_=_NextPart_001_01C0D324.1862EAFC
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IiMQAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEALwAAAFJFOiBGbGFzaCBkcml2ZXIg
cHJvYmUvY29tbWFuZHNldCBzZXBhcmF0aW9uLiAAwRABBYADAA4AAADRBwUAAgAQABYAIgADACoB
ASCAAwAOAAAA0QcFAAIAEAAWACIAAwAqAQEJgAEAIQAAAEQyREFEMDVGQzUwRUMyNEJBQUQ0MURF
NjJCMjEwMUJCAGgHAQOQBgAEDAAANwAAAAMANgAAAAAAQAA5APzqYhgk08ABHgA9AAEAAAAFAAAA
UkU6IAAAAAACAUcAAQAAAC8AAABjPUlTO2E9IDtwPUZsYWdhO2w9S09MS1JBQkJJLTAxMDUwMjE2
MjIzNFotNzIyAAAeAEkAAQAAAC8AAABSZTogRmxhc2ggZHJpdmVyIHByb2JlL2NvbW1hbmRzZXQg
c2VwYXJhdGlvbi4gAABAAE4AgLatHB7TwAEeAFoAAQAAABAAAABEYXZpZCBXb29kaG91c2UAAgFb
AAEAAABBAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAARGF2aWQgV29vZGhvdXNlAFNNVFAAZHdt
dzJAaW5mcmFkZWFkLm9yZwAAAAACAVwAAQAAABkAAABTTVRQOkRXTVcyQElORlJBREVBRC5PUkcA
AAAAHgBdAAEAAAAQAAAARGF2aWQgV29vZGhvdXNlAAIBXgABAAAAQQAAAAAAAACBKx+kvqMQGZ1u
AN0BD1QCAAAAAERhdmlkIFdvb2Rob3VzZQBTTVRQAGR3bXcyQGluZnJhZGVhZC5vcmcAAAAAAgFf
AAEAAAAZAAAAU01UUDpEV01XMkBJTkZSQURFQUQuT1JHAAAAAB4AZgABAAAABQAAAFNNVFAAAAAA
HgBnAAEAAAAUAAAAZHdtdzJAaW5mcmFkZWFkLm9yZwAeAGgAAQAAAAUAAABTTVRQAAAAAB4AaQAB
AAAAFAAAAGR3bXcyQGluZnJhZGVhZC5vcmcAHgBwAAEAAAArAAAARmxhc2ggZHJpdmVyIHByb2Jl
L2NvbW1hbmRzZXQgc2VwYXJhdGlvbi4gAAACAXEAAQAAABsAAAABwNMh9A1nH9njpJhOr4vswLh6
m2REAAAp22EAHgBzAAEAAACEAAAAbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGFoZW5u
ZXNzeUBtdmlzdGEuY29tOyBkc0BzY2hsZWVmLm9yZzsgam9uYXMuaG9sbWJlcmdAYXhpcy5jb207
IGN3cnl1QGRlYmlhbi5vcmc7IGVhdXRoQHNvZnRzeXMuY28uYXQAHgB0AAEAAAAOAAAATmljb2xh
cyBQaXRyZQAAAB4AGgwBAAAADwAAAEvhcmkgRGF27fBzc29uAAAeAB0OAQAAACsAAABGbGFzaCBk
cml2ZXIgcHJvYmUvY29tbWFuZHNldCBzZXBhcmF0aW9uLiAAAAIBCRABAAAA0QQAAM0EAABqBwAA
TFpGdcn+ZZ8DAAoAcmNwZzEyNWIyA0N0ZXgFQQECMf8B9wqAAqQD5AcTAoAP8wBQfwRWCFUHshEl
DlEDAQIAY8JoCsBzZXQyBgAGw+0RJTMERhO3MBIsETMI720J9zsYHw4wNREiDGBj5wBQCwkBZDM2
FlARcwvxcCBIaSwKogqECoBJyCBhbR3wZGEFMAuAMmcd8CBuB9EG4G90RxewHjASgXRvIAhhIBkE
YXVsB5EAcGQgZJUf4G4fQCAT4HZlH8DnB3Ed8AVAdGghoARgB4BjAjAfwmZpeCCzDrBzqSIkdmkA
IHUHQCAYIFRnaQIgICPAdQEgLiAgSWYgeQhgIHd/AHAi0xQQINElIx/BHSRMdQuAdQQgcx8wA6Ad
4HNYdWdnI7IAkG0LUHl/H8IYICGQACAfwiJCBbBpHSTQbiSBBaABACAoYscBEAWwJB5zKSwgsx3g
/QPwbAMgHjAjgSQPJ/Em46xhZwtxKAMuHYZ3CGBwbGRuJwVAK3AocXC+cAUQFBAg4AaQLTJhBCD9
KkNuKUECICGgJ+Aegi3/6wYxAHB5JgB5LOAoECEhvSFhch4QIQAzUTIhaQVAbyEAB5EhMgDAazaB
BUBq/yfgN/EUIDIQA6AqQwEgDeDXJIE3sASgZQMgKAWxHgFnLUEDYB6QPykwNR0kS1QuRDsLLTzS
TyqWTbUHkHMvkGU80x0kRgNhUjoMgiBEIYBpIOBX+R8wZGgIYBQQHSQGYAIwRT8UVzHxNS8yQbAw
ADAxIDM6MzkgpFBNHSRUbz8UTg3gOwbwMoFQNtAYIB0kQ2MlPxRsJ8F4LQ6gZEDzRTAjwHMuC4AD
UB+BHjCyLgWwZzsd8CJQbh7gMQQQeUBtJDAjwGEuRQWgbUcAZHNABPBotyCAARBGxGoCIDKALkAQ
hmwG0ASQZ0BheAQARUgkYzqQeXVAAQBi7wcwMCBG00aQdSJASKA5EDVGAHlKoi4iEEBldWIFOGBj
QPVSZTogRl1DwWgg8AUQKcEgMbBv/StwL0gxA4FIgDhxFBAKsX8iECThJXAdKh0kAwAFoEDdOVBt
RsIlEAtwZD8QHTP8PiBCcASQKBAq0SlBHeD7IkALgGs2wjDDMUIrcCPC+yZlIkJjCHAisisTH9En
s/9TtiDCGCAmgwBwH0AiUAXA/zGQHkAOsEwgIZACMCRxKUH+d0cxIjMe4ibUVaQhclO2/ytwW3FP
oVqxJREBoCCAOwv7VBA/IyIYICCAMoBagQrAXylALOBgFkyhCfAiUWtZ9weQLOAlwScrsU+iXoEp
UAkqkWh0OwtUT0RPu0UhI8RuU6UdJT8yMSVwik03omMjIF9jbVBi0l9B8DBbDiBdSCArAU8pIAMQ
IfEvozopZnky/SVwRiMxIkIKsR5wURIvJv0EIGQEAFdABBAJgGDiBGADJDAekVZJUlRVQdBMX0VS
ZnkzJXAGEV820ClQE9AFkFVQRAQAaxZPCEBVIHAgs05GVO5MTyVGEFFrQTUwVRIeoBs50BQQPzwc
HSRkd23udw5QUY8dJF92n3eveL/HeOAnWCNATVREbHYk4j8AwAMQHoJF0h0kZDB0cNg6Ly9F30bg
L3uiA4HbfSNGMW99IUVVL3V/gN8Lge8dUX2DkAAAAB4ANRABAAAAPAAAADxFQURCMTBCQUMyNjZB
MTRBODVFQ0JGODY4NkE3M0UzMTBBOTE1QUBrb2xrcmFiYmkuZmxhZ2EuaXM+AB4ARxABAAAADwAA
AG1lc3NhZ2UvcmZjODIyAAALAPIQAQAAAB8A8xABAAAAaAAAAFIARQAlADMAQQAgAEYAbABhAHMA
aAAgAGQAcgBpAHYAZQByACAAcAByAG8AYgBlAP/4YwBvAG0AbQBhAG4AZABzAGUAdAAgAHMAZQBw
AGEAcgBhAHQAaQBvAG4ALgAuAEUATQBMAAAACwD2EAAAAABAAAcwVCV5myLTwAFAAAgwhK9nGCTT
wAEDAN4/5AQAAAMA8T8JAAAAHgD4PwEAAAAPAAAAS+FyaSBEYXbt8HNzb24AAAIB+T8BAAAAWgAA
AAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAvTz1GTEFHQS9PVT1GSVJTVCBBRE1JTklTVFJB
VElWRSBHUk9VUC9DTj1SRUNJUElFTlRTL0NOPUtBUklEAAAAHgD6PwEAAAAVAAAAU3lzdGVtIEFk
bWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC4A
AAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1AAAAAAAMAHkAAAAAAHgAwQAEAAAAGAAAAS0FS
SUQAAAAeADFAAQAAAAYAAABLQVJJRAAAAB4AMkABAAAAFAAAAGR3bXcyQGluZnJhZGVhZC5vcmcA
HgAzQAEAAAAUAAAAZHdtdzJAaW5mcmFkZWFkLm9yZwAeADhAAQAAAAYAAABLQVJJRAAAAB4AOUAB
AAAAAgAAAC4AAAALACkAAAAAAAsAIwAAAAAAAwAGEPApyoADAAcQEwQAAAMAEBAAAAAAAwAREAAA
AAAeAAgQAQAAAGUAAABISSxJQU1BREFQVElOR0FORVdCT09UTE9BREVSVE9PVVJNT0RVTEVTQU5E
RE9OT1RIQVZFVElNRUFUVEhFTU9NRU5UVE9GSVhBTkRURVNUVEhFVklSVFVBTFJFR0lPTlNUVUZG
AAAAAAIBfwABAAAAPAAAADxFQURCMTBCQUMyNjZBMTRBODVFQ0JGODY4NkE3M0UzMTBBOTE1QUBr
b2xrcmFiYmkuZmxhZ2EuaXM+ADwr

------_=_NextPart_001_01C0D324.1862EAFC--
