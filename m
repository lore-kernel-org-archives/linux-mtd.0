Received: from fire.osdl.org ([65.172.181.4] helo=smtp.osdl.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJxb4-0008M1-BR
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 13:48:49 -0400
Date: Fri, 8 Apr 2005 10:48:26 -0700
From: Andrew Morton <akpm@osdl.org>
To: =?ISO-8859-1?B?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
Message-Id: <20050408104826.3ca70fb4.akpm@osdl.org>
In-Reply-To: <20050408170805.GE2292@wohnheim.fh-wedel.de>
References: <20050408170805.GE2292@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] restrict inter_module_* to its last users
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> Next step for inter_module removal.  This patch makes the code
>  conditional on its last users and shrinks the kernel binary for the
>  huge majority of people.

If we do this, nobody will get around to fixing up the remaining users.
