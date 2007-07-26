Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDuHX-0006Kx-7q
	for linux-mtd@lists.infradead.org; Wed, 25 Jul 2007 23:44:57 -0400
Message-ID: <46A81923.3060503@ak.jp.nec.com>
Date: Thu, 26 Jul 2007 12:46:43 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
References: <369376.85924.qm@web57912.mail.re3.yahoo.com>
	<46A80A01.6010108@ak.jp.nec.com>
In-Reply-To: <46A80A01.6010108@ak.jp.nec.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Paul Wakeman <prwakeman@yahoo.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

KaiGai Kohei wrote:
> Is it possible to send the following logs?
> - "ls /" after "dmesg -n 8"
>  It seems to me that some warnning or notice messages from kernel are filtered
>  due to log message level configuration.
>  Xattr implementation has a possibility to return -EIO, but I could not found
>  those messages in jffs2-dbg-flashboot.log.gz.

In addition, is it possible to execute "ls <any other directories/files>" ?
e.g) $ ls /mnt

-- 
OSS Platform Development Division, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
