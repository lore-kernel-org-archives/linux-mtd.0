Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UOmT-0004CG-00
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2002 09:05:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020126062925.22509.qmail@web8101.in.yahoo.com> 
References: <20020126062925.22509.qmail@web8101.in.yahoo.com> 
To: Ramya Ravichandran <rrhsin@yahoo.co.in>
Cc: Russ Dill <Russ.Dill@asu.edu>, linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 26 Jan 2002 09:16:50 +0000
Message-ID: <21767.1012036610@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

rrhsin@yahoo.co.in said:
>    If the price of DOC  is less than the CF+IDE adapter or CF +
> PCMCIA-CF adapter then I guess we will settle for DOC.

OOI, why is it not an option to just use flash chips?

>    Also I dont know which adapter to go for PCMCIA or IDE for CF as I
> am not a h/w person. 

PCMCIA mode is likely to be cheaper - CF cards contain an IDE controller, 
which you can use in PCMCIA mode. No need to have another one one your 
board.

--
dwmw2
