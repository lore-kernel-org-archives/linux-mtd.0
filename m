Received: from lvs3.netcore.co.in ([202.162.240.3] helo=lvs2.netcore.co.in)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gcv12-00065A-JO
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 22:30:52 -0400
Received: from uucp3.netcore.co.in (uucp3.netcore.co.in [202.162.229.13])
	by lvs2.netcore.co.in (Postfix) with ESMTP id A81EC352186
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Oct 2006 08:00:29 +0530 (IST)
Received: from uucp1.netcore.co.in (unknown [192.168.2.1])
	by uucp3.netcore.co.in (Postfix) with ESMTP id EB9333B88D
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Oct 2006 08:00:28 +0530 (IST)
Received: from thick.localnova.com (unknown [10.7.138.16])
	by chennai.novatium.com (Postfix) with ESMTP id 287DD7C004D
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Oct 2006 08:33:32 +0530 (IST)
Subject: MTD:do_write_buffer():software timeout
From: harishkumar <harishkumar@novatium.com>
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 26 Oct 2006 07:55:06 +0530
Message-Id: <1161829506.31433.3.camel@thick.localnova.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: harishkumar@novatium.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using linux-2.6.10 kernel & mounted a jffs2 filesystem.
I used NOR flash.
During erasing my filesystem partition, iam getting
MTD:do_write_buffer():software timeout repeatedly.

I enabled write-buffer method in kernel during compiling jffs2.

Is there any fix or patch for this...
Please help guys...

harish
