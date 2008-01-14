Received: from wa-out-1112.google.com ([209.85.146.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEVKX-0001hb-Nz
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 19:50:45 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3972601wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jan 2008 11:46:47 -0800 (PST)
Message-ID: <9b52d64c0801141146g3b076f74pe2e06b06832219aa@mail.gmail.com>
Date: Mon, 14 Jan 2008 11:46:47 -0800
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: "Yuri Tikhonov" <yur@emcraft.com>
Subject: Re: Block Device Emulation over UBI
In-Reply-To: <200801141557.18349.yur@emcraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200801141557.18349.yur@emcraft.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Few months back I raised same question here &
I got nice replies from Artem.I am not able to found that discussion in my
mail box though :( & even not able to recall much of it.
However Artem said writing block device driver on top of UBI volume is same as
implementing FTL on it, basically its re-inventing the wheel. Probably Artem
can answer you well :-).

--Vinit.


On Jan 14, 2008 4:57 AM, Yuri Tikhonov <yur@emcraft.com> wrote:
>
>  Hello all,
>
>  We are about to implement and then maintain a block device driver which is
> intended to work on the top of UBI and provide users with the block-device
> interface to the underlying Flash chips. The goal of this driver is to
> provide users with the possibility to easily organize reliable file storage
> in Flash memory chips (especially NAND Flash) using Flash-unaware
> file-systems like FAT, EXT2/3, etc (UBI is supposed to provide the necessary
> reliability using its features of wear-leveling and bad blocks handling).
>
>  In many cases the ability to have the file-system formatted with, for
> example, FAT is a highly desirable feature of the embedded devices (e.g. for
> exporting the embedded storage via USB link to a Windows-based USB host), so
> we guess our work will be usefull for the embedded world.
>
>  Any suggestions or comments as to possible issues we may run into on this
> road would be very appreciated.
>
>  Regards, Yuri
>
> --
> Yuri Tikhonov, Senior Software Engineer
> Emcraft Systems, www.emcraft.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Life is so short. So, follow some rules. Forgive quickly, believe
slowly, love truly, laugh loudly & never avoid anything that makes U
smile.
