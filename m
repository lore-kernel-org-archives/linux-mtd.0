Message-ID: <1391035079.14902.3.camel@localhost>
Subject: Re: [linux-sunxi] Re: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC
 dt bindings doc
From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik@henriknordstrom.net>
To: linux-sunxi@googlegroups.com
Date: Wed, 29 Jan 2014 23:37:59 +0100
In-Reply-To: <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com>
 <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, dev@linux-sunxi.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
 Grant Likely <grant.likely@linaro.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ons 2014-01-29 klockan 11:11 -0600 skrev Rob Herring:

> Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
> pin is an option? If so, don't you need some fixed time delay
> properties like max erase time?
> 
> rb-gpios could be added to the generic nand binding as well.

The Allwinner NAND controller have dedicated RB pins when NAND is
enabled, only MUXed with other functions when NAND is not enabled.

Leaving RB unconnected is not a valid hardware configuration. The
controller internal timing engine depends on being able to sense RB to
sequence NAND commands properly.

Regards
Henrik
