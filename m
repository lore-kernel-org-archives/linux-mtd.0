Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8CGX-0000a8-SO
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 14:02:26 +0000
Received: by wyb28 with SMTP id 28so3820787wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 07:02:24 -0700 (PDT)
Subject: Re: time to mount static volume seems to be too long
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian.Ruppert@sewerin.de
In-Reply-To: <OFADA4774B.BD633326-ONC125786C.00461A66-C125786C.00466AC0@sewerin.de>
References: <OFADA4774B.BD633326-ONC125786C.00461A66-C125786C.00466AC0@sewerin.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 16:59:37 +0300
Message-ID: <1302271177.2834.26.camel@localhost>
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

Hello,

On Fri, 2011-04-08 at 14:48 +0200, Bastian.Ruppert@sewerin.de wrote:
> [ubifs]
> mode=ubi
> image=/opt/rfsb/build/images/image.ubifs
> vol_id=0
> vol_size=46080KiB
> vol_type=static
> vol_name=rootfs
> vol_flags=autoresize
> 
> I can mount the rootfs, but with this configuration the rootfs mount
> time is about 8 Seconds for the image in a 71MB Partition.

IMHO, it makes little sense to use UBIFS on top of static volumes.
Static volumes were really meant to store raw blob of data, where you
want UBI to protect it with CRC for you.

UBIFS has its own CRC protection, so with static volume you get double
CRC. Note, to force UBIFS checking data CRC on read you need to use
"chk_data_crc" option, see here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming

IOW, you do not need double-work.

> When changing the vol_type attribute to dynamic, the mount time is
> much shorter (about 1 Second).

This is because UBI change the CRC of the whole static volume, this is
where you spend time.

> The point of interest are the timings.
> The static volume is designed for speed up booting and mounting, isn t
> it? 

No, I think it was originally designed to store short blobs of data like
a configuration file.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
