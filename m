Received: from [61.78.64.122] (helo=tolkien.mizi.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178waV-0007Rn-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 06:17:03 +0100
To: Studying MTD <studying_mtd@yahoo.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash
References: <20020516144608.86328.qmail@web21509.mail.yahoo.com>
From: Yong-iL Joh <tolkien@mizi.com>
Date: 18 May 2002 14:16:58 +0900
In-Reply-To: <20020516144608.86328.qmail@web21509.mail.yahoo.com>
Message-ID: <hbvg9m9gs5.fsf@tolkien.mizi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Studying MTD <studying_mtd@yahoo.com> writes:

> If i want to use FAT with NAND then i have to use :-
> 
> A. FAT: filesystem driver 
> B. Translation: Translation layer
> C. MTD: Memory Technology Devices driver 
> D. NAND: generic NAND driver 
> E. Hardware specific driver 
> 
> So i have to add only Translation layer, rest layers
> will remain same.
> 
> Am i right ? If not, please correct me.
> 
> How can i write traslation layer , any reference.

IMHO, you're right.
we have implemented this way for SMC(SmartMedia Card). :)

but, we can't use current MTD's nand.c because of different usage of OOB.
we called SMCTL as "B. Translation".

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com
