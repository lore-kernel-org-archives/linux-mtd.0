Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <F890C3D467A3465090BA4473AF6EC789@sisodomain.com>
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
	<1254384027.32310.18.camel@localhost>
	<F890C3D467A3465090BA4473AF6EC789@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Oct 2009 15:32:37 +0300
Message-Id: <1254400357.3359.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
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

On Thu, 2009-10-01 at 16:38 +0530, Amul Kumar Saha wrote:
> Hi Artem,
> 
> >
> > Could you please first send the patch to yourself, then save it, and
> > try to apply. And when this works, send it to me.
> >
> > This one does not apply either for the same reasons.
> >
> 
> I have taken care of all the prints but one.
> onenand_base.c: 2160
> DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) 
> instr->len);
> 
> Reason: This one is 149 characters long and the patch couldn't be sent, through the mailer.
> I am avoiding this one. I hope it's OK.

Ok, just attach the patch then.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
