Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5s6Q-0000Qs-O1
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 07:52:15 +0000
Received: by mail-pd0-f180.google.com with SMTP id y13so333527pdi.39
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jul 2014 00:51:52 -0700 (PDT)
Date: Sat, 12 Jul 2014 00:51:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Brian <tsungenlu@gmail.com>
Subject: Re: MTD/JFFS2 OOB can't support no subpage
Message-ID: <20140712075149.GG23883@brian-ubuntu>
References: <DF8F24C9-F22D-452A-8A1B-D9EF14BFF8D0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF8F24C9-F22D-452A-8A1B-D9EF14BFF8D0@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

And old email, but an easy answer...

On Sun, Mar 09, 2014 at 10:51:48AM +0800, Brian wrote:
> We're using the new Samsung SLC NAND flash, it's only support one NOP,
> when I disabled the OOB cleanmarker, the mtd_write should go to
> unknown marker node with write aligned error.
> 
> So, it look likes the JFFS2 can't support no subpage, right?

I believe that is true.

(Other) Brian
