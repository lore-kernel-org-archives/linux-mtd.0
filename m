Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kRtl-0001My-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 17:11:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6E4770.6050905@goepel.com> 
References: <3D6E4770.6050905@goepel.com>  <3D6E2A8D.4000502@goepel.com> <24260.1030630287@redhat.com> 
To: Michael Palme <m.palme@goepel.com>
Cc: MTD Mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: 2.4.18-rmk7 + CVS jffs2 ld error (zlib) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 29 Aug 2002 17:11:52 +0100
Message-ID: <3487.1030637512@redhat.com>
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

m.palme@goepel.com said:
>  background.c:92: warning: implicit declaration of function
> `set_user_nice' fs/fs.o(.text+0x363a0): undefined reference to
> `set_user_nice' 

Just comment out the offending line in background.c

--
dwmw2
