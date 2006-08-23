Received: from mail.imc-berlin.de ([217.110.46.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GFuKn-0005RT-Lz
	for linux-mtd@lists.infradead.org; Wed, 23 Aug 2006 16:08:02 +0100
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id D13CD2F026
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Aug 2006 18:01:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 6C378A388
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Aug 2006 17:07:30 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 8B93BA26E
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Aug 2006 17:07:29 +0200 (CEST)
Message-ID: <44EC6F2F.7070508@imc-berlin.de>
Date: Wed, 23 Aug 2006 17:07:27 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: PM for physmap.c ?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

for quite some time physmap.c uses platform_{device,driver}.

I wonder why it does not contain any (generic) code for power management
yet, i.e. .suspend/.resume functions.

Is it correct that all I would need to survive a suspend/resume cycle is
something like

int physmap_flash_suspend(struct platform_device *dev, pm_message_t state)
{
	struct sa_info *info = platform_get_drvdata(dev);
	int ret = 0;
	if (info)
		ret = info->mtd->suspend(info->mtd);
	return ret;
}

int physmap_flash_resume(struct platform_device *dev)
{
	struct sa_info *info = platform_get_drvdata(dev);
	if (info)
		info->mtd->resume(info->mtd);
	return 0;
}

as stolen from sa1100-flash.c? Or is PM done at some other/higher layer of
the MTD stuff?

Cheers,

-- 
Steven
