Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U1dH-00078i-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 08:50:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B6571F2.6258156D@jurca.de> 
References: <3B6571F2.6258156D@jurca.de>  <30724FF712DFD2119E6200104B244892011974BC@mail1> 
To: Jan Debiec <jan.debiec@jurca.de>
Cc: Vipin Malik <Vipin.Malik@daniel.com>,
    "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS and RTLinux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 08:56:20 +0100
Message-ID: <12764.997170980@redhat.com>
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

jan.debiec@jurca.de said:
>  P.S. But the question is still open, why has MTD and JFFS problems
> with SMP flag set in kernel config. 

Reproduce on a non-RT kernel and use SysRq-P to find where it's blocking.

--
dwmw2
