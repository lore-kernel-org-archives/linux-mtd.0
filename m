Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX5Ta-0003zv-PT
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 12:50:16 +0000
Received: by mail-oi0-x22d.google.com with SMTP id p188so116569192oia.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 05:49:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC79097E950CA8@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC79097E950CA8@SEGOTEXCH02.ascom-Resource.ads>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Jul 2017 14:49:51 +0200
Message-ID: <CAFLxGvxiQ-8Yd8ZMEEmp05M6=Qwp-4n4hau7xfHRBVRbCrCNuw@mail.gmail.com>
Subject: Re: Why data is moved upon fixable bit-flip
To: Danesh Daroui <Danesh.Daroui@ascom.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Danesh,

On Mon, Jul 17, 2017 at 2:31 PM, Danesh Daroui <Danesh.Daroui@ascom.com> wr=
ote:
> Hi all,
>
> I am running some torture tests on a NAND flash memory having UBIFS on it=
. Running the tests for few days shows some errors which are apparently fix=
able by UBI. Some errors look like:
>
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
> UBI: run torture test for PEB 1627
> UBI: PEB 1627 passed torture test, do not mark it a bad
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
> UBI: run torture test for PEB 1627
> UBI: PEB 1627 passed torture test, do not mark it a bad
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 557
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1627
> UBI: run torture test for PEB 1627
> UBI: PEB 1627 passed torture test, do not mark it a bad
>
> which are promising since it seems that the file system has been able to =
fix the error as it says "fixable bit-flip'. However, some other errors are=
 like:
>
> UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 1546
> UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 1546 for scrubbing
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1546
> UBI: scrubbed PEB 1546 (LEB 3:177), data moved to PEB 1875
> UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 217
> UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 217 for scrubbing
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 217
> UBI: scrubbed PEB 217 (LEB 3:937), data moved to PEB 1875
> UBI DBG (pid 1691): ubi_io_read: fixable bit-flip detected at PEB 1546
> UBI DBG (pid 1691): ubi_wl_scrub_peb: schedule PEB 1546 for scrubbing
> UBI DBG (pid 25): ubi_io_read: fixable bit-flip detected at PEB 1546
> UBI: scrubbed PEB 1546 (LEB 3:1054), data moved to PEB 1875
>
> This is a bit strange though, because the data is moved even when the err=
or was fixable because of bit-flip as the log says.

None of these messages are errors. Since you've enabled debug logging
UBI is a bit chatty.

> Now I would like to know why the data is moved even when it is fixable? I=
s it something that we need to be worried about? Why the bit-flip is not si=
mply corrected as it is in the former case but it is rather scrubbed and th=
e data is moved? Also, will the PEB be marked as unusable bad cell when it =
is scrubbed and the data is moved to another PEB?

Bit-flips indicate that the PEB is aging and UBI tries to find out
whether it is still good or not.
To do that it has to move the data to a good PEB first because the PEB
torture function is erasing
and writing it.
Please note that we have a threshold in MTD such that UBI sees the
bit-flips not immediately.

So, bit-flips are okay but on a fresh and decent SLC I'd not expect
much of them.

--=20
Thanks,
//richard
