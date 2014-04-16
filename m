Received: from mail-pa0-f53.google.com ([209.85.220.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaJIp-0000kc-EN
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 06:26:35 +0000
Received: by mail-pa0-f53.google.com with SMTP id ld10so10437701pab.26
 for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2014 23:26:11 -0700 (PDT)
Date: Tue, 15 Apr 2014 23:26:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ron <ron@debian.org>
Subject: Re: [PATCH 2/2] Use the nand_read_subpage index everywhere
Message-ID: <20140416062607.GN3131@norris-Latitude-E6410>
References: <1394904668-22978-1-git-send-email-ron@debian.org>
 <1394904668-22978-3-git-send-email-ron@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394904668-22978-3-git-send-email-ron@debian.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 16, 2014 at 04:01:08AM +1030, Ron wrote:
> Now that the index variable is correctly set earlier in this function
> we can use it in other places that compute the same thing too.
> 
> Signed-off-by: Ron <ron@debian.org>

Pushed to l2-mtd.git. Thanks!

Brian
