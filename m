Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wQkj-0003vr-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 17:19:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BD6E171.3856A900@infineon.com> 
References: <3BD6E171.3856A900@infineon.com>  <3BD575F2.35D16336@infineon.com> <18479.1003845325@redhat.com> 
To: amit lubovsky <amit.lubovsky@infineon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mount of JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 Oct 2001 17:28:52 +0100
Message-ID: <8331.1003940932@redhat.com>
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

amit.lubovsky@infineon.com said:
>  after copying the file system to that device and I got the following:
> 
> VFS: Mounted root (jffs filesystem) readonly.

You've mounted it as JFFS not JFFS2.

--
dwmw2
