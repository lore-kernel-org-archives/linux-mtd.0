Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fNA1-0003OB-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 15:35:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0202250738270.28327-100000@rangers.comdev.cc> 
References: <Pine.LNX.4.33.0202250738270.28327-100000@rangers.comdev.cc> 
To: Adam Wozniak <awozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 dir.c file.c write.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Feb 2002 15:46:46 +0000
Message-ID: <7023.1014652006@redhat.com>
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
>  Should these wind up in the 2_4 branch as well?

No. The rules changed to support the extra stuff that NAND flash does when 
we add nodes to the lists. It's not required in the 2.4 branch. 

--
dwmw2
