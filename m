Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aM0et-0000NA-Hl
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2016 21:51:20 +0000
Received: by mail-wm0-x22f.google.com with SMTP id b14so51362044wmb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jan 2016 13:50:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
References: <CADC-h+GSekez10TVYV3pJsiD=YPY=WawG5cN_ZrJJb0zP7Xu=g@mail.gmail.com>
Date: Wed, 20 Jan 2016 18:50:56 -0300
Message-ID: <CAAEAJfAM9XEV2oU7PngdpPjryGttQw8Zj+uqhJ40mZEKvTX59A@mail.gmail.com>
Subject: Re: Block device emulation on top of ubi volumes with read/write
 support
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Charles Godson <cestgodson@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, w@1wt.eu,
 Daniel Ehrenberg <dehrenberg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 January 2016 at 18:33, Charles Godson <cestgodson@gmail.com> wrote:
> Hi Ezequiel,
>
> Hope this email finds you well.
>
> I could have sent this directly to linux-kernel@vger.kernel.org or
> linux-mtd@lists.infradead.org, but I thought there may be a quick answer =
to
> this one.
>

I'm Ccing linux-mtd, and some interested folks.

> I am looking into enabling ext4 support on top of NAND flash. I am curren=
tly
> using squashfs on top of UBI volumes (with your read-only block device
> emulation), and that works exceptionally well for me (thanks for the qual=
ity
> code!).
>
> I've looked at your earlier work, where you started with block device
> emulation with RW support (e.g. https://lwn.net/Articles/525957/). I have=
n't
> seen much progress there, and in 2014 you''ve introduced RO version.
>
> I was wondering why the switch?
>

I guess there are two reasons: first, because even though UBI
does wear-leveling, we feared [1] that a regular filesystem would wear out
blocks by doing a crazy amount of writes.

To be honest, it wasn't the main obstacle, so I added the
write-support as an option
with a big fat warning message. It was later asked to drop the option,
and I fell for the
safer read-only instead of leaving write support there.

The read-only version was much much simpler, and it was tempting to keep th=
ings
simple. This is the second reason.

You may restart this discussion, write support and see how it goes. I'm not
entirely opposed to the idea.

BTW, why can't you just use UBIFS instead?

[1] http://lkml.iu.edu/hypermail/linux/kernel/1211.2/02895.html
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
