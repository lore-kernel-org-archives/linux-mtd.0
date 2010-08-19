Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmB5u-0007Fq-Im
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 19:48:12 +0000
Received: by vws11 with SMTP id 11so2356467vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Aug 2010 12:48:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100819171558.GA8536@code-monkey.de>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com>
	<20100819171558.GA8536@code-monkey.de>
Date: Thu, 19 Aug 2010 12:46:35 -0700
Message-ID: <AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
From: Kevin Cernekee <cernekee@gmail.com>
To: Tilman Sauerbeck <tilman@code-monkey.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 19, 2010 at 10:16 AM, Tilman Sauerbeck
<tilman@code-monkey.de> wrote:
>> =C2=A0 This patch uses the new 6-byte scheme if the following conditions=
 are
>> =C2=A0 all true:
>> =C2=A0 [...]
>> =C2=A0 3) 6th byte is zero
>
> ... but what the code does is use new scheme if id_data[5] is _not_
> zero.

ID for Samsung K9GAG08U0D (6-byte sequence): ec d5 94 29 34 41

The code is right; the comment is wrong.
