Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLyov-0001Wx-NS
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 13:58:38 +0000
Received: by bwz5 with SMTP id 5so1930052bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 05:58:35 -0800 (PST)
Subject: Re: Flashing UBIFS over fastboot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
References: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 15:58:03 +0200
Message-ID: <1290779883.2552.4.camel@localhost>
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

Hi,

On Fri, 2010-11-26 at 22:39 +0900, Leo Barnes wrote:
> I am trying to get UBIFS to work on a fastboot-based Android device.
> So far, I have managed to create a working UBIFS partition on a
> running device using ubiformat/nandwrite, but whenever I try to flash
> images with fastboot, the flashing process fails. I assume that this
> is because fastboot expects YAFFS2 images (which contain OOB-data)
> while what I am trying to flash is UBIFS images (which do not). So my
> question:
> 
> Has anyone either got fastboot to work directly with UBIFS images, or
> is it possible to somehow create UBIFS images that "look like" YAFFS2
> images (by creating dummy OOB-data for instance)? As it is, fastboot
> obviously misinterprets the images. Or does anyone have any data on
> exactly how the UBIFS and YAFFS2 image formats look like? In that case
> I might be able to figure out some way of doing it.

I think you can hack ubinize and teach it to add OOB bytes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
