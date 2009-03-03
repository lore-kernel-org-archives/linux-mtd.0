Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LeSmM-0005z8-44
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 11:27:20 +0000
Received: by bwz4 with SMTP id 4so2498257bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Mar 2009 03:27:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1236078566.4261.69.camel@localhost.localdomain>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
	<1236062311.4261.43.camel@localhost.localdomain>
	<71cd59b00903022348u34f272cci927fe492c006125d@mail.gmail.com>
	<1236067185.4261.51.camel@localhost.localdomain>
	<52e42efe0903030240i22eb78dcjab2bf37d2e14694c@mail.gmail.com>
	<1236078450.4261.67.camel@localhost.localdomain>
	<1236078566.4261.69.camel@localhost.localdomain>
Date: Tue, 3 Mar 2009 12:27:16 +0100
Message-ID: <71cd59b00903030327x4b875f6eoe22c35e14f992389@mail.gmail.com>
Subject: Re: libubiio : userspace UBI input output library
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Sidney Amani <seed95@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 3, 2009 at 12:09 PM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Tue, 2009-03-03 at 13:07 +0200, Artem Bityutskiy wrote:
>> On Tue, 2009-03-03 at 11:40 +0100, Sidney Amani wrote:
>> > Yes, mtd-utils is very messy, when will the new utils replace old one?
>> > We are probably not in the best position to do it.
>>
>> Well, this is historical. I'll try to re-arrange this.
>
> Not sure what you mean. You may always clone the tree and have
> your own. And send the bits which are ready and of general interest
> out, making sure they are merged. Then you re-base. This is
> how this stuff usually goes, at least in the kernel.

Yep, it's what he/I ment.
I'm already familiar with the process, it's how it works between
acpi4asus and the acpi subsystem :)



-- 
Corentin Chary
http://xf.iksaif.net
