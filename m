Received: from mout.web.de ([212.227.15.4])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TkRMY-0001Gg-Ub
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 03:27:31 +0000
From: Martin Walch <walch.martin@web.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: nand: Kconfig: drop utf8 characters
Date: Mon, 17 Dec 2012 04:27:20 +0100
Message-ID: <1568980.QkbR4hXzWB@tacticalops>
In-Reply-To: <1354541353.11583.12.camel@sauron.fi.intel.com>
References: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
 <1353971928.2383.18@tyr> <1354541353.11583.12.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3677513.YEyCJF3qZI";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Cc: Scott Wood <scottwood@freescale.com>, Wolfram Sang <wolfram@the-dreams.de>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart3677513.YEyCJF3qZI
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Montag, 3. Dezember 2012, 15:29:13 schrieb Artem Bityutskiy:
> On Mon, 2012-11-26 at 17:18 -0600, Scott Wood wrote:
> > On 11/26/2012 05:07:25 PM, Wolfram Sang wrote:
> > > The Linux Kernel Configuration system (lkc) expects 8 bit characters
> > > only (declared in scripts/kconfig/zconf.l: %option 8bit).
> > 
> > That option contrasts with being limited to 7-bit characters, not with
> > accepting UTF-8.  It may be that kconfig has problems with UTF-8, but I
> > don't think this is why.
> 
> Whatever has problems with UTF-8 - it is better to fix that instead of
> hiding the problem by removing UTF-8 characters.

The kernel configuration system does not support multibyte characters. I have 
not found any hint that support for multibyte characters has been specified or 
taken into account. In many places throughout the configuration system, only 
single byte characters are assumed. In bug #43067

> https://bugzilla.kernel.org/show_bug.cgi?id=43067

I have attached screenshots showing a problem with utf-8 characters in the 
interactive nconfig menu.

More usage of utf-8 characters could even lead to worse problems: the flex 
scanner only allows the characters [A-Za-z0-9_] in symbol names. Other input 
will make the scanner ignore a character or refuse the input at all ("syntax 
error").

The handling of multibyte characters in string values depends on the 
configuration menu in use. menuconfig will not allow any multibyte input. When 
editing a predefined string with multibyte characters in it, things will break. 
nconfig is even worse. xconfig substitutes characters with '?'.

Character counts do not work correctly. When using many multibyte characters 
funny things happen like text lines being cut off.

To make a long story short: multibyte characters in Kconfig files lead to 
undefined behaviour. This is no implementation bug. The configuration system 
just has not been designed for processing them. So utf-8 support can not be 
achieved with an easy fix, but will need comprehensive changes.

I do not know if anyone is willing to actually make all the necessary work to 
properly support utf-8 in the configuration system. However, I suppose this 
will not happen any time soon. Therefore I suggest removing the multibyte 
characters for now. 

Regards
Martin Walch
-- 

--nextPart3677513.YEyCJF3qZI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlDOkRgACgkQM6S4K8IXn9f7RQCdHciP/YqvwpjjhMB0qvWDneUk
lqMAoKOdd9wyhflZzbQnw/pNz+Fu7G2w
=NLF+
-----END PGP SIGNATURE-----

--nextPart3677513.YEyCJF3qZI--
