Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1ImHyK-0004h4-5k
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 19:55:18 -0400
Date: Mon, 29 Oct 2007 00:49:51 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: getdents64 problem in 2.6.23
Message-ID: <20071028234950.GA25386@lazybastard.org>
References: <023b01c81824$71647f40$5267a8c0@Jocke>
	<1193440660.16168.57.camel@shinybook.infradead.org>
	<20071027231812.GA21216@lazybastard.org>
	<20071028182836.GE14076@mail.shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071028182836.GE14076@mail.shareable.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 28 October 2007 18:28:36 +0000, Jamie Lokier wrote:
> 
> However, I think it's fine to _overwrite_ the deletion dirents with
> new ones.  getdentds() allows new names created during a directory
> read to appear or not in the lsit.

Correct.  You can delete/overwrite dentries, but you may not rearrange
their order wrt. i_pos cookies.

Jörn

-- 
Admonish your friends privately, but praise them openly.
-- Publilius Syrus
