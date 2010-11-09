Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFnFU-0002dU-84
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 12:24:28 +0000
Received: by fxm11 with SMTP id 11so5031029fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 04:24:26 -0800 (PST)
Subject: Re: [PATCH 08/10] mtd-utils: nandwrite: prevent 32-bit overflow
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-8-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-8-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Nov 2010 14:20:56 +0200
Message-ID: <1289305256.2283.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-03 at 01:27 -0700, Brian Norris wrote:
> For large block- and page-sizes, the multiplication of ebsize_aligned
> and pagelen can overflow a 32-bit integer.  This overflow can be
> prevented by a simple change in order of operations (i.e., do division
> first).
> 
> Since ebsize_aligned is always a multiple of mtd.min_io_size, this
> produces no change in results.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Brian, increasingly have less and less time for mtd, but I remember
about your patches - I'll pick them as soon as I have some time. You can
meanwhile address Mikes comments.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
