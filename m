Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCv2f-00025C-16
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 19:30:02 +0000
Received: by oiyy130 with SMTP id y130so173619355oiy.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 12:29:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <02855DE82B1CA94A9115CCD637A13256CF6CC4EF02@goemail-server>
References: <02855DE82B1CA94A9115CCD637A13256CF6CC4EF02@goemail-server>
Date: Wed, 8 Jul 2015 21:29:39 +0200
Message-ID: <CAFLxGvxB5OCU_Afr_7vQ-3h8HLWNO63AK+U3gUZNX3Ry+k0U0w@mail.gmail.com>
Subject: Re: Reading from UBI volume character device did not work.
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Stelling Carsten <Carsten.Stelling@goerlitz.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Carsten,

On Wed, Jul 8, 2015 at 8:27 PM, Stelling Carsten
<Carsten.Stelling@goerlitz.com> wrote:
> Hello,
>
> I'm trying to read from a UBI volume using the character device /dev/ubi2,
> but read always returns 0. My kernel version is 3.14.31 (no ubiblock).
>
> fd = open("/dev/ubi2", O_RDONLY);
> read(fd, buffer, count);
>
> I set count to different values, especially to min_io_size = 2048, but without success.
> Reading from the underlying MTD device "/dev/mtd8" succeeds.
> What did I miss?

read() should return -1 with errno = EINVAL as you cannot read from /dev/ubi2.
read/write access is only implemented for volume devices like /dev/ubi2_X.

> My task is, as suggested by the UBIFS documentation, to write a userspace daemon
> on top of UBI, that reads all LEBs and associated PEBs in the background, to let UBI
> handle rarely accessed pages with accumulated bit-flips.

Please note that this check is not perfect.
You'll miss all pages which contain UBI meta data like EC/VID headers.

This reminds me that I should carry on with my bitrot patch set. B-)

-- 
Thanks,
//richard
