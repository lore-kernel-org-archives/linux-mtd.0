Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6i1p-00081X-Pj
	for <linux-mtd@lists.infradead.org>; Tue, 07 Oct 2003 03:56:50 +0100
Message-ID: <3F822B25.2020600@hectrix.com>
Date: Tue, 07 Oct 2003 10:55:33 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
In-Reply-To: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/07/2003 05:34 AM, Slim wrote:
> the above, but the doc-grub always loads despite changing the boot
> device in the bios setup.  Now I can't boot from the hard drive unless I
> disable all access to the doc.  Any workaround?

I think you have built a GRUB firmware and written it on the DOC. But
there is a catch that the firmware will register as a BIOS extension
that will take over the boot sequence from the BIOS. You should patch
GRUB with the ctrlbypass functionality. It allows you to bypass the GRUB
on DOC and boot according to your BIOS by holding CTRL while booting. I
used grub-2003-01-08.doc.patch here. Refer to p.262-266 of Karim's book.

Now, to get back to boot from your harddisk and have a chance to rewrite
the correct firmware, you may try hotplugging your DOC after the system
is booted. Although it is a bit undesirable and dangerous, I tried once
and it seemed alright. Once, I even accidentally pulled out a DOC with a
screwdriver while the system was still running, and the DOC was not
damaged at all.

Selwyn
