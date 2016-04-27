Received: from mail-yw0-x22e.google.com ([2607:f8b0:4002:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avJXh-0002AP-TW
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 07:05:51 +0000
Received: by mail-yw0-x22e.google.com with SMTP id t10so61690232ywa.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 00:05:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
Date: Wed, 27 Apr 2016 09:05:28 +0200
Message-ID: <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Henry Shen <Henry.Shen@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chris,

On Wed, Apr 27, 2016 at 7:07 AM, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> Hi,
>
> We have a customer request for "secure file deletion" for our embedded
> devices (kernel version 4.4.6). The first device is running JFFS2 on
> parallel NOR flash but we expect to see the same requirement pop up on
> our newer devices running UBIFS on top of NAND.
>
> I found a couple of old threads related to UBIFS but they all appear to
> have fallen silent. Nothing really for JFFS2.
>
> For our application we're not really concerned about defeating
> determined attackers who have access to the device and hardware that can
> do detailed analysis on the transistors that make up the chip. But we
> are trying to protect against casual attackers (or recipients of
> re-furbished hardware) who can run 'dd'.
>
> So I think for us it'd be enough to implement chattr +s and have the
> file's data over written with a fixed value (e.g 0 for NOR flash) when
> it's blocks are added to the garbage collection list.
>
> Is that something people on this list would be interested in? I realize
> JFFS2 is kind of in a twilight phase but we're really not able to
> migrate some customers away from it.

This is definitely a nice feature.
But please keep in mind that you can overwrite data on flash. :-)

-- 
Thanks,
//richard
