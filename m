Received: from mail-vc0-f169.google.com ([209.85.220.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCa99-0006iJ-L1
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 18:30:00 +0000
Received: by mail-vc0-f169.google.com with SMTP id n10so3553631vcn.14
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 10:29:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-12-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-12-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 10:29:57 -0800
Message-ID: <CAN8TOE-0RmFhSAW7rj7mdNbk2zp3YaeUXA2BtYVDQwOZcro_jg@mail.gmail.com>
Subject: Re: [PATCH 11/12] mtd: nand: rename the id filed of 'struct
 nand_flash_dev'
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
> The 'id' is a bit confusing name because NAND IDs are multi-byte. Re-name
> it to 'dev_id' to make it clear that this is the "device ID" part (the second
> byte).
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

While we're going for typos (a la Jan's comment on another part of
this series) the subject of this patch/email says "filed" where it
should be "field".

Still reviewing the rest of this.

Brian
