Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtjU-0004DB-8A
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:02:51 +0000
Received: by laah2 with SMTP id h2so507677laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 04:02:46 -0800 (PST)
Subject: Re: [PATCH 0/7] MTD: MAPS: remove bcm963xx-flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 06 Dec 2011 14:02:44 +0200
In-Reply-To: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323172965.2163.5.camel@koala>
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-05 at 16:08 +0100, Jonas Gorski wrote:
> While trying to improve the bcm963xx CFE partition parsing, I noticed
> that it could be completely replaced by the generic physmap flash
> driver using a custom parser.

Hi,

would you please send a version which applies cleanly to my
l2-mtd-2.6.git tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Artem.
