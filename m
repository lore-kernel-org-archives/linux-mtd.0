Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17miTn-0002an-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 23:18:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020904123521.26470.h002.c007.wm@mail.directvinternet.com.criticalpath.net> 
References: <20020904123521.26470.h002.c007.wm@mail.directvinternet.com.criticalpath.net> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: recalc_sigpending() - multiple defines 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 23:18:24 +0100
Message-ID: <23619.1031177904@redhat.com>
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

acurtis@onz.com said:
>  When compiling with Module versioning support I get an warning
> regarding redefinition of recalc_sigpending() from linux/mtd/
> compatmac.h

> Is this anything to worry about? Is there a good solution for this?

I've committed a workaround for this.

--
dwmw2
