Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCbxT-0007kk-Jj
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 20:26:04 +0000
Received: by mail-ve0-f172.google.com with SMTP id cz11so5212619veb.3
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 12:26:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
Date: Mon, 4 Mar 2013 12:26:02 -0800
Message-ID: <CAN8TOE9Q6udV2JTUDZbH7mMnz8c1HiYA--xBhQ79h4b2fhbtAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand_base: Removed unnecessary command masking
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 28, 2013 at 12:02 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> NAND command, passed to cmd_ctrl(), is masked with 0xff. This patch
> removes this since masking is not necessary and masking is not performed
> in other places for same call.

As I commented on the other thread, this is not a sufficient
explanation. AG-AND (soon to be removed) may use a fake 9-bit command
which could expect this masking, even though masking is not done
everywhere. Please document why the command does not need to be
masked.

Thanks,
Brian
