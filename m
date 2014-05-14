Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkikd-0007EY-40
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 23:38:20 +0000
Date: Wed, 14 May 2014 20:37:21 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/4] mtd: Introduce mtd_block_isreserved()
Message-ID: <20140514233721.GA19700@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140513013133.GA28907@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140513013133.GA28907@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 May 06:31 PM, Brian Norris wrote:
> On Fri, Mar 21, 2014 at 08:57:43AM -0300, Ezequiel Garcia wrote:
[..]
> >  
> > +int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> > +{
> > +	if (!mtd->_block_isreserved)
> > +		return 0;
> > +	if (ofs < 0 || ofs > mtd->size)
> > +		return -EINVAL;
> 
> At first, I was going to recommend that the out-of-bounds check go
> before the !mtd->_block_isreserved check, since it's best to warn users
> for invalid input. But then, mtd_block_isbad() has the same ordering, so
> it'd be nice to consistent...
> 
> Do we flip a coin to decide whether to change both or leave as-is? :)
> 

Actually, I just followed the same convention as all the other functions,
not just mtd_block_isbad().

I'll add a patch changing them all so the parameters checking is done first.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
