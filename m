Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkjxD-0001jV-K5
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 22:14:04 +0000
Received: by eekc4 with SMTP id c4so30631eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 14:14:01 -0800 (PST)
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Ira W. Snyder" <iws@ovro.caltech.edu>
Date: Wed, 11 Jan 2012 00:13:51 +0200
In-Reply-To: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326233641.2335.16.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-01-06 at 11:29 -0800, Ira W. Snyder wrote:
> This allows the mtdoops driver to work on flash chips using the
> AMD/Fujitsu compatible command set.
> 
> As the code comments note, the locks used throughout the normal code
> paths in the driver are ignored, so that the chance of writing out the
> kernel's last messages are maximized.
> 
> Signed-off-by: Ira W. Snyder <iws@ovro.caltech.edu>

Pushed to l2-mtd-2.6.git, thanks!
