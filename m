Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pkp5-00083F-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 08:25:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E17pfu5-0001pj-00@granger.mail.mindspring.net> 
References: <E17pfu5-0001pj-00@granger.mail.mindspring.net> 
To: Kyle Harris <kharris@nexus-tech.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.5 questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Sep 2002 08:24:49 +0100
Message-ID: <10485.1031901889@redhat.com>
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
> How do I get the latest code base for 2.5 kernels? I pulled the latest
> cvs  but it appears this must be for 2.4 since it doesn't compile. Is
> there a  separate branch for 2.5?

Should do. What breaks? It'll only be cosmetic, surely?

> How stable is mtd for 2.5? I'm seeing some very strange behavior where
> if I  make slight mods to even script files, the files become unusable
> and cause  the system to hang. I'm running 2.5.30-rmk1-pxa1 with jffs2
> root fs. 

Not expected to break. Not highly tested either. More details please. 
SysRq-T is your friend.

--
dwmw2
