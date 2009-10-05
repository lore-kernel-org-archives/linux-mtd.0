Message-ID: <4AC9A093.7030901@gmail.com>
Date: Mon, 05 Oct 2009 10:30:27 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
	<1254726268.3359.3.camel@localhost>
	<1254726689.8859.5.camel@macbook.infradead.org>
	<4AC99C82.6070308@gmail.com>
	<alpine.LFD.2.00.0910050820560.12210@mercury.infradead.org>
In-Reply-To: <alpine.LFD.2.00.0910050820560.12210@mercury.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Amul Kumar Saha <amul.saha@samsung.com>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kmpark@infradead.org>, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/05/2009 10:22 AM, David Woodhouse wrote:
>
> TBH, if anyone is embarking on a campaign to clean up printks, I'd
> rather see all the DEBUG() crap removed entirely and replaced with
> dev_dbg() and friends.
>
> Everything should have a 'struct device' associated with it by now, right?

Right, the DEBUG() stuff should die.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
