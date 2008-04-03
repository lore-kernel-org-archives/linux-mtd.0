Received: from wx-out-0506.google.com ([66.249.82.235])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhOcV-0005sc-Ip
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 12:32:43 +0000
Received: by wx-out-0506.google.com with SMTP id s7so3100628wxc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Apr 2008 05:32:42 -0700 (PDT)
Subject: Re: UBIFS: media format changes
From: Josh Boyer <jwboyer@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1207222625.8040.4.camel@sauron>
References: <1207222625.8040.4.camel@sauron>
Content-Type: text/plain
Date: Thu, 03 Apr 2008 07:32:30 -0500
Message-Id: <1207225950.3224.1.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-03 at 14:37 +0300, Artem Bityutskiy wrote:
> Hi all,
> 
> as we have announced UBIFS, it is good idea to notify people
> who may try to use it about media format changes.

Should probably send this to lkml since you posted patches there.

> We now store nanoseconds in [amc]time in inodes, not just seconds,
> and the latest UBIFS is incompatible to the previous versions,
> which means it will refuse mounting older images.
> 
> You should also update mkfs.ubifs utility.

Is there a ubifs.fsck utility?  If so, could it be made to convert the
old media format to the new?  Or am I living in a dream world? :)

josh
