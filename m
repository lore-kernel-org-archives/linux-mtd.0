Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8bM0-0000MK-Ro
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 18:26:33 +0000
Received: by eaai12 with SMTP id i12so1590896eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 11:26:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5044D395.9050607@ic.fr>
References: <5044D395.9050607@ic.fr>
Date: Mon, 3 Sep 2012 11:26:29 -0700
Message-ID: <CAJiQ=7AwRnbtDtTd9u-j5xqOCqYx89R8CfK7MpQCYG3OossY0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers/mtd/devices/m25p80.c: Fix return code of
 read/write mtd callbacks
From: Kevin Cernekee <cernekee@gmail.com>
To: =?UTF-8?B?Q8OpZHJpYyBDYW5v?= <ccano@interfaceconcept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 3, 2012 at 8:58 AM, C=C3=A9dric Cano <ccano@interfaceconcept.co=
m> wrote:
> For SPI Flash devices, MTD read and write functions returns "1" if Flash =
is
> busy (this status is returned by "wait_till_ready" fnuction). This return

"function"

It is usually a good idea to wrap the commit text around 72-74
characters so that it is readable in "git log" on an 80-column
terminal.

> code is not an error code: if device is busy, MTD read or write are
> successful with 1 byte length.

Looking at mtd_read() - typically the transfer length is passed back
through the "size_t *retlen" pointer, not the function's return value.

In Linux 3.5, if m25p80_read() returns 1, mtd_read() will interpret it
as a bitflip count not a byte count.  That isn't the correct behavior
for a NOR device, but it probably wouldn't cause the symptom you are
reporting.

In Linux 3.4 and older, some functions like mtdchar_read() could
interpret the '1' as an error code and pass it back as-is to the
caller (who is expecting either a negative error code or a positive
length).  Is this the case you are running into?

Side note - it would be helpful to add kerneldoc markup to
include/linux/mtd/mtd.h for struct mtd_info and the new mtd_* wrapper
functions, so we have a clear definition of what the parameters and
return values should look like.

> --- linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-08-26
> 04:32:13.000000000 +0200
> +++ linux-3.5.3/drivers/mtd/devices/m25p80.c    2012-09-03
> 17:35:16.159741656 +0200
> @@ -199,7 +199,7 @@

Could you please use "git format-patch" for your submissions, and base
them on the current head of tree?

Thanks.
