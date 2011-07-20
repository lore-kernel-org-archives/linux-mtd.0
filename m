Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjWM5-0003G2-UN
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 12:58:26 +0000
Received: by pvg20 with SMTP id 20so194902pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 05:58:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1311165141.20738.171.camel@sauron>
References: <CACTFLANAFT=G4kFvHUqvLrt=MxgpJnJ-EeHY8zd49pZvsNRejw@mail.gmail.com>
	<1311139283.20738.150.camel@sauron>
	<CACTFLANrd0FO9GNJpvS+MxnQgLLtXpA-sai30oYN90cjEFOErA@mail.gmail.com>
	<1311165141.20738.171.camel@sauron>
Date: Wed, 20 Jul 2011 14:50:48 +0200
Message-ID: <CACTFLAPidcRtg9qH8FwdVZWUQeyBVgKgVGgc=NNzdGhU6OAr=A@mail.gmail.com>
Subject: Re: Regression in handling of unsafe UBI shutdown
From: Daniel Mack <zonque@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sven Neumann <s.neumann@raumfeld.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 20, 2011 at 2:32 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-07-20 at 11:18 +0200, Daniel Mack wrote:

>> So, let me re-phrase my question: is anyone aware of changes in the
>> UBIFS code between 2.6.36 and 3.0 that might cause trouble to U-Boot's
>> UBI code from 2009?
>
> I guess that would be an on-flash format change? I am not aware of such
> changes, and if there were such - this is a big issue which we wound
> need to fix.

Yes. And more tests show that we appearantly also have a more severe
problem here. Some devices that have been power-cut during operation
even refuse to create a new UBI from Linux on the NAND after they're
toast (we use this procedure as a debricking option for customers).
The only thing that helps in such cases is erasing the NAND from
U-Boot. After that, the UBI creation works again. Any more ideas on
how to debug this would be appreciated.


Daniel
