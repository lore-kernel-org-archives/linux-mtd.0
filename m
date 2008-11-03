Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kx189-0006ut-FT
	for linux-mtd@lists.infradead.org; Mon, 03 Nov 2008 15:14:13 +0000
Received: by ey-out-1920.google.com with SMTP id 4so896273eyg.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Nov 2008 07:14:12 -0800 (PST)
To: "Kay Sievers" <kay.sievers@vrfy.org>
Subject: Re: 2.6.28-rc2: (mtd)block/partitions BUG with kobject reference count
References: <87ej1z4ep8.fsf@macbook.be.48ers.dk>
	<200810300027.19116.rjw@sisk.pl> <87abcnj810.fsf@macbook.be.48ers.dk>
	<ac3eb2510810301451x7dbf18edgd03c1433099ce5e4@mail.gmail.com>
	<ac3eb2510810301647k5e3dfecdjfa79f7e916fcdd20@mail.gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 03 Nov 2008 16:14:00 +0100
In-Reply-To: <ac3eb2510810301647k5e3dfecdjfa79f7e916fcdd20@mail.gmail.com>
	(Kay Sievers's message of "Fri\, 31 Oct 2008 00\:47\:18 +0100")
Message-ID: <87d4hcc05j.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Kay" == Kay Sievers <kay.sievers@vrfy.org> writes:

Hi,

 Kay> Looks like a bdi issue:
 Kay>   http://lkml.org/lkml/2008/10/30/519

 Kay> Peter, if I do this (whitespace mangled, just pasted in here), the
 Kay> error goes away for me. Can you try this?

Sorry for the slow response - Your patch
(http://lkml.org/lkml/2008/10/30/558) fixes the issue for me - Thanks!

-- 
Bye, Peter Korsgaard
