Date: Tue, 16 Nov 2004 14:21:31 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100613327.8191.6954.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.58.0411161405080.27293@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
	<1100613327.8191.6954.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: your mail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 Nov 2004, David Woodhouse wrote:

> On Tue, 2004-11-16 at 13:48 +0000, Artem B. Bityuckiy wrote:
> > Hello David,
> > 
> > When I create checkpoints, I read all the nodes which will be referred by 
> > this checkpoint and check their CRCs. This is because we must trust 
> > checkpoints and do not check CRCs for them on the iget() call.
> > 
> > When the Garbage Collector moves node, which is currently referred by an 
> > checkpoint inact (I mean the jffs2_garbage_collect_pristine() function), 
> > we have to read this node after we GC it. This is the problem. The unclean 
> > reboot may happed and we can not guarantee that all noted in checkpoint 
> > are OK. :-(
> > 
> > So, how do you think is it absolutely necessary to check that nodes which 
> > are reffered by checkpoint are OK? Is it OK if we just detect errors when 
> > we actually read file?
> 
> No, that's not OK. We'd actually lose the data in that case, surely? We
> _need_ to pick up the new copy of the node, if the old one is absent.
> Either we have to obsolete the newer checkpoint or we have to ignore the
> checkpoint data if we get a failure, and rescan properly.
> 
> -- 
> dwmw2
> 
> 
:-((

Very bad...
This means that checkpoints will have short live-time. I mean, that if we 
have some read-only file and have generated the checkpoint for this file, 
we will need to rewrite the checkpoint periodically when it becomes 
obsolete because the file's nodes are moved by the GC.... :-(

I call checkpoint obsolete when:
1. The newer checkpoint exist (usual meaning)
2. More that N % of nodes, referred by the checkpoint are disappeared 
since were Garbage Collected.

I dreamed about checkpoints which we may write only once for constant 
files (for example, glibc libraries) ....

So, this problem is solvable I believe, but no I'm not quite sure are 
checkpoints will be so useful as I thought ... 

 -- Best 
Regards, Artem B. Bityuckiy,
St.-Petersburg, Russia.
