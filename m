Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178KJP-0003Ph-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 13:24:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020516090540.EB5162756@sitemail.everyone.net> 
References: <20020516090540.EB5162756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 13:24:49 +0100
Message-ID: <30263.1021551889@redhat.com>
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
> But I cant mount the jffs.img which was copied to mtdblock0(it has
> been *completely* erased) after booting.

Are you sure the JFFS2 image was created correctly? Is your target 
bigendian? If you read the image back from mtdblock0 after writing it and 
compare with the original, is it intact? Can you send me the image?

--
dwmw2
