Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mCrY-0007cA-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 13:32:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E17mB69-0007Oq-00@pentafluge.infradead.org> 
References: <E17mB69-0007Oq-00@pentafluge.infradead.org> 
To: "" <yanhy@tsinghua.org.cn>
Cc: davidm@snapgear.com, linux-mtd@lists.infradead.org
Subject: Re: problem of mounting jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 03 Sep 2002 13:32:29 +0100
Message-ID: <16569.1031056349@redhat.com>
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

yanhy@tsinghua.org.cn said:
>  I'v managed to compile my kernel with mtd and jffs support
> successfully,but  I can't delete or edit files or build directories on
> jffs partitions,why?

Is there any particular reason you're using JFFS instead of JFFS2?

Not that I expect you to have this problem with JFFS -- I expect it's a 
hardware/driver problem. But it would be better if you could debug that 
with JFFS2.

--
dwmw2
