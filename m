Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9gPB-0008Oe-3m
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 15:20:58 +0000
Received: by yxe40 with SMTP id 40so1904713yxe.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 May 2010 08:20:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BE11FA0.20703@parrot.com>
References: <17c88de31cd52bb3794569c28cd2ae51996e6260@localhost.localdomain>
	<10137ab89de6e6d229798d6f397688b0807024da@localhost.localdomain>
	<4BE11FA0.20703@parrot.com>
Date: Wed, 5 May 2010 08:20:53 -0700
Message-ID: <w2y347733d51005050820obdcea4e7k7564550723ef7c24@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] mtd: nand: Extend NAND flash detection to new MLC
	chips
From: Kevin Cernekee <cernekee@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Reuben.Dowle@navico.com" <Reuben.Dowle@navico.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 5, 2010 at 12:34 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Doesn't these nand support ONFI "Read Parameter Page" (cmd 0xec) ?
> If yes it will be a more generic way to detect new nand features.

Unfortunately, Samsung and Toshiba do not support ONFI:

http://onfi.org/membership/

http://www.hantat.com/News-Read-281-1.html
