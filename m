Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvVZ4-0000It-1K
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 14:33:22 +0000
Received: by gwb1 with SMTP id 1so3834197gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 07:33:19 -0700 (PDT)
Subject: RE: ubi volume unmountable after power cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>
Date: Mon, 22 Aug 2011 17:35:07 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A723D86EB@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
	<1313755918.6607.56.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A723D86E7@dekaexchange07.deka.local>
	<1313766997.6607.66.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A723D86E9@dekaexchange07.deka.local>
	<1314020635.2644.121.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A723D86EB@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314023711.2644.124.camel@sauron>
Mime-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-08-22 at 10:28 -0400, Eric Millbrandt wrote:
> > -----Original Message-----
> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> > Sent: Monday, August 22, 2011 09:44
> > To: Eric Millbrandt
> > Cc: 'linux-mtd@lists.infradead.org'
> > Subject: RE: ubi volume unmountable after power cut
> >
> 
> > Yeah, sorry, no idea. Is this reproducible on other devices?
> >
> We have only seen this one occurrence, hopefully this will be a rare error.

Although you said that pulling the backport tree did not help, I think
it still should be done because it may help to _prevent_ this happening,
even though it did not help _recovering_ from that corruption. The
reason why I emphasize this is because there were a lot of power-cut
tolerance fixes there.

But of course, there is a risk to get new bug with the updates, as
always.

-- 
Best Regards,
Artem Bityutskiy
