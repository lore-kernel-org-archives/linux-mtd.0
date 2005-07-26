Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxPGN-0007ZN-Df
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:14:33 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id CBEC82F016
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 13:22:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 1A43D12139
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 15:14:26 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 58AB811CAA
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 15:14:25 +0200 (CEST)
Message-ID: <42E63731.8010209@imc-berlin.de>
Date: Tue, 26 Jul 2005 15:14:25 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>
	<42E634D0.6090300@inf.u-szeged.hu>
In-Reply-To: <42E634D0.6090300@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc,

  > Martin, you may should try our Centralizes Summary (CS) patch. It stores
> every relevant memory representation at umount time, so at mount (if the
> previous unmount was a clean one) you need only to read it without any
> scanning and rebuilding.

Does writing "every relevant memory representation" significantly increase 
umount time?

--
Steven
