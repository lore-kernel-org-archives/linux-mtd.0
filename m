Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vhbM-0002kL-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 16:34:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <A3E34B558F5CD211B4980008C7A4A99003163EC8@sparrow.eng.gilbarco.com> 
References: <A3E34B558F5CD211B4980008C7A4A99003163EC8@sparrow.eng.gilbarco.com> 
To: "Williams, Kevin M." <kevin.m.williams@marconi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: erase and 2.4.4 kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 May 2001 16:34:54 +0100
Message-ID: <14605.988990494@redhat.com>
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

Recompile the 'erase' binary, making sure it's looking at the new header 
files.

--
dwmw2
