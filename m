Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BCdLB-0007bE-Qo
	for linux-mtd@lists.infradead.org; Sun, 11 Apr 2004 12:41:33 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i3BArJj9009206
	for <linux-mtd@lists.infradead.org>; Sun, 11 Apr 2004 12:53:19 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id NAA19731
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Apr 2004 13:41:11 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <40792ECB.4030309@imc-berlin.de>
Date: Sun, 11 Apr 2004 13:40:59 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <40742192.5030901@imc-berlin.de>
	<1081354787.4799.191.camel@tubarao> <407430AD.2020705@arcom.com>
In-Reply-To: <407430AD.2020705@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:
>> These error messages are from an ancient version of cfi_cmdset_0002.c.
>> They come from over-efficient software design that didn't consider the
>> quirks of how a flash chip works. Have you tried a recent version?
> 
> 
> Be aware that the more recent version from MTD CVS are broken for 
> interleaved chips.

What does "are broken" mean?
Just that autodetect of the flash type might not work? Or will read and 
write operations fail once the flash is detected correctly?

IOW: Could I use the MTD CVS with "interleaved chips" when I make sure my 
chips is correctly detected?

Thanks,

Steven
