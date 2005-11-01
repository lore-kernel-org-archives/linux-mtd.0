Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWs0O-0007aR-HP
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 04:00:39 -0500
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id jA198FOu023227
	for <linux-mtd@lists.infradead.org>;
	Tue, 1 Nov 2005 11:08:15 +0200 (EET)
Message-ID: <43672CFA.1060907@intracom.gr>
Date: Tue, 01 Nov 2005 10:53:14 +0200
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>
References: <4363DF17.6080906@ru.mvista.com>
In-Reply-To: <4363DF17.6080906@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Pete Popov <ppopov@embeddedalley.com>
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Shtylylov wrote:

[snip]

I have the exact same problem on a different board, which I
fix by disabling interrupts (and hacking out the yield() call
in nand_base.c).

I'd very much like to see it addressed properly.

Regards

Pantelis
