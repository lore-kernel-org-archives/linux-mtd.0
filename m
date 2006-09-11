Subject: Re: State of UBI
From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<4503D10E.000001.07116@webmail12.yandex.ru>
	<625fc13d0609100532n58933486l3f66715c38172cd5@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 11 Sep 2006 09:11:38 +0100
Message-Id: <1157962298.2977.193.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-09-10 at 07:32 -0500, Josh Boyer wrote:
> I'll politely disagree here.  UBI _does_ need this on NAND to be
> really usable.  Otherwise you eat 2 pages per block for UBI metadata,
> and that is quite a bit of overhead for a handful of bytes in the
> structures.

"A handful of bytes" ought to fit into the spare area, and not take real
data pages at all.

-- 
dwmw2
