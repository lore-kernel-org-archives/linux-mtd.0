Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h8oZ-00065q-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 14:12:55 +0100
Date: Tue, 20 Aug 2002 15:12:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jamey Hicks <jamey.hicks@hp.com>, Christopher Hoover <ch@murgatroid.com>,
        "'Conn Clark'" <clark@esteem.com>,
        "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable?
Message-ID: <20020820131204.GA25918@wohnheim.fh-wedel.de>
References: <3D623224.1090604@hp.com> <007201c247e0$1022fcd0$a15f040f@SNAGGLE> <32719.1029838865@redhat.com> <12777.1029845954@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12777.1029845954@redhat.com>
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

On Tue, 20 August 2002 13:19:14 +0100, David Woodhouse wrote:
> Yeah -- you're probably right. That's the reason I refused to do the 
> automatic unlock when it was originally suggested. We are fairly good about 
> aborting a mount attempt if it really doesn't look like a JFFS2 partition, 
> but if you have the partitioning wrong so that the range we try to mount 
> includes some JFFS2 _and_ something important, that's still going to break.

And if we have an old jffs2 partition that was partially overwritten
by cramfs. Without a prior erase, this will be identified as jffs2.

Pretty rare in production systems, though.

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
