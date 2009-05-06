Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1bWW-0003nH-GQ
	for linux-mtd@lists.infradead.org; Wed, 06 May 2009 07:26:43 +0000
Received: by ewy25 with SMTP id 25so9089110ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 May 2009 00:26:34 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 May 2009 09:26:33 +0200
Message-ID: <72795ccb0905060026q7dcb45c0u15c35943374fcc78@mail.gmail.com>
Subject: Load UBI faster
From: simon polette <spolette@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to improve boot time on a at91sam9261ek board. I boot on
nand flash with ubifs. It take about 400ms to load ubi and ubifs.
Do you know if fastboot technology, which consist in loading drivers
asynchronously, is conceivable with UBI ?
Thanks for your help.

Best regards.

Simon P.
