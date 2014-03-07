Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpFo-0002e1-8e
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:31:36 +0000
Received: by mail-pd0-f171.google.com with SMTP id r10so3679753pdi.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:31:14 -0800 (PST)
Date: Thu, 6 Mar 2014 23:31:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: avoid overflowing when registering trx
Message-ID: <20140307073109.GA31517@norris-Latitude-E6410>
References: <1393421434-23561-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393421434-23561-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 26, 2014 at 02:30:34PM +0100, Rafał Miłecki wrote:
> Our code parsing "trx" header registers few partitions at once (in one
> loop iteration). Add extra check in that place.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
