Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or3Zj-0001Nk-9f
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 06:47:07 +0000
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Stefani Seibold <stefani@seibold.net>
To: dedekind1@gmail.com
In-Reply-To: <1283356077.2209.19.camel@brekeke>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1280244117.3021.36.camel@localhost.localdomain>
	<1280296009.4310.5.camel@wall-e.seibold.net>
	<1282489456.16502.74.camel@brekeke>
	<1283256587.7515.16.camel@wall-e.seibold.net>
	<1283356077.2209.19.camel@brekeke>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Thu, 02 Sep 2010 08:47:13 +0200
Message-ID: <1283410033.6920.30.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Kreuzer, Michael \(NSN - DE/Ulm\)" <michael.kreuzer@nsn.com>,
	linux-mtd@lists.infradead.org, "Pagliari,
	Vivenzio \(NSN - DE/Ulm\)" <vivenzio.pagliari@nsn.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, den 01.09.2010, 18:47 +0300 schrieb Artem Bityutskiy:
> Hi,
> 
> On Tue, 2010-08-31 at 14:09 +0200, Stefani Seibold wrote:
> > Am Sonntag, den 22.08.2010, 18:04 +0300 schrieb Artem Bityutskiy:
> > > 
> > > Yes, but your patch fixes the symptom, unfortunately. It is ok for you
> > > to use as a work-around, but I still hope to find the root cause.
> 
> > True, but also if we fix the cause, this could happen. Imagine that one
> > of the two master LEB will get corrupted, due a flash error or a power
> > fail during a write access. Than the system should able to mount this
> > damaged file system and restore the lost master LEB.
> 
> Firs of all, UBIFS _does_ handle the situation when on master LEB is
> corrupted. It is designed for this and this part was tested. _But_ UBIFS
> expects that the master LEB is corrupted in _certain way_. If it is
> corrupted in an unexpected way - we panic.
> 
> To put it differently, we do not handle random corruptions, we handle
> only corruptions which _look_ like corruptions caused by power cuts.
> 

That is the point! Panic or refuse to mount is not a good solution. If
there is a way to mount the file system, than do it. Maybe read-only
with a big fat warning, but this is better than nothing. This is like
the ext3 fs, which handles this also in this way.

> In your case you have very strange corruption. We can apply your patch,
> problem solved, but will you be 100% comfortable with this? There is a
> chance that you have some issues which can later have different
> symptoms. I am still interested to find out the real root reason.
> 

No a will be not 100% comfortable with this, but it is better than
nothing. I agree with you to fix the cause and not the symptoms, but may
patch will help to get your data back in case of this bug.
 
Greetings,
Stefani
