Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALSwa-00011g-80
	for <linux-mtd@lists.infradead.org>; Sun, 16 Nov 2003 19:52:24 +0000
Received: from 192.168.1.100 (unknown [192.168.1.100])B6720196BB
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Nov 2003 14:09:29 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sun, 16 Nov 2003 14:05:36 -0500
References: <200311150109.39539.joshua@joshuawise.com>
	<1068885330.29549.9.camel@imladris.demon.co.uk>
In-Reply-To: <1068885330.29549.9.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311161405.41539.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

(consider information in this post outdated. I'm having mailer issues, sorry.)

> Surely this affects more than just the unlock addresses? Doesn't it mean
> that when reading, each 16-bit word of flash would appear _twice_?
No. I can't remember why in this decongestant-drugged state that I'm in
*wheezes loudly*, but I remember that it doesn't. Some quirk that the PXA
does. Check my debrick code in handhelds.org cvs:

http://cvs.handhelds.org/cgi-bin/viewcvs.cgi/debrick/fastjtag/rflash.c?rev=1.8&content-type=text/vnd.viewcvs-markup

Look at the programflash() code in there to see how I do it.

> What if you just add the appropriate shift to your map driver?
Then that'll shift over addresses that aren't unlock, which is definately not
what I want.

For what it's worth, when I added shift code to jedec_probe, that seemed to
work, however at some point my unlock addresses are getting reset (?!!?!) to
555/2aa, instead of 555<<1/2aa<<1. I should probably debug that.

/joshua

- --
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/t8qCPn9tWOqA4LMRAlUvAJ9vgWGG3hWHxdhNf+PBIw32oLJKGwCfS1AX
0onqXs6f0h3MRE9u8Yy4534=
=EuPq
-----END PGP SIGNATURE-----
