Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhfUW-0003q1-36
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 16:14:25 +0000
Received: by mail-it0-x22e.google.com with SMTP id e124so30305190ith.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Sep 2016 09:14:03 -0700 (PDT)
MIME-Version: 1.0
From: Pierre Mallard <mallard.pierre@gmail.com>
Date: Wed, 7 Sep 2016 18:13:40 +0200
Message-ID: <CAKODt8xsX-ze7n_kvwTxbDRFN19FaOwbcKwRQn6ifoAXZbC7Yg@mail.gmail.com>
Subject: How does ubiupdatevol deals with corrupted state
To: linux-mtd@lists.infradead.org
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

Hello,

I have a question on ubiupdatevol expected behavior. Indeed, from
times to times it happens that after a call to ubiupdatevol on a
static volume, the volume is marked as corrupted by ubi driver, but
ubiupdatevol return always success.

In those case, kernel print following messages :

1970-01-01T02:42:09.660119+00:00 | kernel | - | UBI warning:
ubi_eba_read_leb: CRC error: calculated 0xa1327885, must be 0x3745d28a
1970-01-01T02:42:09.660178+00:00 | kernel | - | UBI warning:
vol_cdev_write: volume 5 on UBI device 0 is corrupted

After a few search in latest kernel master and mtd-utils git sources,
it appears that :

=C2=B7 A write to /dev/ubix_y=E2=80=A6 will not always lead to a returned e=
rror
from driver but rather may only mark the volume as corrupted if
failure is detected (vol_cdev_write function, when successive write
succeeded and ubi_check_volume returned 1 for ecc error)
=C2=B7 ubiupdatevol does not check for corrupt flag after update if write
is successful and therefore does not return an error if volume is
corrupted.

My first question is whether what happened to me, can happen : i.e.
can the volume get corrupted without a write error reported by driver
? (I would suspect therefore a problem in nand driver  - pl353 from
Xilinx for this case - )

In the eventuality where this is part of a standard =E2=80=9Cdegraded=E2=80=
=9D
behavior, what is the reason for not checking for corruption in
ubiupdatevol ?

Is this only a static volume problem ? i.e. any chance to encounter
same problem in dynamic volume.

Thanks a lot for your help,

Regards,
