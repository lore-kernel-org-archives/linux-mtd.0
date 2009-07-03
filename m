Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMimt-0001hE-Px
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 13:26:53 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>, Stefan Roese <sr@denx.de>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 16:26:02 +0300
Message-Id: <1246627562.20721.190.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-19 at 16:16 -0600, Eric Holmberg wrote:
> > On Mon, 2009-05-18 at 11:30 -0600, Eric Holmberg wrote:
> > > Hi Stefan,
> > > 
> > > I am still seeing corruption even with the write buffer 
> > size limited to
> > > 8 bytes, but it's greatly limited.
> > 
> > Do you mean, UBIFS still dies when buf. size is 8?
> > 
> > -- 
> > Best regards,
> > Artem Bityutskiy (Битюцкий Артём)
> 
> 
> Yes, I'm still seeing two failures.  One is where I get 2 corrupt
> empty blocks when an LEB erase operation is interrupted by a power
> failure.  Erasing one of them manually in U-Boot allows the system
> to boot.  I believe this happens when an LEB erase operation is
> interrupted and then during the deferred recovery, another erase
> operation is interrupted.  The system never expects to have more
> than one erase operation interrupted and panics.
> 
> The other failure is a corruption issue, even with the write buffer
> size limited to 8 bytes.  Scroll down to the end of the kernel messages
> for the failure.
> 
> I unfortunately didn't get a chance to get an image of the flash to
> see what happened to the data block before the board was reprogrammed. 
> I'm trying to reproduce it so I can get more details on what is happening.

Stefan sent me a board which should has similar flash: S29GL512N
http://www.spansion.com/datasheets/s29gl-n_00_b8_e.pdf

And the board is Kilauea:
http://www.appliedmicro.com/Embedded/Downloads/download.html?item=537

Here is what MTD thinks about it:

fc000000.nor_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
fc000000.nor_flash: CFI does not contain boot bank location. Assuming
top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

The kernel is 2.6.30.

I've done power cut tests and UBIFS dies pretty quickly and every time
complains that there are unexpected errors in the LEB, something similar
to what you describe.

You discovered 2 problems:
1. Write-buffering, which you disabled by 8-byte limit
2. Unexpected zeroes, which you reported but never had time to work on.

It seems I hit problem 2, but I could not see problem 1. Anyway, I'm
putting problem 1 aside so far.

I've hacked UBI a little, and made it save PEBs (physical erase blocks)
before erasing them. This means, that before erasing a PEB A, I read it,
and save its contents to another PEB B (at the end of the flash). Then I
erase PEB A.

I found that interrupted erases introduce zeroes at the end of the PEB.

What I observe is: UBIFS has LEB (logical erase block) 3 mapped
to PEB 282. UBIFS unmaps the LEB 3, which means UBI erases PEB 282.
Before erasing PEB 3 my hack reads it and copies its contents to
PEB 472. The the erasure of PEB 3 then starts, but is interrupted by
power cut.

What I observe then is that PEB 282 contains all zeroes at the end,
but the beginning is intact.

Here is what PEB 472 contains (which means PEB 282 contained this before
the erasure):

offset 0-64       - valid erase counter header
offset 64-128     - valid Volume ID header
offset 128-544    - several small UBIFS reference nodes
offset 544-131072 - 0xFF bytes

After the power cut PEB 282 contains:

offset 0-64         - valid erase counter header
offset 64-128       - valid Volume ID header
offset 128-544      - several small UBIFS reference nodes
offset 544-29584    - 0xFF bytes
offset 29584-131072 - zeroes

I've also attached 2 files which contain full dump of PEB 282 and PEB
472.

This stuff confuses UBI. When UBI scans the media, it reads the EC
header and the VID header, checks CRC, they are fine, and it treats
the PEB 282 to be mapped to LEB 3. Then UBIFS panics because it sees
LEB 3 containing unexpected zeroes.

This is the first time I work with NOR, and on NAND we have not seen
such an effect. But this looks weird to me.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
