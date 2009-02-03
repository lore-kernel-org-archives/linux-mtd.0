Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUIps-0003Qu-H0
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 10:48:59 +0000
Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Feb 2009 12:48:50 +0200
Message-Id: <1233658130.24809.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Corentin Chary <corentin.chary@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-03 at 16:05 +0530, Brijesh Singh wrote:
> On Tue, Feb 3, 2009 at 5:14 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
> > On Mon, Feb 2, 2009 at 12:18 PM, Adrian Hunter
> > <ext-adrian.hunter@nokia.com> wrote:
> >> Artem Bityutskiy wrote:
> >>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
> >>>> I would suggest an intermediate step.  Create UBI2 which is
> >>>> similar to UBI but stores eraseblock information in one place,
> >>>> instead of at the beginning of each eraseblock.  Such an approach
> >>>> might be OK up to as much as 64GiB, and would probably perform
> >>>> better than a fully scalable version.
> >>>>
> >>>> Then look at creating UBI3, which is fully scalable.
> >>>
> >>> Yes, I assume UBI2 should store mapping/erasure information in separate
> >>> tables, not in each eraseblock. So we should get rid of eraseblock
> >>> headers.
> >>
> >> Yes that is what I meant.  You could probably make do with as little as
> >> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
> >> would need 1536KiB table, which could be read in a second or two, so
> >> mount time is OK.
> 
> Adrian,to my understanding, this is minimum info needed per physical
> erase block...
> 
> Erase count                   -8 bytes
> Lnum                             -4 bytes
> Volume ID                      -4 byte(Can make it 1 byte for now as
> vol limit=128)
> Header CRC                   -4 bytes(Only for static volumes.)
> i.e. Minimum 20 bytes.  Is there any other way to make it 12?
> And how to update the table relatively efficiently?

For UBI2 I would just forget about static volumes support. They are not
so necessary, and a rare user needs them. This would simplify things.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
