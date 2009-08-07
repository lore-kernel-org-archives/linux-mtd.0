Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZFfT-00008J-Rc
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 02:59:00 +0000
Received: by gxk19 with SMTP id 19so1681164gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Aug 2009 19:58:50 -0700 (PDT)
Date: Thu, 6 Aug 2009 22:58:47 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: akpm@linux-foundation.org
Subject: Re: [patch 6/8] slram: fix read buffer overflow
Message-ID: <20090807025847.GM3095@hansolo.jdub.homelinux.org>
References: <200908062305.n76N5aeS004967@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200908062305.n76N5aeS004967@imap1.linux-foundation.org>
Cc: roel.kluin@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 06, 2009 at 04:05:36PM -0700, akpm@linux-foundation.org wrote:
>From: Roel Kluin <roel.kluin@gmail.com>
>
>map[count] is checked before count < SLRAM_MAX_DEVICES_PARAMS
>
>declared on drivers/mtd/devices/slram.c:66:

Didn't we obsolete this driver with phram?  I don't mean to derail the patch,
but I'm wondering why slram still exists at all.

josh
