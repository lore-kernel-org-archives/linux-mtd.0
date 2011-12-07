Received: from mail-ww0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYAJi-00088y-Od
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 05:45:19 +0000
Received: by wgbdt12 with SMTP id dt12so1085945wgb.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 21:45:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Date: Tue, 6 Dec 2011 21:45:16 -0800
Message-ID: <CAN8TOE9kPGr5pvLKEuNykYO_ydp7ZRQvCJuu8BFyHM0-_AvoRw@mail.gmail.com>
Subject: Re: [PATCH 0/7] MTD: MAPS: remove bcm963xx-flash
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 5, 2011 at 7:08 AM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> P.S: This patchset is based on l2-mtd-2.6.git, which seems to be the
> "correct" tree now (the website says mtd-2.6.git, but it doesn't look
> like the correct one, having no commits).

Hi Jonas,

I see that you are nowhere near the first one to have at least a
little bit of trouble with the mtd-2.6.git vs. l2-mtd-2.6.git
question.

Artem or David,

Is it sensible to change the website documentation to reflect the fact
that most MTD development is tracked in Artem's l2 repository
primarily? I can send a patch against mtd-www.git sometime to update
this.

Brian
