Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aPPJ-0002CB-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 00:31:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003d01c2399a$b519a9e0$0200a8c0@telia.com> 
References: <003d01c2399a$b519a9e0$0200a8c0@telia.com>  <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: write suspend and/or erase suspend 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Aug 2002 00:31:00 +0100
Message-ID: <12285.1028244660@redhat.com>
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

Joakim.Tjernlund@lumentis.se said:
> When a erase or write is suspened to allow some other part of the FS
> to read, is that read garanted to read from another sector than the
> one that has been suspended?

> I am asking since I think it's not allowed to access the sector that
> has a  suspended operation. I am using Intel Strata Flash. 

Correct. Currently we don't suspend writes, but when we do we need to make 
sure we get that right. Reading from a block on which an erase is in 
progress is a silly idea anyway, so I don't care that we don't check for 
that and make the reader wait.

--
dwmw2
