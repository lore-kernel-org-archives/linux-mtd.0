Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIqdR-00055l-Dp
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 14:52:00 -0400
Message-ID: <46BA1080.2060907@yandex.ru>
Date: Wed, 08 Aug 2007 21:50:40 +0300
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: [Patch 05/18] fs/logfs/dir.c
References: <20070808161234.GB15319@lazybastard.org>
	<20070808161626.GG15319@lazybastard.org>
In-Reply-To: <20070808161626.GG15319@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> + * Unlink and rmdir also share the same function: unlink.  Again, this
> + * function works in two atomic steps
> + * 1. remove dentry (remember inode in journal)
> + * 2. unlink inode (clear journal)

May you please elaborate a little what is journal in LogFS? Is it only for
one operation? Does it have fixed position on flash? How large is it?

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
