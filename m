Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cC5L-0005nQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 21:37:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B8D391D.F0272295@inn.ericsson.se> 
References: <3B8D391D.F0272295@inn.ericsson.se> 
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Cc: "mtd@infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: warning or debug text ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Aug 2001 21:43:00 +0100
Message-ID: <13755.999117780@redhat.com>
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

kenneth.johansson@inn.ericsson.se said:
>  In the mtd subsystem it's ALOT of this. Should I just add KERN_DEBUG
> to everything ?? It's not nice to get stuff on the console when it's
> only a warning or debug info. 

Making them KERN_DEBUG or better still putting them inside some kind of 
DEBUG macro like the ones in some other files would be useful. If you do 
this, please could you let me have a patch?

--
dwmw2
