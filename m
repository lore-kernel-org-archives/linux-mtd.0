Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJy3D-0000UO-LI
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2005 14:17:53 -0400
Date: Fri, 8 Apr 2005 20:17:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20050408181741.GA12170@wohnheim.fh-wedel.de>
References: <20050408170805.GE2292@wohnheim.fh-wedel.de>
	<20050408104826.3ca70fb4.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050408104826.3ca70fb4.akpm@osdl.org>
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

On Fri, 8 April 2005 10:48:26 -0700, Andrew Morton wrote:
> Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> >
> > Next step for inter_module removal.  This patch makes the code
> >  conditional on its last users and shrinks the kernel binary for the
> >  huge majority of people.
> 
> If we do this, nobody will get around to fixing up the remaining users.

I would do that personally if someone explained inter_module_* to me.
Right now, I have absolutely no clue what the perceived problem was
and how inter_module_* supposedly solved that problem.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
