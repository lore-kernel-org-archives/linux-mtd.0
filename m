Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LeQ88-0000cB-OA
	for linux-mtd@lists.infradead.org; Tue, 03 Mar 2009 08:37:51 +0000
Received: by bwz4 with SMTP id 4so2437672bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Mar 2009 00:37:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1236067185.4261.51.camel@localhost.localdomain>
References: <52e42efe0903010645t7de56621t59de14626953e0fe@mail.gmail.com>
	<1236062311.4261.43.camel@localhost.localdomain>
	<71cd59b00903022348u34f272cci927fe492c006125d@mail.gmail.com>
	<1236067185.4261.51.camel@localhost.localdomain>
Date: Tue, 3 Mar 2009 09:37:34 +0100
Message-ID: <71cd59b00903030037r587a905ep8d18a5c230b2462b@mail.gmail.com>
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

On Tue, Mar 3, 2009 at 8:59 AM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Tue, 2009-03-03 at 08:48 +0100, Corentin Chary wrote:
>> Hi,
>> We first made that lib for us. And as it can be considered as "usable" (wich is
>> not the case for the rest of the project) we posted it there.
>> If you think it can be merged in mtd-utils, we'll take some time for
>> the coding style
>> and cleanups... I wanted to do that before, but didn't had a lot of
>> time to do so.
>> Which part of mtd-utils could use this lib ? maybe mkfs.ubifs ?
>
> Well, I personally do not see any reason not to merge this. I just
> suggest to work with mtd-utils from the very beginning. I know it looks
> very messy and crappy. But you may make it better while working with it.
> And that would be a great contribution as well. And this would be more
> collaborative, I think.
Indeed. I know there is a lot to do with mtd-utils, but my kernel hacking time
is full these days. I really should find a job where I could be paid for that !

> So far, it looks like ubi-utils/new-utils would be a better place for
> this, isn't it? But it would also be nice to send the source code to the
> ML. It will unlikely get much review, but still.
Ok, in the next weeks we'll make some cleans. Then we'll send patchs
to merge it in mtd-utils.
In the mean time, you can "git clone git://git.uffs.org/libubiio.git"

Thanks
-- 
Corentin Chary
http://xf.iksaif.net
