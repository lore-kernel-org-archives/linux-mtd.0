Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp1.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dz8B-00022Q-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 21:16:07 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: Help with Dreamcast flash devices
Date: Sun, 11 Aug 2002 21:16:40 +0100
Cc: linux-mtd@lists.infradead.org
References: <200208111908.06874.mtd@mcmen.demon.co.uk> <20020811195238.GA1638@wohnheim.fh-wedel.de>
In-Reply-To: <20020811195238.GA1638@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208112116.40813.mtd@mcmen.demon.co.uk>
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

On Sunday 11 Aug 2002 8:52 pm, Jörn Engel wrote:

>
> Just out of curiosity: Is the flash really only 128kiB? If so, will
> there be anything much in it, except for the bootloader? And if even
> that is true, shouldn't a userspace flasher do the job just as well?
>
> Jrn

Well, you can get bigger lumps of flash, but they can only be addressed in 
128k lumps.

It won't even have a booloader - as there is no way to get the DC to boot from 
the flash. It's just a challenge, that's all :->
