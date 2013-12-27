Received: from mail-qa0-f51.google.com ([209.85.216.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwQD2-0003L5-4F
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 05:43:44 +0000
Received: by mail-qa0-f51.google.com with SMTP id o15so8298047qap.10
 for <linux-mtd@lists.infradead.org>; Thu, 26 Dec 2013 21:43:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <008f01cf01e8$21a7a8b0$64f6fa10$%han@samsung.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
 <008f01cf01e8$21a7a8b0$64f6fa10$%han@samsung.com>
Date: Thu, 26 Dec 2013 21:43:21 -0800
Message-ID: <CAOesGMhV5QFfJ4OY3TGfLJ0AwOyqRid2iW9Gh6EhYQ3KL-0mkQ@mail.gmail.com>
Subject: Re: [PATCH 13/23] mtd: pasemi_nand: Remove unnecessary OOM messages
From: Olof Johansson <olof@lixom.net>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 25, 2013 at 7:11 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> The site-specific OOM messages are unnecessary, because they
> duplicate the MM subsystem generic OOM message.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Actually -- the pasemi platform is barely used these days, and the
users I am aware of do not use the nand driver. I think we'd just fine
with removing it. I'll submit a patch to do so instead.



-Olof
