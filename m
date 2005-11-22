Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EeaoR-0001tK-57
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 11:16:12 -0500
Message-ID: <43834421.1050509@yandex.ru>
Date: Tue, 22 Nov 2005 19:15:29 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Menon, Nishanth" <x0nishan@ti.com>
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
In-Reply-To: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Menon, Nishanth wrote:
> Hi All,
> I have been trying Sibley NOR flash and the latest (as of today) MTD
> tree on my kernel.
> When I use the character device, I am able to unlock, erase, write and
> read from it successfully. Unfortunately, when I try to use jffs2 on it,
> I face the following issue:
Could you please try to reproduce this on mtdram device which is just an 
emulator of NOR flash in RAM ?


> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=2
Uhh. Too much log rubbish will be produced with this.

> CONFIG_JFFS2_FS_WRITEBUFFER=y
This is not usually needed for NOR. is 'siblay' an exception? But JFFS2 
still should work.

> CONFIG_JFFS2_ZLIB=y
> CONFIG_JFFS2_RTIME=y
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_JFFS2_LZO is not set
> # CONFIG_JFFS2_LZARI is not set
> # CONFIG_JFFS2_CMODE_NONE is not set
> CONFIG_JFFS2_CMODE_PRIORITY=y
> # CONFIG_JFFS2_CMODE_SIZE is not set
> CONFIG_JFFS2_PROC=y
Uh, it is interesting. I did not know anything about this option. I 
thought JFFS2 does not expose anything to /proc ...


-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
