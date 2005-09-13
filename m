Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF6QM-0002ot-GR
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 04:46:01 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 782BC8948BB
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 18:45:45 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 32A318948BB
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2005 18:45:44 +1000 (EST)
Message-ID: <432691B7.5040804@magellan-technology.com>
Date: Tue, 13 Sep 2005 18:45:43 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <43267172.20702@magellan-technology.com>
In-Reply-To: <43267172.20702@magellan-technology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2+NAND problem in 2.6.13-at91
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aras Vaichas wrote:
> Hi,
> 
> I was previously using 2.6.12-rc1, AT91 with JFFS2 on NAND and I had no
> problems whatsoever with using JFFS2 on NAND.
> 
> I recently upgraded to 2.6.13 and now JFFS2 on NAND seems a little broken ...

<SNIP>

> This sounds like some sort of timing issues to me if switching on debugging
> output causes the system to start working.

I did a quick experiment and I added a 1ms delay at the end of each command as
a test and it "fixes" the problem.

in at91_nand.c:at91_nand_command()

        /* wait until command is processed */
        while (!my_nand->dev_ready(mtd))
                ;

        msleep(1);
}

But of course scanning and mounting now takes a very long time and this
obviously isn't a permanent fix but it might help to locate where the problem
code is.

Does this prove that it's a timing problem? perhaps some race condition?

regards,

Aras Vaichas
