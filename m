Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FISLR-0001Oe-OJ
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 10:19:05 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <43EB81CF.1000400@intel.com>
References: <43EA5056.2070300@ru.mvista.com>  <43EB81CF.1000400@intel.com>
Content-Type: text/plain
Date: Sun, 12 Mar 2006 16:18:57 +0100
Message-Id: <1142176737.19916.463.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com,
	Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of misspring
	.(nand_base.c)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-02-09 at 20:54 +0300, Alexey, Korolev wrote:
> Hi Vitaly,
> 
> Thanks a lot for feedback.
> I agree for most of your comments. I missed some lines when I was 
> merging the patch to the latest snapshot. I corrected it. Here is the 
> second version at the end of the letter. Your comments are welcome.

I still do not understand what this whole crap is for. This patch will
not make it anywhere.

As I said before, this problem can simply be solved by a check for the
manufacturer ID in nand_scan() and a small tweak of nand_default_bbt().

Your solution requires board driver support, but this is a chip level
not a board level problem.

	tglx
