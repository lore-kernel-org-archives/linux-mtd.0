Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ptgg-0000vs-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 17:52:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E17pqz1-0001Gd-00@smtp6.mindspring.com> 
References: <E17pqz1-0001Gd-00@smtp6.mindspring.com>  <E17pp24-0003UD-00@maynard.mail.mindspring.net> <10485.1031901889@redhat.com> <7964.1031921149@redhat.com> 
To: Kyle Harris <kharris@nexus-tech.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.5 questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Sep 2002 17:52:45 +0100
Message-ID: <8086.1031935965@redhat.com>
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

kharris@nexus-tech.net said:
>  Yes. I fixed this one and then the compile failed someplace else. So
> it  appeared that the code was not compatible with 2.5. So that's why
> I asked. 

Most of it now compiles with 2.5. Only the block devices remain -- they 
need more attention and probably we'll end up splitting them into separate 
files for <=2.4 and >=2.5.

--
dwmw2
