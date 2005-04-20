Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOGvP-00015v-FH
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 11:15:36 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: carl liao <carlliao@21cn.com>
In-Reply-To: <VF949579774981.21346@send6.inner-21cn.com>
References: <VF949579774981.21346@send6.inner-21cn.com>
Content-Type: text/plain
Date: Wed, 20 Apr 2005 19:15:01 +0400
Message-Id: <1114010101.32582.24.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: NAND Flash Device and JFFS2 support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-20 at 22:47 +0800, carl liao wrote:
Hi All,
> 
> I back ported mtd snapshot 20050416 codes to 2.4.26 for AMD Au1200.
> The NAND device could be identified and accessed via /dev/mtd/0
interface.
> I even could mount /dev/mtdblock/0, copy file to it and umount it. But
there is
> so many warnings or ecc error messages!
> This is not normal that you see "so many warnings or ecc error
messages". Presumably you have problems with your driver.

So in order to properly use NAND Flash, how could I format and
read/write
> data to it?
> flash_eraseall -j to format.

Please, investigate carefully web site at
http://www.linux-mtd.infradead.org/index.html

> I want to put Linux root file system on the NAND. Is it a right
choice?
Depends on your requirements.

JFFS2 is a generally good choice if:
* you need on-flight compression
* you need unclean-reboot tolerance
* your flash isn't large, say, not larger then 64 MiB

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
