Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3K7-0007FT-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:38:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <13728558576.20010801164605@mail.ru> 
References: <13728558576.20010801164605@mail.ru> 
To: ASA <atris@mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: got stuck with DoC 2000: excuse me 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:44:42 +0100
Message-ID: <32364.997177482@redhat.com>
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

atris@mail.ru said:
> mtd-jffs-HOWTO. at first looking I did not saw this file at all :-(
> It says what I want... And that 2.2.x does not work with DoC...

2.2.x should work with DoC. It's only the module support which may give you 
trouble - and that should be relatively easy to fix if you actually care 
about it.

--
dwmw2
