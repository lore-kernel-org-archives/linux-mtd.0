Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bkld-0005nG-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 15:59:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F0EAFC8@sekhmet.ad.newisys.com> 
References: <D3A72C5007329A4F991C0DD87202259F0EAFC8@sekhmet.ad.newisys.com> 
To: "Navin Boppuri" <navin.boppuri@newisys.com>
Cc: "Chris Vagnini" <cvagnini@bigfoot.com>,
    linux-mtd@lists.infradead.org
Subject: Re: Weird status information on JFFS2 File System 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Feb 2002 16:10:24 +0000
Message-ID: <5007.1013789424@redhat.com>
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

navin.boppuri@newisys.com said:
>  Is there some way I can change the 5 erase blocks default to a
> smaller size? What are the implications of doing that?

grep RESERVED fs/jffs2/nodelist.h

The danger in reducing it too far is that you'll run out of free space 
entirely, so that garbage collection cannot continue and your file system 
gets entirely stuck. We ought to be able to reduce it to only a block or 
two, but the code wants auditing for safety first - we have to ensure that 
we never expand while garbage-collecting.

--
dwmw2
