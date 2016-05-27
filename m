Received: from nm24-vm7.access.bullet.mail.bf1.yahoo.com ([216.109.115.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6QxP-0004y3-Ak
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 23:14:20 +0000
From: "PJ" <paul.j2@rogers.com>
To: "'Richard Weinberger'" <richard.weinberger@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
References: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
 <CAFLxGvwpDYOk_hyo4vo3YH=OP8TKes_PO94FG9UaJkpTx0o_CQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwpDYOk_hyo4vo3YH=OP8TKes_PO94FG9UaJkpTx0o_CQ@mail.gmail.com>
Subject: RE: Looking for an alternative to ubimirror
Date: Fri, 27 May 2016 19:13:56 -0400
Message-ID: <04a901d1b86d$725898d0$5709ca70$@rogers.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Richard. It works for me.

An example for future reference. Copy /dev/ubi0_0 to /dev/ubi0_1:

The volume size (in bytes) is required when calling ubiupdatevol without =
an image file. It can be retrieved from ubinfo, something like this:
VOLSIZE=3D$(ubinfo /dev/ubi0_0 | grep -o '[0-9]\+ bytes' | grep -o =
'[0-9]\+')

In the ubiupdatevol a single dash ('-') is used in place of an =
image-file to trigger use of stdin.
dd if=3D/dev/ubi0_0 | ubiupdatevol /dev/ubi0_1 - -s ${VOLSIZE}

Paul

-----Original Message-----
From: Richard Weinberger [mailto:richard.weinberger@gmail.com]=20
Sent: Friday, May 27, 2016 3:20 AM
To: PJ
Cc: linux-mtd@lists.infradead.org
Subject: Re: Looking for an alternative to ubimirror

On Fri, May 27, 2016 at 2:40 AM, PJ <paul.j2@rogers.com> wrote:
> Hi,
>
> Can anyone please recommend a procedure to copy one UBI volume to =
another?
>
> I'd like to execute from the bash command line, if possible.
>
> One upon a time I was able to use ubimirror, however that command=20
> appears to have been removed from mtd-utils.
>
> - The source volume will be mounted R/O as it is the rootfs.
> - The destination volume will be unrestricted (unmounted).
> - Both the source and destination volumes are in the same device.

Did you try dd if=3D/dev/ubiX_Y ... | ubiupdatevol ...?

--
Thanks,
//richard
