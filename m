Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClqAP-0002cq-Fd
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2005 10:00:14 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id B257A2F016
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Jan 2005 16:00:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id A7AF2115ED
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Jan 2005 16:00:09 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 091337A1E
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Jan 2005 16:00:09 +0100 (CET)
Message-ID: <41DAAF79.8020401@imc-berlin.de>
Date: Tue, 04 Jan 2005 16:00:09 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD List <linux-mtd@lists.infradead.org>
References: <20040113125031.GA5146@angel.research.nokia.com>
In-Reply-To: <20040113125031.GA5146@angel.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Is there anything that could be done to reduce the mount time of large
> JFFS2 partitions?  Lazy mounting with prioritized scanning?

I wonder if the current CVS head is much better (i.e. faster) in mounting a 
JFFS2 root fs then linux-2.6.10?

Or in other words: does it make sense to use the current CVS instead of the code 
in linux-2.6.10?

--
Steven
