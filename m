Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iJGo-00026E-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 18:02:38 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> 
References: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> 
To: Adam Wozniak <awozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Mar 2002 18:13:59 +0000
Message-ID: <1254.1015352039@redhat.com>
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

I've imported one more change onto the jffs2-2_4-branch and also made a 
public BK repository for it, including the shared-zlib stuff.

http://linux-mtd.bkbits.net/

The shared zlib patch is at ftp.XX.kernel.org:/pub/linux/kernel/people/dwmw2
and should apply to the 2.4 kernel with or without the few changes which 
have been made since I updated Marcelo's tree to the jffs2-2_4-branch.

The trunk ought to be working though, and testing would be appreciated.

--
dwmw2
