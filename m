Received: from mail-ve0-f170.google.com ([209.85.128.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCaGr-0008Kn-W6
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 18:37:58 +0000
Received: by mail-ve0-f170.google.com with SMTP id 14so5026099vea.15
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 10:37:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-3-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-3-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 10:37:56 -0800
Message-ID: <CAN8TOE8rhkxuSjunoEZ07u6VgC5SOyC5-+Hjd7y52rpqViNYxg@mail.gmail.com>
Subject: Re: [PATCH 02/12] mtd: remove museum NAND ID's support
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> It is probably OK to remove support for really old NAND chips of 8MiB or
> smaller size. We had a separate configuration option for them:
> CONFIG_MTD_NAND_MUSEUM_IDS, which we remove along with this patch.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

I have never seen any of these NAND. So FWIW:

Acked-by: Brian Norris <computersforpeace@gmail.com>
