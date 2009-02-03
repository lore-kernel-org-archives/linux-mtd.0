Received: from qb-out-1314.google.com ([72.14.204.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUId4-0002y5-9G
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 10:35:44 +0000
Received: by qb-out-1314.google.com with SMTP id q13so758479qbq.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 02:35:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
Date: Tue, 3 Feb 2009 16:05:40 +0530
Message-ID: <6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Brijesh Singh <brijesh.s.singh@gmail.com>
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

On Tue, Feb 3, 2009 at 5:14 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
> On Mon, Feb 2, 2009 at 12:18 PM, Adrian Hunter
> <ext-adrian.hunter@nokia.com> wrote:
>> Artem Bityutskiy wrote:
>>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>>>> I would suggest an intermediate step.  Create UBI2 which is
>>>> similar to UBI but stores eraseblock information in one place,
>>>> instead of at the beginning of each eraseblock.  Such an approach
>>>> might be OK up to as much as 64GiB, and would probably perform
>>>> better than a fully scalable version.
>>>>
>>>> Then look at creating UBI3, which is fully scalable.
>>>
>>> Yes, I assume UBI2 should store mapping/erasure information in separate
>>> tables, not in each eraseblock. So we should get rid of eraseblock
>>> headers.
>>
>> Yes that is what I meant.  You could probably make do with as little as
>> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
>> would need 1536KiB table, which could be read in a second or two, so
>> mount time is OK.

Adrian,to my understanding, this is minimum info needed per physical
erase block...

Erase count                   -8 bytes
Lnum                             -4 bytes
Volume ID                      -4 byte(Can make it 1 byte for now as
vol limit=128)
Header CRC                   -4 bytes(Only for static volumes.)
i.e. Minimum 20 bytes.  Is there any other way to make it 12?
And how to update the table relatively efficiently?

> Hi,
> I was wondering how it is possible to get atomic operations using such tables ?
May be keeping a commit block and journal will help.(*Like UBIFS design)

Thanks,
Brijesh
