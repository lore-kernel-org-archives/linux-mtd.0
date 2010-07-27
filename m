Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdkNz-0005xe-SG
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 13:40:01 +0000
Received: by fxm3 with SMTP id 3so701716fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 06:39:58 -0700 (PDT)
Subject: Re: mkfs.ubifs gives corrupt images/crc errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
References: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jul 2010 16:39:55 +0300
Message-Id: <1280237995.3021.2.camel@localhost.localdomain>
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

On Tue, 2010-07-27 at 09:03 +0200, Leo Barnes wrote:
> Hello!
> 
> The recent versions of mkfs.ubifs in the mtd-utils gives corrupt
> images for me. I get the following error messages when trying to mount
> the ubi-volume:
> 
> <3>[  711.246826] UBIFS error (pid 413): ubifs_check_node: bad CRC:
> calculated 0x1f8f89ca, read 0xbb39064c
> <3>[  711.247558] UBIFS error (pid 413): ubifs_check_node: bad node at LEB 0:0
> <3>[  711.247924] UBIFS error (pid 413): ubifs_read_node: expected node type 6
> 
> I have identified it as being broken since (approximately) after
> commit 004760f969175da7392dd02bb4fa14164ff46c1e (Wed Jun 16 09:47:27
> 2010 +0300). Two or three of the commits after this one refuse to
> build with various make errors, and the next one that builds gives
> corrupt images. It seems to have something to do with the CRC
> calculation.

Could you please find the commit which moves CRC support out of
mtd-utils/mkfs.ubifs and investigate what changed please? I think you
will find the reason quite quickly.

I'm on holiday, cannot look at this now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
