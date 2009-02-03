Received: from qb-out-1314.google.com ([72.14.204.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUJoB-0002US-6J
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 11:51:17 +0000
Received: by qb-out-1314.google.com with SMTP id q13so774385qbq.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 03:51:14 -0800 (PST)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
In-Reply-To: <71cd59b00902030313v47c2861anb8078e1f75de7eeb@mail.gmail.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<1233658015.24809.105.camel@localhost.localdomain>
	<71cd59b00902030313v47c2861anb8078e1f75de7eeb@mail.gmail.com>
Date: Tue, 3 Feb 2009 17:21:14 +0530
Message-ID: <6b5362aa0902030351q6cc5a612vccf902c2705b7e3d@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Brijesh Singh <brij.singh@samsung.com>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 3, 2009 at 4:43 PM, Corentin Chary <corentin.chary@gmail.com> wrote:
> On Tue, Feb 3, 2009 at 11:46 AM, Artem Bityutskiy
> <dedekind@infradead.org> wrote:
>> On Tue, 2009-02-03 at 00:44 +0100, Corentin Chary wrote:
>>> I was wondering how it is possible to get atomic operations using such tables ?
>>> The first thing that come to my mind is TFAT (two tables, one for
>>> operation in progress,
>>> the other considered as always "valid"). But I'm not sure it' the good
>>> way to do such a thing.
>>
>> Journal + commit mechanisms should allow doing this.
>
> I'm asking some other questions, because in UFFS we are working on
> something like that, but not for UBI2. But if I can help for UBI2,
> I'll.
>
> A journal node, would probably take less than 16 B. With min_io_size
>>= 512 B (sometime 2KB), a journal for map/unmap operation will take
> some time before being written.
>
> I see two solutions, based on periodic journal write with padding to
> have min_io_size bytes to write:
> - based on time (every X ms)
> - based on changes (every X changes)
> - based on both
> But there is probably more clever solutions.
I will check this.As of now I don't find a way to skip writing journal
node.For consistency,
you have to.
>
> One other thing is the table will have to move on the flash for wear
> leveling, but for that we can use the "anchors" as defined in JFFS3
> pdf.
This will move on flash. In UBI,there is a small trick. Journal and
commit can be on internal volumes.
So it easily gets wear-leveled.

And the Super block will know where are they?Super block can be
logged. Fixed in 0-5 blocks.

Best Regards,
Brijesh
