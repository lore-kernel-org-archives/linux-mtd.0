Received: from moutng.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJNjw-0002Qv-01
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 09:26:29 +0000
From: Thorsten =?utf-8?q?M=C3=BChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How stable is jffs2 summarize option?
Date: Tue, 1 Jun 2010 11:26:23 +0200
References: <201005311503.42629.muehlfelder@enertex.de>
	<1275383715.25797.14.camel@macbook.infradead.org>
In-Reply-To: <1275383715.25797.14.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201006011126.23862.muehlfelder@enertex.de>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 01 June 2010 11:15:15 schrieb David Woodhouse:
> On Mon, 2010-05-31 at 15:03 +0200, Thorsten M=C3=BChlfelder wrote:
> > to reduce boot time of a device I want to use the jffs2 summarize option
> > on my root file system. Currently 'm using Linux 2.6.24 on that specific
> > device and the summarize option is marked as "experimental", so I wonder
> > if it is stable enough for a productive system?
> > Are there any well known devices that use this option, too?
> > Do I have to use a newer kernel version?
>
> There are other reasons why you should update from 2.6.24 if you're
> using JFFS2, but I don't think the summary code has changed much since
> then. The only reason it was still marked as 'experimental' is because I
> wanted to optimise the on-medium format.

Hi,

and what do you think about switching to yaffs2? I know it is developed=20
elsewhere, but it seems to be a good alternative to jffs2+summary and=20
probably switching is easier than to ubifs.

Best regards
Thorsten
