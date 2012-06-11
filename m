Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdxfH-0000Rc-95
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2012 05:59:47 +0000
Received: by ggcs5 with SMTP id s5so2494918ggc.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 22:59:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120610135812.01dce4e7@pixies.home.jungo.com>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
Date: Sun, 10 Jun 2012 22:59:44 -0700
Message-ID: <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading its
 version
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, Jun 10, 2012 at 3:58 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> - Not runtime tested.

Patch looks fine, but this makes me curious: does anyone use
NAND_BBT_ABSPAGE? It looked broken to me when I tried it not tool long
ago, but I didn't look too deeply. (I doubt that this typo was its
only problem, but I may try again...)

Brian
