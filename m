Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMRdJ-0007py-Ct
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 10:50:42 -0400
Date: Mon, 3 Oct 2005 16:49:36 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20051003144935.GG4639@wohnheim.fh-wedel.de>
References: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
	<43413716.1040402@yandex.ru>
	<20051003142851.GE4639@wohnheim.fh-wedel.de>
	<43414378.80005@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43414378.80005@yandex.ru>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 October 2005 18:43:04 +0400, Artem B. Bityutskiy wrote:
> Jörn Engel wrote:
> >Bad suggestion then.  Try to draw a complete graph of all possible
> >users to this static structure, the locking required to make it
> >correct, then prove its correctness.
> Oh, It is not constant anymore (we have the "erasecount" filed there). 
> Right. It must not be static. Zhao, I apologize for incorrect suggestion.
> 
> >
> >If that didn't already scare you to death, try to anticipate future
> >code changes to such brittle code.
> Yes, yuo could have just proved its incorrectnes in 2-3 words instead.

It's always hard to anticipate why people are barking up the wrong
tree.  Instead of figuring it out, the quick solution is to take a
chainsaw and cut the tree down.  Not pretty, but it works.

Jörn

-- 
Prosperity makes friends, adversity tries them.
-- Publilius Syrus 
