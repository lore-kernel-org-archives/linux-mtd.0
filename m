Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EiG0z-0004Ol-V2
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 13:52:15 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 35FE42EFDF
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 19:52:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 2BDCC125D4
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 19:52:10 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 5E91D124B0
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 19:52:09 +0100 (CET)
Message-ID: <439097CD.7000901@imc-berlin.de>
Date: Fri, 02 Dec 2005 19:51:57 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: When to call cfi_amdstd_suspend() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I implemented my MTD board driver as a platform device with support for
suspend/resume.

Upon suspend-to-ram its ->suspend() funktion is called three times for
levels SUSPEND_DISABLE, SUSPEND_SAVE_STATE and SUSPEND_POWER_DOWN.

In which level should I call the MTD suspend function (i.e.
cfi_amdstd_suspend() in my case) ?
What happens if I called it in every level as it is done in pxa2xx-flash.c?

Similar situation in the resume path.

Thanks,

Steven
