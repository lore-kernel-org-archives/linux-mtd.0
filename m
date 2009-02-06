Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLUA-00037o-F7
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 07:50:50 +0000
Message-ID: <498BEBC8.3000302@yandex.ru>
Date: Fri, 06 Feb 2009 09:50:32 +0200
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: Request for review: NandFS
References: <200902031327.59536.corentincj@iksaif.net>
In-Reply-To: <200902031327.59536.corentincj@iksaif.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org,
	HIBLOT Jean-Jacques <jjhiblot@adeneo.adetelgroup.com>,
	Gregory CLEMENT <gclement@adeneo.adetelgroup.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Corentin Chary wrote:
> Hi,
> Here is NandFS, a NAND Flash Filesystem.
> NandFS is similar to YAFFS2 (in some ways), but the codebase is much more
> cleaner and simpler. And we'll try to go mainline.
> 
> Development started at Adeneo (http://www.adeneo-embedded.com/srt/en/home) in 
> 2007. After a long pause, I re-started to clean the code in october 2008.
> 
> With the new UBIFS, we might think than there is no room for another flash 
> filesystem. But another GPLed filesystem can't hurt anyone. Some of us may 
> have heard some words about UFFS, but this project is in no way related to 
> NandFS.
> 
> *IMPORTANT*: NandFS is under active development, and can't be considered safe 
> or stable !

Probably you have a very good motivation to do work from
scratch, but what is sad that instead of joining us and
improving UBI/UBIFS stack, you spend your time creating new
file-system.

Almost nobody is interested in new unscalable solutions, and
you really waste your time, because we already have 3 of them,
at least.

There are so many things to improve in UBI/UBIFS, and there
is a possibility to create a scalable UBI2. You may do a lot
of exciting things in the area, instead.

Please, think about joining us instead :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
