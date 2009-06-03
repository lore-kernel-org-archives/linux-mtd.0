From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org,
 dedekind@infradead.org
Subject: Re: UBIFS Corrupt during power failure
Date: Wed, 3 Jun 2009 10:25:03 +0200
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<1244016510.5847.38.camel@localhost.localdomain>
In-Reply-To: <1244016510.5847.38.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906031025.04241.sr@denx.de>
Cc: Eric Holmberg <Eric_Holmberg@trimble.com>,
	Jamie Lokier <jamie@shareable.org>, Urs Muff <urs_muff@trimble.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 June 2009 10:08:30 Artem Bityutskiy wrote:
> On Fri, 2009-05-15 at 09:16 +0200, Stefan Roese wrote:
> > Do you have an update for this? What's the current status on your system
> > now? Which patches did you apply to work reliably with the Spansion
> > FLASH?
> >
> > I'm asking since we are seeing a similar issue on one of our boards
> > equipped with the S29GL512P. This simple script triggers problems upon
> > the next mount:
>
> FYI. Since this issue has not been resolved due to lack of information,
> I've updated UBIFS FAQ and put a note about this issue there:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_powercut

Yes, I already noticed this. Thanks.

Best regards,
Stefan
