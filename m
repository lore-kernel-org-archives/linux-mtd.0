Received: from [212.209.10.220] (helo=miranda.se.axis.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoT0y-0008Ad-7h
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2004 19:48:48 +0000
Date: Wed, 4 Feb 2004 20:53:34 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Pham Huy Vu <vuph@mail.cable.net.tw>
Message-ID: <20040204195334.GC1256@axis.com>
References: <00e301c3eb42$8dfbbc80$030910ac@linuxer>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <00e301c3eb42$8dfbbc80$030910ac@linuxer>
cc: linux-mtd@lists.infradead.org
Subject: Re: Copy files to jffs2 partition have problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 05, 2004 at 01:15:52AM +0800, Pham Huy Vu wrote:
[snip]
> In amd_flash.c:
> static const struct amd_flash_info table[] = {
> ....
>     //This my flash setup
>         mfr_id: MANUFACTURER_MX,
>         dev_id: MX29LV320T,
>         name: "MXIC MX29LV320T",
>         size: 0x00400000,
>         numeraseregions: 3,
>         regions: {
>             { offset: 0x000000, erasesize: 0x10000, numblocks: 48 },
>             { offset: 0x300000, erasesize: 0x10000, numblocks: 15 },
>             { offset: 0x3f0000, erasesize: 0x02000, numblocks:  8 },

Hmm, I wonder why this isn't

	     { offset: 0x000000, erasesize: 0x10000, numblocks: 63 },
	     { offset: 0x3f0000, erasesize: 0x02000, numblocks:  8 },

Because of two banks? Make sure this layout is correct (check the 
datasheet). I have seen commits to the table in amd_flash.c that were 
wrong before. If your flash chip supports CFI, try using the 
CFI-driver. Otherwise try jedec_probe.c instead. amd_flash is 
obsolete.

Another piece of probably useless information:
I resently tested another, 64Mbit, MX-flash that didn't work with the 
CFI-driver because thay had gotten the number of eraseregions wrong in 
the CFI-table (in flash). A new, corrected version of the chip was 
released, but with exactly the same device ID, grrr. (Got any 
unused baseball bats left, David?)

[snap]
> MX FLASH: write to 0x3a59c0 failed. datum = 14000010, verify = 10

With buswidth 2 you can only write 16-bits. That's probably why verify 
is 0x0010. I don't know why jffs2 tries to write 0x14000010, though.

/Jonas
