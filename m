Received: from moutng.kundenserver.de ([212.227.126.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjxRj-0007JS-FM
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 14:08:12 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: joern@logfs.org
Subject: Re: [patch 10/15] fs/logfs/memtree.c
Date: Thu, 10 Apr 2008 16:07:44 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833010@logfs.org>
In-Reply-To: <20080401181332.853833010@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804101607.45409.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2008, joern@logfs.org wrote:
> +#if BITS_PER_LONG =3D=3D 32
> +#define BTREE_NODES 20=A0/* 32bit, 240 byte nodes */
> +#else
> +#define BTREE_NODES 16=A0/* 64bit, 256 byte nodes */
> +#endif
> +
> +struct btree_node {
> +=A0=A0=A0=A0=A0=A0=A0u64 key;
> +=A0=A0=A0=A0=A0=A0=A0struct btree_node *node;
> +};

On 32 bit platforms other than x86, your struct btree_node
is 16 bytes long because of alignment requirements, rather
than the 12 bytes you are assuming.

	Arnd <><
