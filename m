Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0Kq4-0005ma-An
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 10:02:53 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id BDE132F023
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2004 16:02:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 98BF0A323
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2004 16:02:49 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 1B835A31D
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2004 16:02:49 +0200 (CEST)
Message-ID: <412DED87.3080609@imc-berlin.de>
Date: Thu, 26 Aug 2004 16:02:47 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
In-Reply-To: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jochen Karrer wrote:

> Hi,
> jffs2 did not work in linux-2.6.8.1 because single word writes at the end
> of a buffer write are done with the wrong address:
> 

Aah! Thanks a million! I already started think that my hardware was broken...

-- 
Steven
