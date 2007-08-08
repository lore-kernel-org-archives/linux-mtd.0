Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIp17-0008BR-JY
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 13:08:50 -0400
Subject: Re: [Patch 05/18] fs/logfs/dir.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070808161626.GG15319@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
	<20070808161626.GG15319@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 08 Aug 2007 20:07:34 +0300
Message-Id: <1186592854.19606.49.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-08-08 at 18:16 +0200, J=C3=B6rn Engel wrote:
> +static inline void logfs_inc_count(struct inode *inode)
> +{
> +	inode->i_nlink++;
> +	mark_inode_dirty_sync(inode);
> +}
> +
> +static inline void logfs_dec_count(struct inode *inode)
> +{
> +	inode->i_nlink--;
> +	mark_inode_dirty_sync(inode);
> +}
include/linux/fs.h: inode_inc_link_count() inode_dec_link_count() do
this. Although not sure they exist in the old kernel your patches are
against.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
