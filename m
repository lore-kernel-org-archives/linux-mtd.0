From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1100613327.8191.6954.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 16 Nov 2004 13:55:27 +0000
Content-Transfer-Encoding: 7bit
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

On Tue, 2004-11-16 at 13:48 +0000, Artem B. Bityuckiy wrote:
> Hello David,
> 
> When I create checkpoints, I read all the nodes which will be referred by 
> this checkpoint and check their CRCs. This is because we must trust 
> checkpoints and do not check CRCs for them on the iget() call.
> 
> When the Garbage Collector moves node, which is currently referred by an 
> checkpoint inact (I mean the jffs2_garbage_collect_pristine() function), 
> we have to read this node after we GC it. This is the problem. The unclean 
> reboot may happed and we can not guarantee that all noted in checkpoint 
> are OK. :-(
> 
> So, how do you think is it absolutely necessary to check that nodes which 
> are reffered by checkpoint are OK? Is it OK if we just detect errors when 
> we actually read file?

No, that's not OK. We'd actually lose the data in that case, surely? We
_need_ to pick up the new copy of the node, if the old one is absent.
Either we have to obsolete the newer checkpoint or we have to ignore the
checkpoint data if we get a failure, and rescan properly.

-- 
dwmw2
