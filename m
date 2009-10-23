Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1DDL-0000Vo-3o
	for linux-mtd@lists.infradead.org; Fri, 23 Oct 2009 06:01:31 +0000
Subject: Re: [PATCH v5 2/3] MTD: OneNAND: multiblock erase support
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
In-Reply-To: <CCC9B5EE92E54F5F90437EBBE209AACE@sisodomain.com>
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4ADDB69F.7060606@nokia.com> <1256272454.29885.198.camel@localhost>
	<CCC9B5EE92E54F5F90437EBBE209AACE@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 09:00:34 +0300
Message-Id: <1256277634.29885.218.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"Korhonen Mika.2 \(EXT-Ardites/Oulu\)" <ext-mika.2.korhonen@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-23 at 07:41 +0200, ext Amit Kumar Sharma wrote:
> Hi Mika,
> 
> Do you have any use case for using multiblock erase.

One use case I see is flashing UBI images faster. With some tweaks, the
ubiformat utility could exploit the mutiblock-erase feature (it needs to
erase the mtd partition before flashing).

Well, to be generic, it would be also nice to have a sysfs file telling
the maximum multi-block erase size. However, it is not strictly
necessary.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
