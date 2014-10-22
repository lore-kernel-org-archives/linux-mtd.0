Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrSW-0003Ol-1w
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:39:56 +0000
Received: by mail-pa0-f43.google.com with SMTP id lf10so3267499pab.30
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:39:34 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:39:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH] mtd: bfin-async-flash: Remove unused variable
Message-ID: <20141022083931.GH16128@brian-ubuntu>
References: <1106241329.302591.1411499010840.JavaMail.zimbra@xes-inc.com>
 <1931039891.303225.1411499244022.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1931039891.303225.1411499244022.JavaMail.zimbra@xes-inc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 adi-buildroot-devel@lists.sourceforge.net, Steven Miao <realmz6@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 23, 2014 at 02:07:24PM -0500, Aaron Sierra wrote:
> Avoid the following compile warning:
> 
> drivers/mtd/maps/bfin-async-flash.c: In function 'bfin_flash_probe':
> drivers/mtd/maps/bfin-async-flash.c:129: warning: unused variable 'ret'
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Pushed to l2-mtd.git.

Brian
