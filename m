Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173hGq-0005Xl-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 18:55:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020503201900.A32761@kosh.hut.fi> 
References: <20020503201900.A32761@kosh.hut.fi>  <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 03 May 2002 18:54:34 +0100
Message-ID: <28528.1020448474@redhat.com>
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
>  During my benchmark runs I have encountered 'Eep. read_inode() failed
> for  ino #...'. Is this something I should be concerned?

Er, yes, that is concerning. Does it say why? If it's only occasional, then 
it's almost certainly memory allocation problems. 

It would be useful if you could provide a profiling run from the
worst-performing case, so we can see where it's spending the time. I've 
already voiced my suspicions, but I've been wrong before; I only wrote it :)

--
dwmw2
