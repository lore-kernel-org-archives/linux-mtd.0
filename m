Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OBiHu-00006P-Md
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 05:45:52 +0000
Subject: Re: Can not mount UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=E6=9E=97=E4=BA=8E=E5=B3=BB?= <okpalin@gmail.com>
In-Reply-To: <AANLkTil-IPNGJdudKOjtHjc9Y2od0xM2-D7beVEV_HHI@mail.gmail.com>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
	<1272888512.27729.46.camel@localhost>
	<i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
	<AANLkTil-IPNGJdudKOjtHjc9Y2od0xM2-D7beVEV_HHI@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 11 May 2010 08:44:50 +0300
Message-ID: <1273556690.2209.146.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-05-11 at 11:46 +0800, 林于峻 wrote:
> Dear all,
> 
> I have modified bootloader to download image as ubiformat does.
> However, I still can not mount it.
> I also dump the content of mtd partition and compare.
> (Ex: dd if=/dev/block/mtdblock5 of=/data/mtd5bak)
> No difference between the content written by bootloader and written by
> ubiformat.
> 
... snip ...

> <3>UBI error: ubi_io_read: error -22 while reading 2048 bytes from PEB
> 3:6144, read 0 bytes

Well, find out why your driver returns -EINVAL and read count 0 when you
read 2048 bytes from PEB 3 on this partition, and offset 6144. Dig the
driver.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
