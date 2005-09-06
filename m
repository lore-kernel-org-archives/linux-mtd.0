Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECZKQ-0002DN-4R
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 05:01:24 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Peter Grayson <pgrayson@realmsys.com>
In-Reply-To: <1125550939.7076.14.camel@localhost.localdomain>
References: <1124840186.7086.19.camel@localhost.localdomain>
	<430F09E5.10607@inf.u-szeged.hu>
	<1125550939.7076.14.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 06 Sep 2005 13:00:45 +0400
Message-Id: <1125997245.8135.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Latest jffs2 broken?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-08-31 at 23:02 -0600, Peter Grayson wrote:
> > Did you try which earlier snapshot works correctly? It can be a good
> > starting point where the problem is. 2005-07-30? 2005-08-01? 2005-08-05?
> 
> This problem does not occur with 2005-08-01, but does with 2005-08-02.
> There were some significant changes to the frag tree code that went in
> between these two snapshots.
> 
> It appears that the offending code is in readinode.c. There is code in
> jffs2_get_inode_nodes(), read_dnode(), and read_more() that attempts to
> optimize the NAND (writebuffered) cases to avoid redundant reads of
> flash. When I removed these optimizations, the problem goes away and
> everything is quite happy. It was not obvious to me what is wrong with
> this code, but honestly, I'm too tired to figure it out now.
> 
> Regardless, I have attached the patch that makes latest mtd cvs work for
> me. I do not have high hopes that the powers that be will want to apply
> this patch, but I wanted to put it out there in case someone else is
> having the same trouble. Maybe someone more familiar with this code
> could take another look too.
> 
I have had my vacation, I will glance what is going on.
