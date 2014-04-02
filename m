Received: from smtp13.mail.ru ([94.100.176.90])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVCen-00089u-SL
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 04:20:11 +0000
Message-ID: <533B8FE1.7050408@list.ru>
Date: Wed, 02 Apr 2014 08:19:45 +0400
From: Stas Sergeev <stsp@list.ru>
MIME-Version: 1.0
To: Gerhard Sittig <gsi@denx.de>
Subject: Re: nandwrite and contiguous space
References: <533A8749.4050802@list.ru>
 <20140401182350.GS2775@book.gsilab.sittig.org>
In-Reply-To: <20140401182350.GS2775@book.gsilab.sittig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

01.04.2014 22:23, Gerhard Sittig пишет:
> If you want a sequence of good blocks, this very much sounds like
> the LEBs which UBI provides.  Aren't you asking for an UBI
> volume?  What am I missing?
Is is possible to configure ubi leb size to be multiple
physically contiguous eraseblocks? With some googling
it seems not, or what am I missing?
