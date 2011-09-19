Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5VCW-000632-Rb
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 04:11:25 +0000
Received: by fxg7 with SMTP id 7so4337019fxg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Sep 2011 21:11:23 -0700 (PDT)
Subject: Re: [PATCH 03/14] mtd: define `is_ecc_error()' macros
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 19 Sep 2011 07:14:01 +0300
In-Reply-To: <1315749440.18731.65.camel@sauron>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
	<1315749440.18731.65.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316405649.24366.17.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-09-11 at 16:57 +0300, Artem Bityutskiy wrote:
> > +#define is_corrected_ecc_error(error) (error == -EUCLEAN)
> 
> This is not really an error...
> 
> > +#define is_uncorrected_ecc_error(error) (error == -EBADMSG)
> > +#define is_ecc_error(error) ((is_corrected_ecc_error(error) || \
> > +			      is_uncorrected_ecc_error(error)))
> 
> Could we please have static inline functions instead of macros?
> 
> I think it is nicer to have mtd_ prefixes, how about these names
> instead:
> 
> mtd_is_bitflip()
> mtd_is_eccerr()
> mtd_is_bitflip_or_eccerr()

Brian, I was actually waiting for v2 of the patches: 3/14, and
9/14-14/14.

-- 
Best Regards,
Artem Bityutskiy
