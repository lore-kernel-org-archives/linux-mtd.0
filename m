Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW9Hh-0003W1-HK
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 12:29:02 +0000
Date: Thu, 21 Aug 2008 14:28:52 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
In-Reply-To: <1219318838.18027.68.camel@sauron>
Message-ID: <Pine.LNX.4.64.0808211423360.20704@vixen.sonytel.be>
References: <48AD0126.1050609@gmail.com> <1219318838.18027.68.camel@sauron>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-584349381-461250853-1219321732=:20704"
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-461250853-1219321732=:20704
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Aug 2008, Artem Bityutskiy wrote:
> On Wed, 2008-08-20 at 22:46 -0700, Jared Hulbert wrote:
> > +	err = zlib_inflateReset(&stream);
> > +	if (err != Z_OK) {
> > +		printk(KERN_ERR "zlib_inflateReset error %d\n", err);
> > +		zlib_inflateEnd(&stream);
> > +		zlib_inflateInit(&stream);
> > +	}
> 
> just FYI, are you aware that LZO which is also present in the kernel is
> much faster on decompress than zlib, while its compression is only
> slightly worse?

If you want support for multiple decompression algorithms, you can switch
from using zlib_inflate*() directly to calling zlib through the crypto API.
Then you can call crypto_alloc_comp() with the correct decompression algorithm
name.

For squashfs, I had to modify only ca. 40 lines of code.

You do need a new zlib crypto module, as the existing deflate crypto module
uses the raw deflate format instead of the zlib format, and has some parameters
tuned for its use in IPSec.

I hope to have some patches ready next week...

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
---584349381-461250853-1219321732=:20704--
