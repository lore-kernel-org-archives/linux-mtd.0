Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oe2Rp-0006SA-Qr
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 08:57:10 +0000
Received: by yxj4 with SMTP id 4so1024963yxj.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jul 2010 01:57:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280237995.3021.2.camel@localhost.localdomain>
References: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
	<1280237995.3021.2.camel@localhost.localdomain>
Date: Wed, 28 Jul 2010 10:57:07 +0200
Message-ID: <AANLkTikLNgDGSiAWyCasr53gax6wDOjSWPmJvO=Ri+5G@mail.gmail.com>
Subject: Re: mkfs.ubifs gives corrupt images/crc errors
From: Leo Barnes <barnes.leo@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Could you please find the commit which moves CRC support out of
> mtd-utils/mkfs.ubifs and investigate what changed please? I think you
> will find the reason quite quickly.
>
> I'm on holiday, cannot look at this now.

I have now identified the first broken commit to be:

commit 2d40ed7b415bcb6a358c9f221160c4a419f01f19
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Sat Jul 17 09:43:08 2010 +0300

    libs: make crc32 and fec to be libraries


When looking at what this commit does, I can't understand why it
breaks the CRC-calculation for mkfs.ubifs since all it seems to do is
to create a library archive out of the crc files (after renaming them)
and change the crc32() function from being static inline to normal. No
function calls in mkfs.ubifs are changed, and the new crc32() function
seems to do exactly the same thing as the old.

Has anyone else noticed this problem, or is my device more susceptible
to this for some odd reason?

Best regards,
//Leo
