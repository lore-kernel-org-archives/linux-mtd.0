Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbad8-0008Uo-IS
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:22:28 +0000
Received: by mail-pg0-f66.google.com with SMTP id 194so15954554pgd.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:22:05 -0800 (PST)
Date: Wed, 8 Feb 2017 14:21:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/5] mtd: ubi: use 'max_bad_blocks' to compute
 bad_peb_limit if available
Message-ID: <20170208222103.GI94627@google.com>
References: <1484076621-7789-1-git-send-email-zach.brown@ni.com>
 <1484076621-7789-3-git-send-email-zach.brown@ni.com>
 <acc83b35-6dd6-9cd0-6f7c-e0aa3f866ed0@nod.at>
 <20170208220345.GG94627@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170208220345.GG94627@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 08, 2017 at 02:03:45PM -0800, Brian Norris wrote:
> I'm not sure what's happening with patches 3-5 yet either.

Never mind, those were reviewed and ready for me (not the NAND tree).
Applied 3 to 5 to l2-mtd.git.
