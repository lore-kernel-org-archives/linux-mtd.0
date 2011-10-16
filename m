Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFaJK-0000T6-Bt
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 23:40:08 +0000
Received: by iarr31 with SMTP id r31so6157267iar.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 16:40:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20111016230418.GF18227@wantstofly.org>
References: <63A7EBF6-2A5D-4607-AA5C-CC8F3ED0C29B@meraki.net>
	<20111016230418.GF18227@wantstofly.org>
Date: Sun, 16 Oct 2011 16:40:02 -0700
Message-ID: <CAJiQ=7AAiiAdbkCGkppmN19K+7Vpu6icyGAfJuUEqa7jAoA46A@mail.gmail.com>
Subject: Re: Re: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
From: Kevin Cernekee <cernekee@gmail.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Kevin Paul Herbert <kevin.herbert@meraki.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 16, 2011 at 4:04 PM, Lennert Buytenhek
<buytenh@wantstofly.org> wrote:
> On Sat, Oct 15, 2011 at 05:32:42PM -0700, Kevin Paul Herbert wrote:
>
>> Is there a reason that you did not include SECT_4K for the MX25L12805D?
>> The chips that I have support it, and its in the data sheet. Was this
>> an oversight or is there a problem with some chips?
>
> An oversight. =C2=A0If SECT_4K works for you (I don't have hardware to te=
st
> with anymore), go ahead and submit a patch.

There are a couple of potential pitfalls with SECT_4K:

1) It can have a significant impact on performance and filesystem
overhead.  Erasing 16x 4KiB sectors may be considerably slower than
erasing one 64KiB block.  On a 2MiB flash it's probably well worth the
cost, but probably not on a 32MiB flash.

2) Enabling SECT_4K after the fact may break pre-existing UBI volumes,
since UBI sets its operating parameters based on the eraseblock size
reported from MTD.

3) Some devices do support 4KiB sectors, but only for specific ranges
(not across the whole device).
