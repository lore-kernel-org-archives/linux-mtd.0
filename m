Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c3QR-0006C5-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 13:26:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw> 
References: <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw>  <003501c23d10$5f6c4f60$1b0448c0@gv.com.tw> <01c201c23c69$7995faa0$1b0448c0@gv.com.tw> <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com> <31970.1028543113@redhat.com> <000701c23cfe$a1542040$1b0448c0@gv.com.tw> <31481.1028622389@redhat.com> 
To: "??" <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org, "? ??" <djh@gv.com.tw>, cms@gv.com.tw,
    "jiunrong" <jiunrong@gv.com.tw>
Subject: Re: fail to rm files when jffs2 is full 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Aug 2002 13:26:55 +0100
Message-ID: <31830.1028636815@redhat.com>
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

kevin@gv.com.tw said:
> when we test disk-full with jffs2/mtd, we fail to rm files when jffs2
> is full

Were there any other errors leading up to this? The flash should never get 
so full that it doesn't allow you to remove things.

--
dwmw2
