Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5kmL-0003XG-BN
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2004 12:13:09 +0000
Received: from sonne.eurodsn.de (sonne.eurodsn.de [192.168.0.11])
	by mserver.eurodsn.de (Postfix) with ESMTP id 71ABE4F57D
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Mar 2004 13:12:50 +0100 (CET)
From: Juergen Beisert <jbeisert@eurodsn.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 23 Mar 2004 13:09:39 +0100
References: <200403231255.52627.jbeisert@eurodsn.de>
In-Reply-To: <200403231255.52627.jbeisert@eurodsn.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200403231309.39961.jbeisert@eurodsn.de>
Subject: Re: Problems using JFFS2 on my Samsung NAND chip
Reply-To: jbeisert@eurodsn.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Solved. My fault. After mtd cvs update I have still booted the old kernel...
I can mount and use my NAND flash now.

Regards
JB
