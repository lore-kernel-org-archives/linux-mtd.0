Received: from willow.rfc1149.net ([2001:6f8:37a:2::2] helo=mail2.rfc1149.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iixzj-0000XV-D4
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 15:58:56 -0400
Date: Fri, 19 Oct 2007 21:58:47 +0200
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH] eccbuf is statically defined and always evaluate to true
References: <20071019174155.80782C408E@mail2.rfc1149.net>
	<20071019190604.GJ26913@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071019190604.GJ26913@lazybastard.org>
From: Samuel Tardieu <sam@rfc1149.net>
Message-Id: <2007-10-19-21-58-47+trackit+sam@rfc1149.net>
Cc: trivial@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19/10, Jörn Engel wrote:

| I assume you don't actually use this driver and just ran make
| randconfig or allyesconfig or so..

I tried the latest svn tip of GCC and it looks like this warning is
quite recent (and I happened to have this driver enabled as a module
in my kernel):

drivers/mtd/devices/doc2000.c: In function ‘doc_read’:
drivers/mtd/devices/doc2000.c:635: warning: the address of ‘eccbuf’ will always evaluate as ‘true’
drivers/mtd/devices/doc2000.c: In function ‘doc_write’:
drivers/mtd/devices/doc2000.c:899: warning: the address of ‘eccbuf’ will always evaluate as ‘true’
drivers/mtd/devices/doc2001plus.c: In function ‘doc_write’:
drivers/mtd/devices/doc2001plus.c:751: warning: the address of ‘eccbuf’ will always evaluate as ‘true’
