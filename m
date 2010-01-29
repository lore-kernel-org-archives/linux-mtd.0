Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nap62-0004Vt-Dc
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 11:33:10 +0000
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <20100129112757.GA1309@gondor.apana.org.au>
References: <4B591573.60602@theptrgroup.com>
	<1264480808.2401.78.camel@localhost.localdomain>
	<1264484928.3536.1017.camel@calx> <1264500214.3867.21.camel@localhost>
	<4B5F9A78.7080000@theptrgroup.com> <1264558433.3536.1543.camel@calx>
	<4B5FADE8.30803@theptrgroup.com>
	<1264566010.2401.143.camel@localhost.localdomain>
	<20100129112757.GA1309@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 Jan 2010 13:32:09 +0200
Message-ID: <1264764729.4371.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jeff Angielski <jeff@theptrgroup.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, Matt Mackall <mpm@selenic.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 22:27 +1100, Herbert Xu wrote:
> On Wed, Jan 27, 2010 at 06:20:10AM +0200, Artem Bityutskiy wrote:
> >
> > Thanks for testing. So, who would bring Matt's patch upstream then, hmm?
> 
> I've got it in crypto-2.6.  Thanks!

I'd appreciate an URL.

I've just cloned:

git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6

and do not see it there.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
