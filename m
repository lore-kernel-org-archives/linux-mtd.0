Date: Sun, 9 Jan 2005 12:03:54 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050108211842.GA17176@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501091202440.19297@phoenix.infradead.org>
References: <20050108211842.GA17176@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joern Engel wrote:
> As an example, scan.c used to be really horrible (and contained one or
> two bugs).  After removing all the printk()s, I was able to see what
> the code was doing.  Then quite a few obvious changes were possible.
> Some things were simple changed to my personal style.  And finally,
> the data reading code was abstracted out of the scanning code, which
> resulted in about 120 lines less code.
I believe, having these debugging printk's is pretty good idea. I suspect 
you don't want to say opposite?

But as person who develop JFFS2 for several months, I may say that it is 
really not very readable, but that was not very big obstacle to understand 
it for me (but this is *real* obstacle when developing it, IMHO).
I have changed the debugging output a bit in JFFS3. But it is rather not 
for readability, but to make it more handy when developing (see 
jffs3/debug.h).

> Currently, the scanning should be substantially slower, but getting
> back to the old speed should be possible in less than 120 lines.
Sorry, I do not quite understand what changes do you mean. Was this 
something you previously did in scan.c?

I believe there is something which slows down scan process - the reading 
data to buffer and then scanning that buffer, instead of reading only 
really needed data. Seems like not very good technique.

> So: Do people want something like this for jffs3?  If noone cares, I
> will get back to my old behaviour of ignoring it.
Personally I would be happy to see JFFS3 
1) reformatted
2) uni-styled
3) well commented/documented

But anyway, I believe that JFFS3 shouldn't be just JFFS2-reformatted :-)
 
Would be good to agree on style and use it. Of course, Linux style is the 
main - but it is not too restrictive. People still use different styles. 
For example, Ferenc doesn't like tabs and uses whitespaces. :-)
This is minor, but still important, IMHO.

If you would like, just send you offers what to use (smth like JFFS2 
coding style), and we may put it to jffs3/JFFS3.Notes file for reference 
(after discussing).

P.S. I hope David won't mind :-)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
