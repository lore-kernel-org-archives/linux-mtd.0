Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvPzt-0001QE-6X
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:36:41 +0000
Received: by gxk2 with SMTP id 2so4198219gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:36:39 -0700 (PDT)
Subject: Re: [RFC 2/5] mtd: support MTD_MODE_RAW for reading OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 11:38:25 +0300
In-Reply-To: <1313625029-19546-3-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314002311.2644.70.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> mtd_do_read_oob does not pass information about whether to read in RAW
> mode to the lower layers (e.g., NAND). We should pass MTD_OOB_RAW or
> MTD_OOB_PLACE based on the MTD file mode.
> 
> This fixes issues with `nanddump -n' and the MEMREADOOB[64] ioctls.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I guess similar question applies to this patch - why is this RFC while
it looks like a candidate for 'stable@kernel.org'?

-- 
Best Regards,
Artem Bityutskiy
