Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSWa-0003Xn-GO
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:06:29 +0000
Received: by iyf13 with SMTP id 13so5998231iyf.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:06:24 -0700 (PDT)
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 19 Aug 2011 20:08:11 +0300
In-Reply-To: <CAMjpGUc4SMSvU3mHjeZ6oq=2K8tvuYVcEOjpE9vPfYnL7DZByA@mail.gmail.com>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
	<CAMjpGUc4SMSvU3mHjeZ6oq=2K8tvuYVcEOjpE9vPfYnL7DZByA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313773695.6607.84.camel@sauron>
Mime-Version: 1.0
Cc: "Fryar, Jeff" <jeff.fryar@hp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-11 at 11:39 -0400, Mike Frysinger wrote:
> On Thu, Aug 11, 2011 at 11:30, Fryar, Jeff wrote:
> > +                               if (mtd_erase(mtd_desc, &mtd, fd, (i/mtd.eb_size))) {
> 
> we dont need to conserve whitespace.  please use spaces around "/" operators.

Yeah, I added white-spaces and removed unneeded brackets.

-- 
Best Regards,
Artem Bityutskiy
