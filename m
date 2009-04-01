Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lop5A-0002mk-1U
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 01:17:39 +0000
Received: by qyk28 with SMTP id 28so382470qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 18:17:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200903311418.53772.david-b@pacbell.net>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
Date: Tue, 31 Mar 2009 18:17:29 -0700
Message-ID: <a95a62fe0903311817i76f9f6d8qf7470fd14a62b912@mail.gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2009 at 2:18 PM, David Brownell <david-b@pacbell.net> wrote:
> Hmm, no comments?  I had understood there was interest over on
> the MTD side of things in exposing more information through
> sysfs, to help avoid the need to add Even More Ioctls as part
> of support for things like NAND chips with 4KB pages, or which
> handle more than 4GBytes ...

Based on this post:
http://lists.infradead.org/pipermail/linux-mtd/2009-March/025060.html

I am inferring that the following attributes are wanted in the MTD
sysfs interface:

1) mtd_info_user fields - type, flags, size, erasesize, writesize,
oobsize.  So far we have "type," but it should be easy to add the
rest.

2) region_info_user fields?  Not really sure how this would work.
Maybe a separate subdirectory for each region?
