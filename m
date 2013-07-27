Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3BZo-0004Ix-3K
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2013 20:58:56 +0000
Received: by mail-vb0-f47.google.com with SMTP id h10so1983341vbh.34
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 13:58:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE82MqJ0WRtLftbfp0D9d94yXsUH7-vF3M6fooDTFjFvsw@mail.gmail.com>
References: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
 <CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
 <20130724172804.373309617f46b6e66a1085c0@mail.ru>
 <CAN8TOE82MqJ0WRtLftbfp0D9d94yXsUH7-vF3M6fooDTFjFvsw@mail.gmail.com>
Date: Sat, 27 Jul 2013 13:58:34 -0700
Message-ID: <CAN8TOE9ZEJY5bXRhY+mEc2iFSY90zJFNUnjp50R+an_viQokMw@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: devicetree@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(snip conversation)

BTW Alexander, please be sure to CC the appropriate list
(devicetree@vger.kernel.org) for the resend of your DT-related patches
(I initially used the wrong list). They should have better input on
the process of adding/removing/deprecating device properties. And if
they don't have any opinion, then it's probably fine to do this
whatever way you/we see fit :)

Brian
