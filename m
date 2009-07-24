Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MULva-0001EG-Vz
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 14:39:22 +0000
Message-ID: <4A69C763.1070008@gmail.com>
Date: Fri, 24 Jul 2009 17:38:27 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Erno Kuusela <erno@gulp.u--3.com>
Subject: Re: UBIFS fails & crashes on SheevaPlug
References: <20090723185928.GA1612@gulp.u--3.com> <4A694C3C.4010108@gmail.com>
	<20090724131241.GC1792@gulp.u--3.com>
In-Reply-To: <20090724131241.GC1792@gulp.u--3.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/24/2009 04:12 PM, Erno Kuusela wrote:
> Ah, ok. I did google for that error message but searching for
> "ubi_io_write: error -5" doesn't yield anything useful for the first
> screenful of results..
>
> So workaround would be to disable CONFIG_MTD_NAND_VERIFY_WRITE or to
> follow the "ignore sub pages" entry from the faq...
>
> Indeed the latter seems to work, if I give --vid-hdr-offset 2048 option
> to the ubinize, ubiformat&  ubiattach commands. Thanks!

It should work without this. Your flash driver reports that your flash
supports 512-byte sub-pages. This means you may save your flash space
and put both UBI headers to the first NAND page. See this explanation:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

If you follow links from this little section, you should grasp the picture.

So, disabling this option should help without the --vid-hdr-offset 2048
stuff. If it does not, then you should fix your driver.

> Maybe it would be better to disable the verify&  subpages combo
> until the bug is fixed? Especially since it crashes the kernel...

May be, but it is better to just fix this.

> Also, ubiformat mentioned 1400+ "bad" eraseblocks, what should I make of
> that? Is it really failed flash cells, just some blocks reserved for
> u-boot and stuff, or blocks traumatized from my earlier misadventures
> with ubiformat parameters?

Hmm, this is not normal. What is the version of ubiformat you use? Could
you try the latest one from the git tree:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_usptools

Just in case, here are mtd-utils compile issues FAQ:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfs_ubifs_comp
or you may always cd to ubi-utils and compile only UBI utils.

And what UBI is printing? See "UBI: number of bad PEBs:" message.

And please, send the exact ubiformat pritns.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
