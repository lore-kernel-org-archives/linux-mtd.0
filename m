Received: from www.peppercon.com ([217.160.72.114] helo=www.dyndns-access.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrbpA-0003i8-4N
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 07:54:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by www.dyndns-access.com (Postfix) with ESMTP id B5AFDD6C02
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Jan 2005 13:56:32 +0100 (CET)
Received: from [192.168.101.10] (p3E9EBCE9.dip.t-dialin.net [62.158.188.233])
	by www.dyndns-access.com (Postfix) with ESMTP id 05FAED6C02
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Jan 2005 13:56:30 +0100 (CET)
Message-ID: <41EFAA38.3010903@peppercon.de>
Date: Thu, 20 Jan 2005 13:55:20 +0100
From: Thomas Weber <tweb@peppercon.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Guaranteed writable space on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've a problem with JFFS2 (kernel 2.4.26) on a NOR flash with 128k blocks.
Due to previous unexpected behaviour, I've already changed

> super.c@85:
> -       avail = c->dirty_size + c->free_size;
> +       avail = (c->dirty_size / c->sector_size) * c->sector_size + c->free_size;

as GC returns ENOSPC on dirty size < sector size. This occurs quite 
often on a nearly full fs with 128k blocks.
By now, e.g. df provides the physical free space, but I do not know how 
much of this space is really writable, since I do not know how much is 
necessary file system organisation, inodes, etc.
Is there a way to predict the maximum file size, which will still be 
writable?

Thanks for your suggestions,
Thomas
