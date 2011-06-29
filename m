Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QboCp-0004cK-Oy
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:25:01 +0000
Received: by pzk28 with SMTP id 28so711132pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:24:56 -0700 (PDT)
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Wed, 29 Jun 2011 09:25:47 +0300
In-Reply-To: <4E09F3F1.7080109@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
	<1309202771.24805.11.camel@koala> <4E09EA52.8090006@parrot.com>
	<4E09F3F1.7080109@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309328751.23597.109.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 17:32 +0200, David Wagner wrote:
> On 06/28/2011 04:50 PM, Matthieu CASTET wrote:
> > Hi,
> >
> [...]
> > Also what are the advantage against gluebi + mtdblock_ro ?
> 
> The main advantage is a reduced number of layers ; I must say I cannot
> see much more for now.  I could add that the Kconfig help of gluebi
> advises not to use it except when needed by legacy software.

Well, I think Matthieu has a valid poit, you should try to come up with
a set of advantages, otherwise why would this drivers be needed? Why
would people spend time reviewing it? May be less memcpy's? Do we do an
extra memcpy in gluebi? If yes, can we avoid doing this. Anyway, please,
try to sell this driver a bit better.

-- 
Best Regards,
Artem Bityutskiy
