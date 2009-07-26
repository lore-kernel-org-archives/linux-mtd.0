Received: from oul111-200.netplaza.fi ([80.75.107.200] helo=gulp.u--3.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MV5lP-0008Js-0r
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 15:35:54 +0000
Date: Sun, 26 Jul 2009 17:35:36 +0200
From: Erno Kuusela <erno@gulp.u--3.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
Message-ID: <20090726153536.GD1792@gulp.u--3.com>
References: <20090723185928.GA1612@gulp.u--3.com> <4A694C3C.4010108@gmail.com>
	<20090724131241.GC1792@gulp.u--3.com> <4A69C763.1070008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A69C763.1070008@gmail.com>
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2009 at 05:38:27PM +0300, Artem Bityutskiy wrote:
> On 07/24/2009 04:12 PM, Erno Kuusela wrote:
>> So workaround would be to disable CONFIG_MTD_NAND_VERIFY_WRITE or to
>> follow the "ignore sub pages" entry from the faq...
>>
>> Indeed the latter seems to work, if I give --vid-hdr-offset 2048 option
>> to the ubinize, ubiformat&  ubiattach commands. Thanks!
>
> It should work without this. Your flash driver reports that your flash
> supports 512-byte sub-pages. This means you may save your flash space
> and put both UBI headers to the first NAND page. See this explanation:
>
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead
>
> If you follow links from this little section, you should grasp the picture.
>
> So, disabling this option should help without the --vid-hdr-offset 2048
> stuff. If it does not, then you should fix your driver.

Yeah, but I'm trying to make do without building my own kernels if 
possible.

And yes, the ubiformat "bad eraseblocks" message was indeed
a misunderstanding from my part.

There was one more error (for benefit of anyone else hitting the same 
problem): mkfs.ubifs -e 129024 parameter from 
http://www.plugcomputer.org/plugwiki/index.php/Enabling_UBIFS#Make_ubi_image_out_of_the_ubifs 
didn't work for me (got "validate_sb: LEB size mismatch: 129024 in 
superblock, 126976 real"). Fixing this to the number indicated in the 
error message (126976) fixed it. 

Looks like I have ubifs working now. :)
