Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JdzL-0008NJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 18:11:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0067E3B6-07A9-11D7-937A-000393467F1A@arlut.utexas.edu> 
References: <0067E3B6-07A9-11D7-937A-000393467F1A@arlut.utexas.edu> 
To: Ken Offer <koffer@arlut.utexas.edu>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: Re: Problem: 51MB partition max size on jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Dec 2002 18:41:44 +0000
Message-ID: <13763.1039027304@passion.cambridge.redhat.com>
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

koffer@arlut.utexas.edu said:
>   Trying to mount a  larger partition yields a less than helpful error
> message from mount.   I've tried adding printk statements to the jffs2
> code, but none of them  get hit during the errant mount process.

Set CONFIG_JFFS2_FS_DEBUG=1, show the output.

--
dwmw2
