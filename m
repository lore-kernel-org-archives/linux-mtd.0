Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IixHz-0007Qw-9N
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 20:13:45 +0100
Date: Fri, 19 Oct 2007 21:06:04 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Samuel Tardieu <sam@rfc1149.net>
Subject: Re: [PATCH] eccbuf is statically defined and always evaluate to true
Message-ID: <20071019190604.GJ26913@lazybastard.org>
References: <20071019174155.80782C408E@mail2.rfc1149.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071019174155.80782C408E@mail2.rfc1149.net>
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

On Fri, 19 October 2007 19:26:35 +0200, Samuel Tardieu wrote:
> 
> ---
>  drivers/mtd/devices/doc2000.c     |    4 ++--
>  drivers/mtd/devices/doc2001plus.c |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Joern Engel <joern@logfs.org>

I assume you don't actually use this driver and just ran make
randconfig or allyesconfig or so..

Jörn

-- 
Science is like sex: sometimes something useful comes out,
but that is not the reason we are doing it.
-- Richard Feynman
