Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168fxX-0004S6-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 10:59:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C025F36.95DBF879@sasken.com> 
References: <3C025F36.95DBF879@sasken.com> 
To: Ashok M Padmanaban <ashokmp@sasken.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
    JFFS mailing list <jffs-dev@axis.com>
Subject: Re: jffs2 ls hangs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Nov 2001 11:09:54 +0000
Message-ID: <17084.1006859394@redhat.com>
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

ashokmp@sasken.com said:
> Iam able to succesfully mount the partition and create small files and
> do ls to display them but when i copy a big file say (1MB file) to the
> 13 MB partition and do an ls it hangs.

Strange. Please could you show me the _decoded_ output of SysRq-T while 
it's hung, and also set CONFIG_JFFS2_FS_DEBUG=1, then 
echo 9 > /proc/sys/kernel/printk before reproducing the problem. Log all 
the messages it spews (there will be lots) and let me have them. 

> But last week i was actually downloading 7MB files and was able to
> succesfully able to do an ls. I dont know what went wrong. 

Hmmm. What changed? Did you update any code?

--
dwmw2
