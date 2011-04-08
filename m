Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8CRP-0000gb-EC
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 14:13:40 +0000
Received: by ewy3 with SMTP id 3so1196080ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 07:13:36 -0700 (PDT)
Subject: Re: time to mount static volume seems to be too long
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian.Ruppert@sewerin.de
In-Reply-To: <1302271177.2834.26.camel@localhost>
References: <OFADA4774B.BD633326-ONC125786C.00461A66-C125786C.00466AC0@sewerin.de>
	<1302271177.2834.26.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 17:10:47 +0300
Message-ID: <1302271847.2834.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-08 at 16:59 +0300, Artem Bityutskiy wrote:
> Hello,
> 
> On Fri, 2011-04-08 at 14:48 +0200, Bastian.Ruppert@sewerin.de wrote:
> > [ubifs]
> > mode=ubi
> > image=/opt/rfsb/build/images/image.ubifs
> > vol_id=0
> > vol_size=46080KiB
> > vol_type=static
> > vol_name=rootfs
> > vol_flags=autoresize
> > 
> > I can mount the rootfs, but with this configuration the rootfs mount
> > time is about 8 Seconds for the image in a 71MB Partition.
> 
> IMHO, it makes little sense to use UBIFS on top of static volumes.
> Static volumes were really meant to store raw blob of data, where you
> want UBI to protect it with CRC for you.
> 
> UBIFS has its own CRC protection, so with static volume you get double
> CRC. Note, to force UBIFS checking data CRC on read you need to use
> "chk_data_crc" option, see here:
> 
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming
> 
> IOW, you do not need double-work.

BTW, if you appreciate the help from community and want to contribute,
it'd be nice if you wrote a short text to our FAQ:

"why a dynamic volume is faster to access than a static volume of the
same size?"

You can add it to this web page:
http://www.linux-mtd.infradead.org/faq/ubi.html

To do this, clone
http://git.infradead.org/mtd-www.git

edit faq/ubi.xml, type "make", make sure it compiles. Then open it with
your browser, check it looks good in html form, then send the patch.

Thanks! :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
