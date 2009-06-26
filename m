Received: from mail-qy0-f200.google.com ([209.85.221.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MK3oa-0004NX-NX
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 05:17:38 +0000
Received: by qyk38 with SMTP id 38so1843176qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Jun 2009 22:17:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200906252128.08460.david-b@pacbell.net>
References: <200906252128.08460.david-b@pacbell.net>
Date: Fri, 26 Jun 2009 10:47:31 +0530
Message-ID: <ce9ab5790906252217s1a5a8279l58a2111b3ac79786@mail.gmail.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
From: vimal singh <vimal.newwork@gmail.com>
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 26, 2009 at 9:58 AM, David Brownell<david-b@pacbell.net> wrote:
> I noticed
>
> =A0http://lists.infradead.org/pipermail/linux-mtd/2009-June/026133.html
>
> I don't think I understand the question. =A0But I have two comments
> that might help:
>
> =A0- First, the ECC schemes don't dictate much about how the
> =A0 OOB area gets laid out, so what's the problem? =A0Just pick a
> =A0 layout that doesn't clobber manufacturer bad block markers
> =A0 and you'll be pretty much OK. =A0Stick all ECC at the end, to
> =A0 keep it simple.
>
> =A0- Second, I believe that you will see some issues if you
> =A0 try to have ECC cover the OOB too. =A0Problem being that
> =A0 the raw_write primitives are used to write OOB data and
> =A0 they don't believe it will be ECC protected.

My point is to protect OOB too (other than ECC bytes).
So, should we implement new OOB area read/write primitives to support this?

And in that case how will we be handling those cases where spare bytes
are protected by clubbing them with main area bytes to generate ECC?
(as example in my previous mail)

>
> ECC_HW should probably work fine. =A0You'll just provide your
> own ecclayout struct, and set things up so the NAND core knows
> the hardware works in 512 byte chunks that give 7 byte each of
> ECC data.
>
> - Dave
>



--=20
---
Regards,
\/ | |\/| /-\ |_
