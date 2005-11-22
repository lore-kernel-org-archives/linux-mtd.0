Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeRY2-0001Gi-On
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 01:22:40 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Nov 2005 19:21:17 +1300
References: <200511161024.00999.manningc2@actrix.gen.nz>
	<437B3BE4.1000902@yandex.ru>
	<20051116170642.GC24753@wohnheim.fh-wedel.de>
In-Reply-To: <20051116170642.GC24753@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200511221921.18045.manningc2@actrix.gen.nz>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: Some JFFS3 feedback
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 November 2005 06:06, J=F6rn Engel wrote:
> On Wed, 16 November 2005 17:02:12 +0300, Artem B. Bityutskiy wrote:
> > Charles Manning wrote:
> > >About 9 years back, I did some flash file system patent research and
> > > IIRC one of the patents covered something very similar to the Wanderi=
ng
> > > Tree approach to addressing the write-in-place problem, so there might
> > > be some IP issues with this. I shall have a scratch around to see if I
> > > can find it (though finding something in a 20+ year old paper mountain
> > > is a challenge).
> >
> > Hmm, it is interesting. We would be very appreciated if you provide some
> > information.
>
> Definitely.  If there is a patent on this, we need to do the usual
> dance to find some prior art and either invalidate the patent or make
> it specific enough to be trivially avoided.

I have discussed this with others and there would appear to be some closene=
ss=20
to WAFL. This has been discussed copiously in the context of ReiserFS and=20
prior art has been established.

Short answer: it should not be a problem.

#discalimer I'm not a lawyer and all that.

=2D- CHarles
