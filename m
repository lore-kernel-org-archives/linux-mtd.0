Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Oct 2009 11:00:27 +0300
Message-Id: <1254384027.32310.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyungmin Park <kmpark@infradead.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2009-10-01 at 13:08 +0530, Amul Kumar Saha wrote:
> Note: Reposting with corrected Signed-Off
> 
> This patch resolves all the prints present in onenand_base.c
> Primarily, it replaces the hard-coded function names in the prints,
> and makes use of __func__.
> 
> Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>

Could you please first send the patch to yourself, then save it, and
try to apply. And when this works, send it to me.

This one does not apply either for the same reasons.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
