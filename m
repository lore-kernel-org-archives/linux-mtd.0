Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFi9p-0007PV-BI
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 13:25:31 +0000
Date: Wed, 22 Jun 2016 15:24:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Alexander Kaplan
 <alex@nextthing.co>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: Re: [RFC] Raising the UBI version
Message-ID: <20160622152457.331f9a7e@bbrezillon>
In-Reply-To: <20160622151732.5f448c60@bbrezillon>
References: <57699356.4030802@nod.at> <20160622144344.07ba4d41@bbrezillon>
 <CAOMqctTAEWxzpi6T0M0GvR7L8nbCGVUY_FfpaZXADKEGGoqW5A@mail.gmail.com>
 <20160622151732.5f448c60@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Jun 2016 15:17:32 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Wed, 22 Jun 2016 15:09:59 +0200
> Michal Suchanek <hramrach@gmail.com> wrote:
> 
> > On 22 June 2016 at 14:43, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote:  
> > > On Tue, 21 Jun 2016 21:19:50 +0200
> > > Richard Weinberger <richard@nod.at> wrote:
> > >    
> > >> Dear MTD folks,
> > >>
> > >> For the emerging MLC NAND support we need to change the UBI on-flash format.
> > >> Of course existing UBI images will keep working and remain fully supported.
> > >> Our approach to deal with MLC (and basically TLC) NAND is LEB consolidation.
> > >> In this operation mode a single PEB can host multiple LEBs. In the MLC case 2,
> > >> for TLC 3. For more details please refer to my announcement[0].
> > >> Hosting multiple LEBs in a single PEB means that beside of a single EC header,
> > >> a PEB will carry multiple VID headers, one for each LEB it contains.
> > >> This change needs to be annotated in the EC header.
> > >>
> > >> Both EC and VID headers have a version field. Currently it is set to 1. Our
> > >> original plan was just raising UBI_VERSION to 2, and, of course, accept
> > >> version 1 image as well. The first hassle was that UBI_VERSION is exported
> > >> in /sys/class/ubi/version and libubi refuses to work if the version is not 1.
> > >> Breaking existing userspace tools is not acceptable, so we need another
> > >> approach.
> > >>
> > >> LEB consolidation is not really a completely new UBI implementation, it is
> > >> an addon feature. So we came up with the idea of having feature flags in
> > >> the EC header. Maybe we need later more flags, who knows?
> > >>
> > >> Boris and I sat down and came up with two possible ways to implement such
> > >> flags:
> > >>
> > >> i) Rename ->version in EC and VID headers to ->features. ->features will
> > >>    be evaluated at attach time and UBI has to figure whether it supports
> > >>    all request features. The field is one byte long, therefore we can encode
> > >>    8 features.
> > >>    As starter two features would be supported:
> > >>       UBI_FEAT_BASE   = 1
> > >>       UBI_FEAT_CONSO  = 2
> > >>    That means regular UBI images on SLC would only have set UBI_FEAT_BASE and
> > >>    nothing else. Existing UBI implementations would see ->features with
> > >>    UBI_FEAT_BASE set as ->version = 1, so we're safe. On MLC NAND we'd set
> > >>    UBI_FEAT_BASE and UBI_FEAT_CONSO which would be seen as ->version = 3 and
> > >>    rejected by UBI implementations which do not support LEB consolidation.
> > >>    To not break userspace tools /sys/class/ubi/version would be hardcoded to 1
> > >>    and the ->features field exported in /sys/class/ubi/features and
> > >>    /sys/class/ubi/ubiX/features_used. The features sysfs file denotes what
> > >>    features this UBI implementation supports and features_used shows what
> > >>    features the attached UBI image requested. If we change the UBI on-flash
> > >>    format in a major way, UBI_FEAT_BASE would not be set.
> > >>
> > >> ii) Keep ->version in EC and VID headers and use padding bytes from both headers
> > >>     to add a new ->features field. If ->version is 1, ->features will remain 0
> > >>     and not evaluated. If ->features should be evaluated, ->version will be 2.
> > >>     So, on MLC NAND ->version will be 2 and ->features has UBI_FEAT_CONSO set.
> > >>     This approach is less complicated but we have to claim padding bytes.
> > >>     Of course we also have to hardcode /sys/class/ubi/version to 1 too and having
> > >>     a features file in sysfs.    
> > >
> > > Why do we need to hardcode /sys/class/ubi/version to 1? We just need to
> > > update the mtd-utils to support version 2. Am I missing something?    
> > 
> > Is some code change required in mtd-utils other than the change in
> > version check?

Sorry, forgot to answer this question. Yes, at least ubiformat will
change. The ubimk/rm/rs/...vol should not change.

> > 
> > If not why force everyone to patch their mtd-utils to support doing
> > the same thing when the file reads back 2 instead of 1?  
> 
> Old UBI users will keep exposing version 1. Version 2 will only be used
> for those wanting to enable support for UBI consolidation, so old
> mtd-utils should keep working, unless the user explicitly tried to
> create a consolidated UBI image, or attached the UBI layer to an empty
> partition on an MLC NAND after enabling consolidation support. That's
> rather unlikely, and if it happens it's the end-user fault.
> 
> 
