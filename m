Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAlv5-0001JD-5Q
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 19:12:15 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so3168931pab.29
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 12:11:53 -0700 (PDT)
Date: Sat, 17 Aug 2013 12:11:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: fixup kerneldoc, rename parameter
Message-ID: <20130817191149.GB11210@norris.computersforpeace.net>
References: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
Cc: "Gupta, Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 08, 2013 at 05:22:22PM -0700, Brian Norris wrote:
> First, the function argument is 'offset' not 'column'.
> 
> Second, the 'data_buf' name is inconsistent with the rest of this file.
> Just use 'buf'.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Gupta, Pekon <pekon@ti.com>

Pushed to l2-mtd.git.
