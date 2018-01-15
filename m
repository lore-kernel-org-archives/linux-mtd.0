Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb5rP-0006L4-14
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 14:35:40 +0000
Received: by mail-lf0-x243.google.com with SMTP id f3so13623380lfe.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jan 2018 06:35:28 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 0/2] mtd: simplify mtd_device_parse_register code
Date: Mon, 15 Jan 2018 15:35:17 +0100
Message-Id: <20180115143519.9845-1-zajec5@gmail.com>
In-Reply-To: <20180115132223.9974-1-zajec5@gmail.com>
References: <20180115132223.9974-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Even though I have some experience with MTD subsystem every time I was
starting working on it I had to do some quick research on the code flow.
I think there is some place for cleanup and optimization that would
simplify overall code and allow new developers to start working on it
more easily.

In these patches I meant to slightly simplify mtd_device_parse_register
function. I think we could reduce amount of add/register/del functions
and this is the first step for that.

Ideally I think mtdcore.c shouldn't handle parsing but just use a single
function from mtdpart.c.

Patch 1/2 modifies code to make sure parsing code is not mixed with MTD
master code. This should allow moving parsing parts to the mtdpart.c in
the future.

Patch 2/2 simplifies code and makes sure parsing is handled at 1 place
only.

Even though this cleanup isn't complete I think it already has some
value and could be accepted (if there won't be objections) on its own.
It's also quite small which should allow reviewing it easily.

Rafał Miłecki (2):
  mtd: move code adding master MTD out of mtd_add_device_partitions
  mtd: get rid of the mtd_add_device_partitions function

 drivers/mtd/mtdcore.c | 56 +++++++++++++++++----------------------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

-- 
2.11.0
