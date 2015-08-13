Date: Thu, 13 Aug 2015 15:13:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5] mtd: spi-nor: add driver for NXP SPI Flash Interface
 (SPIFI)
Message-ID: <20150813221316.GI60523@google.com>
References: <1439486380-17720-1-git-send-email-manabian@gmail.com>
 <20150813214739.GH60523@google.com>
 <CAGhQ9Vzs2h3mw2qnYvy83RAvrX8uPZGGzNASr1csk_LhLnHB8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGhQ9Vzs2h3mw2qnYvy83RAvrX8uPZGGzNASr1csk_LhLnHB8g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 12:10:59AM +0200, Joachim Eastwood wrote:
> On 13 August 2015 at 23:47, Brian Norris <computersforpeace@gmail.com> wrote:
> > BTW, is this driver worth a MAINTAINERS entry? It's nice to always have
> > someone on CC that has the hardware. The git history should probably
> > pick you up anyway when running get_maintainers.pl, so it may not be
> > absolutely necessary.
> 
> Sure. I can add it under the main lpc18xx platform entry in
> MAINTAINERS. I'll queue up a patch for arm-soc.

Sounds good.
