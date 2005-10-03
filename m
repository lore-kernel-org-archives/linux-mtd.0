Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMRJP-0007C1-9r
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 10:29:22 -0400
Date: Mon, 3 Oct 2005 16:28:51 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20051003142851.GE4639@wohnheim.fh-wedel.de>
References: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
	<43413716.1040402@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43413716.1040402@yandex.ru>
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

On Mon, 3 October 2005 17:50:14 +0400, Artem B. Bityutskiy wrote:
> zhao forrest wrote:
> > Artem asked me to remove allocation on the stack, so who should I listen 
> > to? This really made me very very confused :(
> Yes, I suggested to share one static clean-marker structure for both
> NAND and NOR cases.

Bad suggestion then.  Try to draw a complete graph of all possible
users to this static structure, the locking required to make it
correct, then prove its correctness.

If that didn't already scare you to death, try to anticipate future
code changes to such brittle code.

In one word: don't.

> >> What was (c->cleanmarker_size == 0) used for?
> > 
> > For the flash that don't need a clean marker.
> No, that worked for NAND this way (c->cleanmarker_size was 0)

So why is this part unnecessary now?  Or should it just be replaced by
something else?

Jörn

-- 
Unless something dramatically changes, by 2015 we'll be largely
wondering what all the fuss surrounding Linux was really about.
-- Rob Enderle
