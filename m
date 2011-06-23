Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZg33-0003FM-F7
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 09:18:06 +0000
Received: by pzk28 with SMTP id 28so1148776pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 02:18:01 -0700 (PDT)
Subject: Re: Claiming back space from NAND?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Thu, 23 Jun 2011 12:18:47 +0300
In-Reply-To: <lv5sv610ivu2a8de8nmdl652jsvv5p1s0r@4ax.com>
References: <lv5sv610ivu2a8de8nmdl652jsvv5p1s0r@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308820731.19443.3.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-06-19 at 17:39 +0200, Gilles wrote:
> Hello,
> 
> 	After booting up a new kernel with the root filesystem on the second
> partition in the NAND, I notice that the 248MiB partition is down to
> only 225MiB.
> 
> I understand that Ubifs uses some space for journaling, but does it
> really need that much space? Is it possible to reclaim some space?

First of all, start with this:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report

Also, yes, there is room for optimization but it requires some work.

-- 
Best Regards,
Artem Bityutskiy
