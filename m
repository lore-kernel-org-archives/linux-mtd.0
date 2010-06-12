Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONGk9-0000Oj-MT
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 02:46:46 +0000
Received: by yxh35 with SMTP id 35so747865yxh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jun 2010 19:46:43 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Fri, 11 Jun 2010 22:46:43 -0400
Message-ID: <AANLkTik2mO4lpL5QA1kzMf4zp-Prd-SdhSNLVcHB9isl@mail.gmail.com>
Subject: detecting that ubifs switched to ro after problem
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'd like to be able to somehow detect that ubifs has taken the action
of switching from rw to ro due to some error detected in the ubifs
filesystem. If I can detect this then maybe I can do something about
it, such as copying the ubifs contents to a .tar.bz2 in /tmp,
mkfs.ubifs, and restore .tar.bz2 back again.

Is there a way I can do this?

Thanks,
Jon
