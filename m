Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2FXo-0001Eq-3U
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 17:24:50 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Date: Fri, 27 Jan 2006 11:26:23 +1300
References: <OFD870B79D.90A804FE-ON88257101.0037ED08-C2257101.0037DF6B@mindspeed.com>
	<43D8C5E1.4010600@ru.mvista.com>
In-Reply-To: <43D8C5E1.4010600@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200601271126.23808.manningc2@actrix.gen.nz>
Cc: yuri.golovach@mindspeed.com, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 January 2006 01:51, Vitaly Wool wrote:
> Hi Yuri,
>
> well, lemme just summarize what you hafta do in order to make YAFFS2
> work with my patches.
>
> 1. Apply the following patch to the mtd code:
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html
> (yes, it's a single patch!)
> 2. Modify the fs/yaffs2/yaffs_mtdif2.c to use read_oobfree/write_oobfree
> where appropriate.
>
> Hope that helps,
>
>    Vitaly

Hi Vitaly

Is this in CVS yet? If not, I hope it will be there soon.

=46rom what I see, this is going to be just what we need.

YAFFS2 does not need to write_oobfree as a seperate function (it is always=
=20
written as a single page write). YAFFS2 only needs read_oobfree.

However, YAFFS1 could use the write_oobfree function at some future date if=
=20
YAFFS1 gets moved to this interface to remove the current reliance on hangi=
ng=20
the ugly ECC parameter stuff through the interface.

I am pretty busy right now, but will try get the YAFFS2 side sorted ASAP. I=
f=20
the YAFFS2 stuff is CVSed before the mtd then I'll just point people to thi=
s=20
patch.

Thanx!

Charles
