Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtTyL-0002iZ-MJ
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 04:12:58 +0000
Received: by mail-pd0-f179.google.com with SMTP id w10so1955636pde.38
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 20:12:36 -0800 (PST)
Received: from ld-irv-0074 (5520-maca-inet1-outside.broadcom.com.
 [216.31.211.11])
 by mx.google.com with ESMTPSA id j10sm2825352pdr.92.2014.11.25.20.12.35
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Tue, 25 Nov 2014 20:12:35 -0800 (PST)
Date: Tue, 25 Nov 2014 20:12:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: add ATC manufacturer info
Message-ID: <20141126041233.GB21347@ld-irv-0074>
References: <1415129565-26791-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415129565-26791-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 04, 2014 at 11:32:45AM -0800, Brian Norris wrote:
> Tested with ATC AFND1G08U3, 128MiB NAND.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Wow, I got the name wrong. It's ATO, not ATC.

Fixed and pushed to l2-mtd.git.

Brian
