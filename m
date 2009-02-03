Received: from mail-fx0-f10.google.com ([209.85.220.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUJDV-0001ag-1W
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 11:13:23 +0000
Received: by fxm3 with SMTP id 3so1712146fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 03:13:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233658015.24809.105.camel@localhost.localdomain>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<1233658015.24809.105.camel@localhost.localdomain>
Date: Tue, 3 Feb 2009 12:13:19 +0100
Message-ID: <71cd59b00902030313v47c2861anb8078e1f75de7eeb@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 3, 2009 at 11:46 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Tue, 2009-02-03 at 00:44 +0100, Corentin Chary wrote:
>> I was wondering how it is possible to get atomic operations using such tables ?
>> The first thing that come to my mind is TFAT (two tables, one for
>> operation in progress,
>> the other considered as always "valid"). But I'm not sure it' the good
>> way to do such a thing.
>
> Journal + commit mechanisms should allow doing this.

I'm asking some other questions, because in UFFS we are working on
something like that, but not for UBI2. But if I can help for UBI2,
I'll.

A journal node, would probably take less than 16 B. With min_io_size
>= 512 B (sometime 2KB), a journal for map/unmap operation will take
some time before being written.

I see two solutions, based on periodic journal write with padding to
have min_io_size bytes to write:
- based on time (every X ms)
- based on changes (every X changes)
- based on both

But there is probably more clever solutions.

One other thing is the table will have to move on the flash for wear
leveling, but for that we can use the "anchors" as defined in JFFS3
pdf.


-- 
Corentin Chary
http://xf.iksaif.net
