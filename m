Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178dYT-0005FA-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 09:57:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517084644.525B52756@sitemail.everyone.net> 
References: <20020517084644.525B52756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 09:57:40 +0100
Message-ID: <14935.1021625860@redhat.com>
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

zeusj@firstlinux.net said:
> Maybe I just use the wrong version of mkfs.jffs2
> what I am using is "mkfs.jffs2 revision 1.8"

Cross-endian support was added in revision 1.9, over a year ago. The 
current version in 1.25.

> And... is there any difference in mkfs.jffs2 between different
> architecture? I mean, is the mkfs.jffs2 for M68K different from
> mkfs.jffs2 for ARM? 

Nope, the only real difference will be the endianness.

--
dwmw2
