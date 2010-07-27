Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Odlzl-0005ar-Es
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 15:23:06 +0000
Received: by fxm3 with SMTP id 3so779156fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 08:23:04 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1280243535.3021.29.camel@localhost.localdomain>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jul 2010 18:21:57 +0300
Message-Id: <1280244117.3021.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: stefani@seibold.net, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 18:12 +0300, Artem Bityutskiy wrote:
> This really does not look like a NAND/MTD driver issue. More look like
> either an UBIFS bug of some kind of corruption which corrupted an EC or
> VID header, then UBI decided to erase this PEB, and then UBIFS reads all
> 0xFFs from there.
> 
> The second theory should BTW be fixed. Indeed, when UBI finds a PEB with
> corrupted headers, it adds this PEB to the 'corr' list, and then just
> erases. But this is wrong! It should erase them only if there are all
> 0xFFs in the rest of the block.

Yeah, indeed looks like a bad bug in UBI. So, when we have some flash
corruptions which corrupt the VID header, UBI just silently erases this
PEB! And then we have small chances to find out why on LEB suddenly
became unmapped (erased).

UBI logic is - if VID header is corrupted, it is because a sudden power
cut while writing the header. And we can erase the PEB because if we
were writing the header, we have not written the data yet.

But it does not bother checking what goes _after_ the header. If there
are some data, UBI should not erase the PEB but preserve it and switch
to R/O mode.

CCing Stefani, I think here group faced a similar issue recently - one
of LEB suddenly disappeared. This may be the reason.

Then the other question - why VID became corrupted? Dunno, but if UBI
won't erase the PEB we'll have better chances to find this out. Does
this sound reasonable?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
