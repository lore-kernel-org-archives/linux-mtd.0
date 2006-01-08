Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EvYZi-0001mP-EJ
	for linux-mtd@lists.infradead.org; Sun, 08 Jan 2006 06:19:06 -0500
Received: by zproxy.gmail.com with SMTP id i11so3280394nzi
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Jan 2006 03:19:01 -0800 (PST)
Message-ID: <417f1b740601080319i7aa999faye73f096a05686009@mail.gmail.com>
Date: Sun, 8 Jan 2006 16:49:00 +0530
From: Pramod P K <pra.engr@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0601060802n2710bc26wf57b8c0578cc1c7f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_15985_22137166.1136719140514"
References: <417f1b740601052237w84b78dbqf2cb44d4f8ffdeee@mail.gmail.com>
	<625fc13d0601060802n2710bc26wf57b8c0578cc1c7f@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Bad eraseblock" and "Failed ECC read"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_15985_22137166.1136719140514
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks Josh.

> 1) This shows u-boot failing, not MTD/JFFS2.  This has been sent to
> the wrong list.

Sorry .. for less info...

Actually it fails at ECC of U-Boot.. Exactly at bad-block-table
creation step. Isnt it related to MTD?
Bt code is by someone from   linutronix.de

> 2)...
> what version of the kernel, what version of MTD, what board you are
> even using.

Linux- 2.6.10
Actually I dont know the version of the MTD.. sorry.. No body, even
who gave it knows !!!

Plz find attached log file

Thanks,
pramod


On 1/6/06, Josh Boyer <jwboyer@gmail.com> wrote:
> On 1/6/06, Pramod P K <pra.engr@gmail.com> wrote:
> > This is the MTD NAND with JFFS2 and after I flash I get:
> >
> >
> > My U-Boot v0.1
> >
> > .......
> >
> >
> > NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB
> > 1,8V 8-bit)
> > Scanning device for bad blocks
> > ....
> > ....
> >
> > check_short_pattern: p[td->offs + i]: ff td->pattern[i]: ff
> >
> > ...
> >
> > check_short_pattern: p[td->offs + i]: 84 td->pattern[i]: ff
> > Bad eraseblock 96 at 0x00c00000
> >
> > td->len:2
> > check_short_pattern: p[td->offs + i]: 23 td->pattern[i]: ff
> > Bad eraseblock 97 at 0x00c20000
> >
> > .....
> >
> > NAND flash probing at 0x20020000 Finished
> > In:    console
> > Out:   console
> > Err:   console
> > Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0
> >
> > Loading from device 0: NAND 128MiB 1,8V 8-bit at 0x200b8000 (offset 0xd=
00000)
> >
> > .....
> >
> > : do_nandboot(): ecc_status=3D-1
> > nand_read_ecc: Failed ECC read, page 0x00001a00
> >
> > .....
> >
> > : do_nandboot(): ecc_status=3D-1
> > nand_read_ecc: Failed ECC read, page 0x00001a00
> >
> > ...
> >
> > ** Read error on 0
> > Boot reached stage -1
> >
> >
> >
> > Please come with the possibilities.
>
> 1) This shows u-boot failing, not MTD/JFFS2.  This has been sent to
> the wrong list.
>
> 2) The amount of information is so small that nobody would even know
> where to begin to look if it were a MTD/JFFS2 problem.  You don't say
> what version of the kernel, what version of MTD, what board you are
> even using.
>
> I seriously doubt anybody will even think of coming up with
> possiblities for you unless you give way more detailed information
> that is relevant to MTD/JFFS2.
>
> josh
>


--
----------------------------------------------------------------
  PRAMOD P. K.,
  pra.engr@gmail.com
  pra_engr@yahoo.co.in

  CDMA: 91- 9242195490.
----------------------------------------------------------------

------=_Part_15985_22137166.1136719140514
Content-Type: text/plain; name="Jan5-630.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Jan5-630.txt"

NDMyMTANCk15IFUtQm9vdCB2MC4xK9Blt7Cj27PO9Dbgs4qUWTnwNuGJ/TZ66Yo4cpoJkl2Cdn10
6Y+nqlywwUmS/zs2o529crlI3LzBwrRgg5QNCvCzOLo40O2ZT4Ndx3ugh8OYlYuLmpZli1pkmqOj
dMKfW5FOVzZg8/05eKG7tnl2mtkq2CxVo+f666uGKlFFlK8+cMEJ2a6no2CzzpUNCrvffjSQ/A0K
DQpVLUJvb3QgMS4xLjEgKEphbiAgNSAyMDA2IC0gMjI6Mjc6NTEpDQoNClUtQm9vdCBjb2RlOiA4
MUVDMDAwMCAtPiA4MUVGNzU3OCAgQlNTOiAtPiA4MUVGOEM5NA0KU0RSQU0gOiA2NE0gZGV0ZWN0
ZWQgDQpEZXRlY3RpbmcgY2hpcCByZXZpc2lvbi4uLg0KU3V6aSBSMkIgYm9vdHN0cmFwIFNXIHZl
cnNpb24gNA0KUkFNIENvbmZpZ3VyYXRpb246DQpCYW5rICMwOiA4MDAwMDAwMCA2MCBNQg0KQmFu
ayAjMTogMDAwMDAwMDAgIDAga0INCkZsYXNoOiAgMCBrQg0KTkFORDogKiogKipTYW5kaXNrIE1M
QyBjb250cm9sbGVyIG9uIHBueDQwMDgsIFBJTyBtb2RlLCBzb2Z0d2FyZSBFQ0MNCg0KDQoqKlBL
OnNlbGVjdGVkIHRoZSBkZXZpY2UNCg0KTkFORCBkZXZpY2U6IE1hbnVmYWN0dXJlciBJRDogMHhl
YywgQ2hpcCBJRDogMHhhMSAoU2Ftc3VuZyBOQU5EIDEyOE1pQiAxLDhWIDgtYmkNCnQpDQoNCnRo
aXMtPm9wdGlvbnM9MzIyMTQ4NzY0NWQNCg0KaWYgKG10ZC0+b29iYmxvY2sgPiA1MTIpDQpTY2Fu
bmluZyBkZXZpY2UgZm9yIGJhZCBibG9ja3MNCg0KY2hlY2tfc2hvcnRfcGF0dGVybjogcFt0ZC0+
b2ZmcyArIGldOiA4NCB0ZC0+cGF0dGVybltpXTpmZiANCkJhZCBlcmFzZWJsb2NrIDk2IGF0IDB4
MDBjMDAwMDANCg0KY2hlY2tfc2hvcnRfcGF0dGVybjogcFt0ZC0+b2ZmcyArIGldOiAyYyB0ZC0+
cGF0dGVybltpXTpmZiANCkJhZCBlcmFzZWJsb2NrIDk3IGF0IDB4MDBjMjAwMDANClJOOiBOQU5E
IGZsYXNoIHByb2JpbmcgYXQgMHgyMDAyMDAwMCBGaW5pc2hlZA0KSW46ICAgIGNvbnNvbGUNCk91
dDogICBjb25zb2xlDQpFcnI6ICAgY29uc29sZQ0KSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9v
dDogIDIgCAgIIDEgCAgIIDAgDQoNCkxvYWRpbmcgZnJvbSBkZXZpY2UgMDogTkFORCAxMjhNaUIg
MSw4ViA4LWJpdCBhdCAweDIwMGI4MDAwIChvZmZzZXQgMHhkMDAwMDApDQoNCkRlYyAyMDogbmFu
ZF9pc2JhZF9iYnQ6IHRoaXMtPmJidF9lcmFzZV9zaGlmdD0xNyBibG9jaz0yMDgNCg0KRGVjIDIw
OiBuYW5kX2lzYmFkX2JidDogcmVzPTANCg0KY21kICYgTkFORFJXX1JFQUQ6IDENCkphbiA1OiBk
b19uYW5kYm9vdCgpOiBlY2Nfc3RhdHVzPTANCg0KSmFuIDU6IGRvX25hbmRib290KCk6IGVjY19z
dGF0dXM9LTENCm5hbmRfcmVhZF9lY2M6IEZhaWxlZCBFQ0MgcmVhZCwgcGFnZSAweDAwMDAxYTAw
DQoNCkphbiA1OiBkb19uYW5kYm9vdCgpOiBlY2Nfc3RhdHVzPTANCg0KSmFuIDU6IGRvX25hbmRi
b290KCk6IGVjY19zdGF0dXM9MA0KDQpKYW4gNTogZG9fbmFuZGJvb3QoKTogZWNjX3N0YXR1cz0w
DQoNCkphbiA1OiBkb19uYW5kYm9vdCgpOiBlY2Nfc3RhdHVzPS0xDQpuYW5kX3JlYWRfZWNjOiBG
YWlsZWQgRUNDIHJlYWQsIHBhZ2UgMHgwMDAwMWEwMA0KDQpKYW4gNTogZG9fbmFuZGJvb3QoKTog
ZWNjX3N0YXR1cz0wDQoNCkphbiA1OiBkb19uYW5kYm9vdCgpOiBlY2Nfc3RhdHVzPTANCg0KaWYg
KHJldCkqKiBSZWFkIGVycm9yIG9uIDANCkJvb3QgcmVhY2hlZCBzdGFnZSAtMQ0KUmVvZG9yICMg

------=_Part_15985_22137166.1136719140514--
