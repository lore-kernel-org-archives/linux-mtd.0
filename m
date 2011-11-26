Received: from out2.smtp.messagingengine.com ([66.111.4.26])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RUao1-0004cN-S4
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2011 09:13:50 +0000
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
 by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 3110021622
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2011 04:13:48 -0500 (EST)
Date: Sat, 26 Nov 2011 15:57:27 -0800
From: Greg KH <greg@kroah.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 16/16] mtd/docg3: add protection areas sysfs access
Message-ID: <20111126235727.GA12856@kroah.com>
References: <1321714978-24543-1-git-send-email-robert.jarzmik@free.fr>
 <1321714978-24543-17-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321714978-24543-17-git-send-email-robert.jarzmik@free.fr>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 19, 2011 at 04:02:58PM +0100, Robert Jarzmik wrote:
> As each docg3 chip has 2 protection areas (DPS0 and DPS1),
> and because theses areas can prevent user access to the chip
> data, add for each floor the sysfs entries which insert the
> protection key into the right DPS.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

As you are adding new sysfs files, you also must add Documentation/ABI
entries for them.  Please do so.

thanks,

greg k-h
