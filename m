Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A49q6-0005K3-UH
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 03:02:11 +0100
Message-ID: <3F78E3DB.10508@hectrix.com>
Date: Tue, 30 Sep 2003 10:00:59 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: "Chiasson, John" <jchiasson@namrl.navy.mil>
References: <D495FC2E1E65A44EAA961BC66B9395312A9C82@namrl.navy.mil>
In-Reply-To: <D495FC2E1E65A44EAA961BC66B9395312A9C82@namrl.navy.mil>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On 09/29/2003 10:05 PM, Chiasson, John wrote:
> me to an example for booting the redhat 9 kernel from the doc?  I tried
> copying the /boot tree over, but no joy.

Did you copy the kernel image (like bzImage) to your doc and configure
the grub settings on your doc correctly?

I put my bzImage in /boot and in grub/menu.lst I have the following:

title DiskOnChip 2000
	root (dc0,0)
	kernel /boot/bzImage ro root=/dev/nftla1

When you can boot from doc using grub, that's a good start. You may
actually edit the boot command line when grub is booted. It supports
auto-completion for you to easily locate your kernel image.

Hope this helps!

Selwyn
