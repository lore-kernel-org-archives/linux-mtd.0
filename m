Date: Tue, 16 Nov 2004 13:48:48 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: (no subject)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

When I create checkpoints, I read all the nodes which will be referred by 
this checkpoint and check their CRCs. This is because we must trust 
checkpoints and do not check CRCs for them on the iget() call.

When the Garbage Collector moves node, which is currently referred by an 
checkpoint inact (I mean the jffs2_garbage_collect_pristine() function), 
we have to read this node after we GC it. This is the problem. The unclean 
reboot may happed and we can not guarantee that all noted in checkpoint 
are OK. :-(

So, how do you think is it absolutely necessary to check that nodes which 
are reffered by checkpoint are OK? Is it OK if we just detect errors when 
we actually read file?

Thanks.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
