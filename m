Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iHKk-0001vx-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 15:58:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> 
References: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> 
To: Adam Wozniak <awozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Mar 2002 16:09:56 +0000
Message-ID: <14085.1015344596@redhat.com>
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

awozniak@comdev.cc said:
>  Are these changes that need to make it into the 2_4_branch ?

No. They were utterly broken changes that even needed to be reverted from 
the trunk. The 2_4-branch is up to date, with the possible exception of the 
shared-zlib stuff which I'm debating backporting.

--
dwmw2
