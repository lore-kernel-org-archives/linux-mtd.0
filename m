Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177BsT-000770-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 10:12:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020513114008.A3267@kosh.hut.fi> 
References: <20020513114008.A3267@kosh.hut.fi>  <13211.1020346858@redhat.com> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <912.1021230283@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Mon, 13 May 2002 10:11:46 +0100
Message-ID: <16057.1021281106@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jlavi@iki.fi said:
>  Is this too naive approach? This relies perhaps too much on the
> randomness of  semi-random numbers and might mean only first few nodes
> are ever picked up  and never nodes from the tail. 

I think naïve is fine. In fact, I can't even justify the suggestion that it 
be exponential -- we could probably do just as well by picking the first 
(i.e. dirtiest) block with 85% probability, and picking some other block 
off the list with uniform distribution the other 15% of the time.

--
dwmw2
