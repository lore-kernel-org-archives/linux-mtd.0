Received: from mail-vn0-x230.google.com ([2607:f8b0:400c:c0f::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2e8Q-0005ZR-DL
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 11:25:31 +0000
Received: by vnbg190 with SMTP id g190so7367317vnb.6
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 04:25:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
References: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
Date: Wed, 10 Jun 2015 13:25:05 +0200
Message-ID: <CAFLxGvzA8N4PUK_7-jM9FcnrqLnyOsNcomfLOSMMGKc5Ed5D9Q@mail.gmail.com>
Subject: Re: Trouble with UBIFS
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Smitha Rathnam <rathnam.smitha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Wed, Jun 10, 2015 at 12:08 PM, Smitha Rathnam
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

To fix the problem one has to analyze it first.
The kernel output you've posted is incomplete and most likely unrelated.
Do you have a complete kernel log?

Retrieving data from the filesystem is not easy, it depends how much UBIFS
is corrupted.
What I do in such cases is dumping all nodes and running them thought a
semi-automated script which can deal with UBIFS.

-- 
Thanks,
//richard
