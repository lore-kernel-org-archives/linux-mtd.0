Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NVplY-0001ds-0F
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 17:15:24 +0000
Subject: Re: ubiattach fails with "bad image sequence number"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <4B4D3D61.2020305@theptrgroup.com>
References: <4B2FF7CF.7040401@theptrgroup.com>
	<1263081089.7315.119.camel@localhost.localdomain>
	<1263081191.7315.121.camel@localhost.localdomain>
	<4B4D3D61.2020305@theptrgroup.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Jan 2010 19:15:08 +0200
Message-Id: <1263575708.2969.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-12 at 22:26 -0500, Jeff Angielski wrote:
> Artem Bityutskiy wrote:
> > On Sun, 2010-01-10 at 01:51 +0200, Artem Bityutskiy wrote:
> >> Hi,
> >>
> >> On Mon, 2009-12-21 at 17:33 -0500, Jeff Angielski wrote:
> >>> If I ubiformat my NAND partition with an UBIFS image I keep on getting 
> >>> "bad image sequence number" when I try to do the ubiattach.  If I just 
> >>> do a plain ubiformat with no image then everything works fine when I 
> >>> ubiattach.
> >>>
> >>> I was wondering if somebody ran into something similar.  The steps are 
> >>> so trivial it seems like something fundamentally wrong with either the 
> >>> mkfs.ubifs or the ubiformat.
> >>>
> >>> I did not see anything related to this on the UBFI FAQ or documentation.
> >> I believe this is an ubiformat bug. Thanks for reporting and sorry for
> >> inconvenience.
> >>
> >> I attach and inline 2 patches which should fix this. I cannot have a
> >> possibility to test them now, so they are untested. They are against the
> >> latest mtd-utils.git (commit a4e502d99129da8ebba6d40b373a4422a175e9af).
> > 
> > Could you please try them and report if they fix your problem or not?
> > 
> > P.S. when we fix this, we'll have to tag a new mtd-utils version, since
> > this is a very bad bug.
> 
> This patch worked for me.

Ok, pushed them.

> FWIW, I am using 2.6.31 kernel and the mtd-utils last commit was: 
> a4e502d99129da8ebba6d40b373a4422a175e9af.
> 
> I did receive a warning "ubi_eba_init_scan: cannot reserve enough PEBs 
> for bad PEB handling, reserved 9, need 20" but I believe that is 
> operator error related to the large volume size in the mtd partition.

Yes, create smaller volumes.

> I have one slight change from the original command line commands I 
> posted.  For mkfs.ubifs my original -e was incorrectly the PEB instead 
> of the LEB.  So for those kids following along, don't use the original 
> command sequence.
> 
> 
> So the new command line sequence on the x86 host looks like:
> 
> $ mkfs.ubifs -r build/targetfs_tiny -m 4096 -e 258048 -c 2047 -o tiny.ubifs
> 
> $ ubinize -s 1024 -o ubifs1b.img -m 4096 -p 256KiB ubifs1.cfg
> 
> $ cat ubifs1.cfg
> [ubifs]
> mode=ubi
> image=tiny.ubifs
> vol_id=0
> vol_size=500MiB
> vol_type=dynamic
> vol_name=fs1
> vol_alignment=1
> vol_flags=autoresize

You need to make vol_size=500MiB smaller to get rid of the warning.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
