Received: from mail-qc0-x243.google.com ([2607:f8b0:400d:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2uZM-0003yV-4O
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 04:58:26 +0000
Received: by qcvp6 with SMTP id p6so5763249qcv.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 21:58:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
References: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
Date: Thu, 11 Jun 2015 14:58:00 +1000
Message-ID: <CAC7eWMVyEyy3Y_qWU5qxOY4m9bm15u7Ga3sZrUyLqY_zgy=a8Q@mail.gmail.com>
Subject: Re: Trouble with UBIFS
From: Smitha Rathnam <rathnam.smitha@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

With respect to the UBIFS issue.. How do I come to a conclusion that
it is a hardware fault and not a software one?
We are using Micron nand devices in our system.
The UBI rootfs is put on /dev/mtd4 and the ubi logfs is put on
/dev/mtd5. The mtd5 partition shows corruption. When we format the
device and reinstall, the corruption goes away. Of course, we have
lost data.
So should this be enough to conclude that this is an issue with
software and not the actual NAND device?
I ran the nandtest from the mtd_utils set. Before the format the test
showed a lot of ECC errors. After the format and reinstall, the test
showed no ECC failures although there were 4 bad blocks.
How do we understand this? Is this enough to conclude that the issue
is a software one related to the file system?

Regards,
Smitha.

On Wed, Jun 10, 2015 at 8:08 PM, Smitha Rathnam
<rathnam.smitha@gmail.com> wrote:
>  Hi,
>
>  We have an embedded linux (2.6) system. Since the past few months, we
> have been seeing a corruption of the log filesystem.
>  The filesystem is using mtd5 device.
>  The error looks like this;
>  user.notice kernel: klogd started: BusyBox v1.20.0 (2012-09-18 17:42:52 MST)
>
>  Jan  1 00:00:05 user.debug kernel: 00001fa0: 00000000 00000000
> 00000000 00000000 00000000 00000000 00000000 00000000
> ................................
>  Jan  1 00:00:05 user.debug kernel: 00001fc0: 00000000 00000000
> 00000000 00000000 00000000 00000000 00000000 00000000
> ................................
>  Jan  1 00:00:05 user.debug kernel: 00001fe0: 00000000 00000000
> 00000000 00000000 00000000 00000000 00000000 00000000
> ................................
>  *Jan  1 00:00:05 user.err kernel: UBIFS error (pid 1110):
> ubifs_recover_leb: LEB 24 scanning failed*
>
>  Is there a way to retrieve data from the partition? How do we fix this error?
>
>  Please help.
>
>  Thanks and regards,
>  Smitha.
