Date: Wed, 17 Nov 2004 10:20:19 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100686018.9201.49.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.58.0411171017450.5169@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411171003510.5169@phoenix.infradead.org>
	<1100686018.9201.49.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 improvement idea
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 2004-11-17 at 10:06 +0000, Artem B. Bityuckiy wrote:
> > In deletion direntries, why not to store the physical offset of the
> > deleted direntry (instead of, say, mctime field)?
>
> I need more coffee before I give a coherent answer -- and I need _lots_
> of it before I can comment on Ferenc's code, although that looks very
> good so far.
Ok, I hope we will discuss this later.

>
> But remember the deletion dirent node can obsolete more than one old
> dirent, on NAND flash. When we GC a dirent node, we weren't able to
> immediately mark the old one obsolete so there can be two. Or more, if
> this keeps happening and we lose power each time we GC the node in
> question.
It seems to me this is not problem...

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
