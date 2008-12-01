Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L78O5-00008u-Al
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 13:00:29 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2598135rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Dec 2008 05:00:28 -0800 (PST)
Message-ID: <f17812d70812010500n8d07361o288faac1cdc64886@mail.gmail.com>
Date: Mon, 1 Dec 2008 21:00:28 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "Daniel Mack" <daniel@caiaq.de>
Subject: Re: [PATCH] add missing cmdset field in PXA3xx NAND code
In-Reply-To: <20081201115757.GA14755@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081201115757.GA14755@buzzloop.caiaq.de>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 1, 2008 at 7:57 PM, Daniel Mack <daniel@caiaq.de> wrote:
> This adds a missing .cmdset parameter for STM 2G NAND chip
> definition. Even though support for built-in NAND chips is
> marked deprecated, the driver crashes in __readid() due to a NULL
> pointer dereference if it's not there.
>
> Signed-off-by: Daniel Mack <daniel@caiaq.de>

Thanks, however this is a bit later, some one spotted this earlier:

http://lists.infradead.org/pipermail/linux-mtd/2008-November/023643.html
