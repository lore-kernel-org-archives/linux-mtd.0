Received: from smtp6.mindspring.com ([207.69.200.110])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19l7Vq-0004jv-9G
	for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2003 14:42:34 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Fri, 8 Aug 2003 09:42:28 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGEEIEDMAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <1060327833.25209.271.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> > > We _must_ retain the bad block table which was on the device when it
> > > arrived from the factory. 
> > 
> > OK I see.  Would it be valuable then to have a Linux command-line
> > utility which captures the BBT before calling nftl_format, then 
> > is used to restore the BBT after calling nftl_format but before
> > nftl tries to mount any partitions (via 'insmod nftl' or whatever)?
> 
> ... or which writes it back as _part_ of the nftl_format process,
> perhaps?
> 
> Yes, it would be extremely useful to do this.

I will work on this then and feed it back to the list for
evaluation when I have something that works.

Chuck
