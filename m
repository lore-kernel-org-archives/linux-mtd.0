Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <1254726268.3359.3.camel@localhost>
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
	<1254726268.3359.3.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Oct 2009 10:11:50 +0300
Message-Id: <1254726710.3359.6.camel@localhost>
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

On Mon, 2009-10-05 at 10:04 +0300, Artem Bityutskiy wrote:
> On Thu, 2009-10-01 at 13:08 +0530, Amul Kumar Saha wrote:
> > Note: Reposting with corrected Signed-Off
> > 
> > This patch resolves all the prints present in onenand_base.c
> > Primarily, it replaces the hard-coded function names in the prints,
> > and makes use of __func__.
> > 
> > Signed-off-by: Amul Kumar Saha <amul.saha@samsung.com>
> > ---
> >  onenand_base.c |  172 +++++++++++++++++++++++++++++++++++----------------------
> >  1 file changed, 106 insertions(+), 66 deletions(-)
> 
> David decided to ignore the discussion and pushed your first patch
> instead of this one already.

Oh, David actually took the right patch, sorry. You decided to re-send
the old patch and did not address the nitpicks I pointed, e.g., there is
still:

DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu
\n", (unsigned long long) instr->addr, (unsigned long long) instr->len);

Well, not big deal, but would be nice to have a follow up patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
