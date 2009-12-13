Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NJpYo-00070v-Sj
	for linux-mtd@lists.infradead.org; Sun, 13 Dec 2009 14:36:39 +0000
To: alfred steele <alfred.jaquez@gmail.com>
Subject: Re: [PATCH] mxc_nand: i.MX35 hardware ECC fixups
From: John Ogness <john.ogness@linutronix.de>
References: <804opb7d2y.fsf@merkur.tec.linutronix.de>
	<528f13590911071823sa26e1ane027d51d16357c79@mail.gmail.com>
	<80y6mg5e34.fsf@merkur.tec.linutronix.de>
	<528f13590912121558h26a95a1awcc2f8f384e8c3076@mail.gmail.com>
Date: Sun, 13 Dec 2009 15:36:26 +0100
In-Reply-To: <528f13590912121558h26a95a1awcc2f8f384e8c3076@mail.gmail.com>
	(alfred steele's message of "Sat\, 12 Dec 2009 17\:58\:34 -0600")
Message-ID: <807hsrvt3p.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alfred,

On 2009-12-13, alfred steele <alfred.jaquez@gmail.com> wrote:
> I am having a issue with using nandwrite mtd util and it so happens
> that the nandwrite gets stuck at a particular block and the sonsole
> hangs there forever.
>
> We are using the mx27(mxc) with a large size page NAND(4k). The annd
> write suceeds for the kernel MTD parition. I am suspecting my NAND
> driver is somehow obsolete. How do i find out as to what could be the
> root cause of the problem?
>
> What could be the pest debugging path?

You may want to consider setting the kernel option MTD_DEBUG and setting
MTD_DEBUG_VERBOSE to 3 (noisy). It will generate a _lot_ of output on
the console, but may help you to identify where it is hanging.

John Ogness
