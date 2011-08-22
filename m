Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvUlR-0007G6-4E
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 13:42:06 +0000
Received: by ywp17 with SMTP id 17so4328727ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 06:42:03 -0700 (PDT)
Subject: RE: ubi volume unmountable after power cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>
Date: Mon, 22 Aug 2011 16:43:51 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A723D86E9@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
	<1313755918.6607.56.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A723D86E7@dekaexchange07.deka.local>
	<1313766997.6607.66.camel@sauron>
	<0A40042D85E7C84DB443060EC44B3FD32A723D86E9@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314020635.2644.121.camel@sauron>
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

On Fri, 2011-08-19 at 13:50 -0400, Eric Millbrandt wrote:
> > -----Original Message-----
> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> > Sent: Friday, August 19, 2011 11:17
> > To: Eric Millbrandt
> > Cc: 'linux-mtd@lists.infradead.org'
> > Subject: RE: ubi volume unmountable after power cut
> >
> > On Fri, 2011-08-19 at 09:42 -0400, Eric Millbrandt wrote:
> > > >> Please, produce the issue and send all messages, not only error
> > > > messages
> > > > which you see on your console. E.g, send dmesg output. It is
> > difficult
> > > > to say anything without the full log which should contain flash
> > dump.
> > > >
> > > The full dmesg output can be seen here, http://pastebin.com/Rg1Lcc6U.
> >
> > Would you please enable also the additional UBIFS recovery messages?
> >
> Hopefully this has the additional messages that you are looking for,
> http://pastebin.com/imhJVP3M

Yeah, sorry, no idea. Is this reproducible on other devices?

-- 
Best Regards,
Artem Bityutskiy
