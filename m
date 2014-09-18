Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVFD-0000LS-Qj
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:31:08 +0000
Received: by mail-pd0-f181.google.com with SMTP id w10so749190pde.12
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:30:47 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:30:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: nand: don't break long print messages
Message-ID: <20140918063043.GK7362@norris-Latitude-E6410>
References: <1408449334-6440-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408449334-6440-1-git-send-email-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 19, 2014 at 01:55:34PM +0200, Rafał Miłecki wrote:
> This follows Chapter 2 of Linux's CodingStyle:
> > However, never break user-visible strings such as printk messages,
> > because that breaks the ability to grep for them.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
