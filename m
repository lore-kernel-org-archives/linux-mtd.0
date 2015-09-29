Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgjHq-0001Cw-RR
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:00:55 +0000
Received: by pacex6 with SMTP id ex6so188994690pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:00:34 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:00:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RESEND] mtd: spi-nor: s25fl008k and s25fl016k supports
 dual/quad mode
Message-ID: <20150929010031.GU31505@google.com>
References: <1436473857-31179-1-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436473857-31179-1-git-send-email-manabian@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 09, 2015 at 10:30:57PM +0200, Joachim Eastwood wrote:
> s25fl016k can be found on Embedded Artists' LPC4357 Developer's Kit
> where is used in quad mode by the LPC4357 SPIFI controller.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
> 
> Hi,
> 
> Could this go in for 4.3?
> 
> Resend of http://permalink.gmane.org/gmane.linux.drivers.mtd/59189
> back in May 29.

Pushed to l2-mtd.git
