Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MA3VQ-0004KC-8b
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 14:56:31 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: Delete final remnants of MTD ioctls from
	fs/compat_ioctl.c
Date: Fri, 29 May 2009 15:56:11 +0100
References: <1243607412.19886.169.camel@macbook.infradead.org>
In-Reply-To: <1243607412.19886.169.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200905291556.13482.arnd@arndb.de>
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 29 May 2009, David Woodhouse wrote:
> Er, that doesn't move stuff into mtdchar.c. It just deletes it...

The changeset comment could be a little more verbose, but it looks
correct to me. The key is calling mtd_ioctl() in the 'default:'
case of mtd_compat_ioctl(), which just treats all unhandled
ioctl numbers as compatible.

	Arnd <><
