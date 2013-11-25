Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkxvK-0001yw-5q
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 15:18:06 +0000
Received: by mail-vc0-f175.google.com with SMTP id ld13so2780064vcb.20
 for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2013 07:17:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131122014450.GA3509@localhost>
References: <CAGZNvdpag-DDUwYKGYaLs17St6P_LRk7EKDtPzuLcsGT324YTw@mail.gmail.com>
 <20131122014450.GA3509@localhost>
From: Fernando Silveira <fsilveira@gmail.com>
Date: Mon, 25 Nov 2013 13:17:04 -0200
Message-ID: <CAGZNvdqOcidWKokafmsR1V9-F39mqTvrRk6Ufw6nH3+f=aTSgw@mail.gmail.com>
Subject: Re: UBI attach, UBIFS mount and blocks writing
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel,

On Thu, Nov 21, 2013 at 11:44 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Which kind of flash is this?

A 2GB NAND flash with < 10k erase count limit. I asked because my
system should be able to reboot hundreds of times (even thousands
sometimes) and avoid rewriting blocks.

-- 
Fernando Silveira
