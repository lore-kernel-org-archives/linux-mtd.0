Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170z1l-0000iN-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 07:16:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CC8C1C9.80709@yottayotta.com> 
References: <3CC8C1C9.80709@yottayotta.com> 
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org,
    linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Apr 2002 07:16:07 +0100
Message-ID: <14375.1019801767@redhat.com>
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

mshah@yottayotta.com said:
>  I'm booting from flash... but during bootup jffs2 erases some things
> it  seems??

> "inode #7 was a directory with children ... removing those too" 

The line before that would probably have given an indication of _why_ it 
felt it needed to remove inode #7.

--
dwmw2
