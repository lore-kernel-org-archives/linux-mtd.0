From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0411171003510.5169@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411171003510.5169@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 17 Nov 2004 10:06:58 +0000
Message-Id: <1100686018.9201.49.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2004-11-17 at 10:06 +0000, Artem B. Bityuckiy wrote:
> In deletion direntries, why not to store the physical offset of the 
> deleted direntry (instead of, say, mctime field)?

I need more coffee before I give a coherent answer -- and I need _lots_
of it before I can comment on Ferenc's code, although that looks very
good so far. 

But remember the deletion dirent node can obsolete more than one old
dirent, on NAND flash. When we GC a dirent node, we weren't able to
immediately mark the old one obsolete so there can be two. Or more, if
this keeps happening and we lose power each time we GC the node in
question.

-- 
dwmw2
