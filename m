Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <F1A2DF54F9F549B29F1A72240FB6CED8@sisodomain.com>
References: <7C266C6722224724BF9456BA7986FC05@sisodomain.com>
	<1256028984.29856.144.camel@localhost> <4ADDC5A3.50607@nokia.com>
	<F1A2DF54F9F549B29F1A72240FB6CED8@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 09:11:04 +0300
Message-Id: <1256278264.29885.226.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-21 at 16:50 +0530, Amul Kumar Saha wrote:
> Hi Adrian,
> 
> 
> > Artem Bityutskiy wrote:
> >> I'm still waiting for Adrian to review this. Yesterday he said he will
> >> do this soon. In any case, I remember about this patch, just FYI.
> >
> > Seems fine except why aren't
> > onenand_otp_command()
> > onenand_otp_write_oob_nolock()
> > inside an
> > #ifdef CONFIG_MTD_ONENAND_OTP
> > ...
> > #endif
> 
> Accepted and Corrected.

It is in my l2 tree now, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
