Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D114T-00013w-LT
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 06:40:50 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 350FE2F017
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2005 12:40:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 2B3A611764
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2005 12:40:47 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 7948987D9
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2005 12:40:46 +0100 (CET)
Message-ID: <4211DFBC.2080901@imc-berlin.de>
Date: Tue, 15 Feb 2005 12:40:44 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1107439704.32168.66.camel@fuzzie.sanpeople.com>
In-Reply-To: <1107439704.32168.66.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2_FS_WRITEBUFFER config option
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> As per discussions on IRC, this patch replaces the current
> CONFIG_JFFS2_FS_NAND, CONFIG_JFFS2_FS_NOR_ECC and
> CONFIG_JFFS2_FS_DATAFLASH with a single configuration option - 
> CONFIG_JFFS2_FS_WRITEBUFFER.

IIUC than I dont need to enable this option for plain old NOR flash. Right?

-- 
Steven
