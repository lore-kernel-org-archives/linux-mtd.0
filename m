Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BV5Oi-0000tY-OW
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 05:17:30 -0400
Message-ID: <40BC49E4.30909@inf.u-szeged.hu>
Date: Tue, 01 Jun 2004 11:18:28 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: dkey <dk.dbox2@gmx.net>
References: <200405311230.57838.dk.dbox2@gmx.net>
In-Reply-To: <200405311230.57838.dk.dbox2@gmx.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fs/Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dkey wrote:

>this patch selects ZLIB_INFLATE/DEFLATE if JFFS2_ZLIB is selected.
>  
>
There was also some other dependency problems (CRC32, PROC_FS).  One of 
them is not correct in linux-2.6.6 (JFFS_PROC_FS) but the script 
"patchin.sh" now fixes it, too.

Thanks for your mail.

Regards,
Ferenc
