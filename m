Received: from rv-out-0708.google.com ([209.85.198.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKOmU-0003t9-2z
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 03:08:30 +0000
Received: by rv-out-0708.google.com with SMTP id b17so8192920rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Jan 2009 19:08:28 -0800 (PST)
Message-ID: <f17812d70901061908m5bb45de0qabb47ac580474f09@mail.gmail.com>
Date: Wed, 7 Jan 2009 11:08:28 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Subject: Re: [PATCH 1/3] Fix typo that prevented non DMA aka polling mode from
	working correctly.
In-Reply-To: <1231296053-2378-2-git-send-email-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-2-git-send-email-marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2009 at 10:40 AM, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> Due to __raw_{read,write}sl() being 'long' size based the shift operations need
> to divide the size in bytes by 4 which is achieved by ">> 2".
>
> Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>

Acked-by: Eric Miao <eric.miao@marvell.com>
