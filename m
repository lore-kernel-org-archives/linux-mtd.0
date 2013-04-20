Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTSZ0-0003Oi-Nq
 for linux-mtd@lists.infradead.org; Sat, 20 Apr 2013 07:50:27 +0000
Received: by mail-wi0-f172.google.com with SMTP id hq17so1862987wib.5
 for <linux-mtd@lists.infradead.org>; Sat, 20 Apr 2013 00:50:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366374673.29520.125.camel@sauron.fi.intel.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
Date: Sat, 20 Apr 2013 09:50:23 +0200
Message-ID: <CAFLxGvxDHQREp9HjWgpbN0XCh6k42qDMk2JKiVU9r7jHU4De9w@mail.gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 19, 2013 at 2:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
>> the reason we're talking about not allowing write support at the
>> *block* layer
>> is because it's questionable how many people actually want this, the
>> performance isn't good (compared to native flash filesystems), and
>> because the
>> write/wear characteristics are unknown.
>
> My opinion that unless people demonstrate that they need this, e.g. in a
> product, etc, we should not merge this stuff.
>
> We recently merged fastmap, which is a big chunk of code, and it looks
> like no one really needs it. There was a problem report, and Richard
> promised to look, but did not. I do not blame him, he is a busy guy. But
> this shoes that this feature is not really needed, while adds
> maintenance burden.

You mean "ubi fastmap memory leak"? No need to worry, it is on my radar.
But as the issue is not a show-stopper I have to take care first of
problems with
higher priority.

Thanks,
//richard
