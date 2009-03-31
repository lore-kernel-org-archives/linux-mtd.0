Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LobYl-00071x-Al
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 10:51:18 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Kevin Cernekee <kpc.mtd@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4] MTD: New ioctl calls for >4GiB device support
Date: Tue, 31 Mar 2009 12:51:03 +0200
References: <a95a62fe0903301814k75ce56f5xef0a04c5c188012@mail.gmail.com>
In-Reply-To: <a95a62fe0903301814k75ce56f5xef0a04c5c188012@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200903311251.04746.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 March 2009, Kevin Cernekee wrote:
> +struct mtd_oob_buf64 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint64_t start;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t res0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t length;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned char __user *ptr;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t res1[8];
> +};

Does this have to use an indirect pointer? We normally try to avoid
ioctl interfaces like this, because they are hard to trace and you
need a compat wrapper. You might be able to at least avoid the wrapper
by defining the data structure with a __u64 to take the pointer.

If you leave the data structure the way it is, you should at least
move the compat_ioctl handling into mtdchar.c from compat_ioctl.c.
It will simplify your code and help reduce the size of the common
ioctl handling.

	Arnd <><
