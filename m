Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18edQc-0004nH-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 15:50:06 +0000
From: Holger Schurig <h.schurig@mn-logistik.de>
To: "George G. Davis" <gdavis@mvista.com>
Subject: Re: mkfs.jffs2 buggy?
Date: Fri, 31 Jan 2003 17:06:20 +0100
References: <200301311531.30295.h.schurig@mn-logistik.de> <3E3A9B1F.F97D9D28@mvista.com>
In-Reply-To: <3E3A9B1F.F97D9D28@mvista.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200301311706.20580.h.schurig@mn-logistik.de>
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

> > 0x6574
>
> 'At'
>
> > 0x665f
>
> 'b_'
>
> > 0x6873
>
> 'hs'
>
> > 0x3030
>
> '00'
>
> > 0x3030
>
> '00'
>
> Hmm, is that interesting or merely a coincidence?

I think this is a conincidence.


=46rom my flash-tester I had in every sector a text like this:

bdi>mdb 0x00a00000
00a00000 : 74 65 73 74 5f 66 6c 61  test_fla
00a00008 : 73 68 3a 20 30 30 61 30  sh: 00a0
00a00010 : 30 30 30 30 ff ff ff ff  0000....
00a00018 : ff ff ff ff ff ff ff ff  ........

bdi>mdb 0x00a00000
00a40000 : 74 65 73 74 5f 66 6c 61  test_fla
00a40008 : 73 68 3a 20 30 30 61 34  sh: 00a4
00a40010 : 30 30 30 30 ff ff ff ff  0000....
00a40018 : ff ff ff ff ff ff ff ff  ........


I used this to make sure that each sector get's address indeed, and that no=
=20
overwrapping happens, e.g. by bad soldered address lines.

However, the found characters can't be from those sectors, so it looks very=
=20
much like a conincidence. My memory area looks, in the flash, currently lik=
e=20
this:

          00000 40000 80000 c0000
00000000:  used  used  used  used
00100000:  test  jffs  jffs  jffs
00200000:  jffs  jffs  jffs  jffs
00300000:  jffs  jffs  jffs  jffs
00400000:  jffs  jffs  jffs  jffs
00500000:  jffs  jffs  jffs  jffs
00600000:  jffs  jffs  jffs  jffs
00700000:  jffs  jffs  jffs  jffs
00800000:  jffs  jffs  jffs  jffs
00900000:  jffs  jffs  jffs  test
00a00000:  test  test  test  test
00b00000:  test  test  test  test
00c00000:  test  test  test  test
00d00000:  test  test  test  test
00e00000:  test  test  test  test
00f00000:  test  test  test  test
01000000:  test  test  test  test
01100000:  test  test  test  test
01200000:  test  test  test  test
01300000:  test  test  test  test
01400000:  test  test  test  test
01500000:  test  test  test  test
01600000:  test  test  test  test
01700000:  test  test  test  test
01800000:  test  test  test  test
01900000:  test  test  test  test
01a00000:  test  test  test  test
01b00000:  test  test  test  test
01c00000:  test  test  test  test
01d00000:  test  test  test  test
01e00000:  test  test  test  test
01f00000:  test  test  test  test

test:  means that a valid test mark like above has been found
jffs:  means that in the first byte I found 0x85 and in the second 0x19
free:  the whole page contained \xFF
used:  the page contained other stuff
