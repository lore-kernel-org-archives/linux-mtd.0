Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgil6-0006wS-O0
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 00:27:05 +0000
Received: by pacfv12 with SMTP id fv12so192251169pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 17:26:44 -0700 (PDT)
Date: Mon, 28 Sep 2015 17:26:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Wolfram Sang <wsa@the-dreams.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/5] mtd: Fix module autoload for OF platform drivers
Message-ID: <20150929002641.GQ31505@google.com>
References: <20150917221102.GA9119@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150917221102.GA9119@goodgumbo.baconseed.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 12:11:02AM +0200, Luis de Bethencourt wrote:
> Hi,
> 
> These patches add the missing MODULE_DEVICE_TABLE() for OF to export
> the information so modules have the correct aliases built-in and
> autoloading works correctly.
> 
> A longer explanation by Javier Canillas can be found here:
> https://lkml.org/lkml/2015/7/30/519
> 
> Thanks,
> Luis

FYI, your threading (References and In-Reply-To headers) is wrong (or
rather, missing). Please consider testing locally and fixing this in the
future. git-send-email generally does a good job, if you are able to use
it.

Anyway, pushed all 5 to l2-mtd.git.

Brian
