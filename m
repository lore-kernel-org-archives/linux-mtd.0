Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HSti-0002Bp-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2001 17:19:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <005f01c103db$b9336980$0301a8c0@landgarten.local> 
References: <005f01c103db$b9336980$0301a8c0@landgarten.local> 
To: Harris Landgarten <harrisl@samsungcctvusa.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Magic 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 03 Jul 2001 17:25:09 +0100
Message-ID: <26013.994177509@redhat.com>
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

harrisl@samsungcctvusa.com said:
>  Everything seems to work properly after boot but I am getting a bad
> magic message and JFFS2 scan right after JFFS2 loads but before the
> root filesystem is mounted.

The 'bad magic' message probably comes from cramfs, which is looking at the 
filesystem before JFFS2, and is rejecting it because the magic number which 
would mark it as a cramfs filesystem is absent.

It's harmless.


--
dwmw2
