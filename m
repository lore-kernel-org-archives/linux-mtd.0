Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uboz7-00007Z-2f
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 09:23:57 +0000
Received: by mail-we0-f176.google.com with SMTP id p60so5864986wes.21
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 02:23:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368431347.5360.16.camel@sauron.fi.intel.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
 <CAFLxGvxDHQREp9HjWgpbN0XCh6k42qDMk2JKiVU9r7jHU4De9w@mail.gmail.com>
 <1368431347.5360.16.camel@sauron.fi.intel.com>
Date: Mon, 13 May 2013 11:23:34 +0200
Message-ID: <CAFLxGvxiaocoFBqvQ7jpFiL5wq=C9NdTT3BB5CON50yobj97ag@mail.gmail.com>
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

On Mon, May 13, 2013 at 9:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2013-04-20 at 09:50 +0200, richard -rw- weinberger wrote:
>> You mean "ubi fastmap memory leak"? No need to worry, it is on my radar.
>> But as the issue is not a show-stopper I have to take care first of
>> problems with
>> higher priority.
>
> I actually meant this one:
> http://lists.infradead.org/pipermail/linux-mtd/2012-December/045184.html

Fair point. The issue really got lost under my workload.
This can happen in open source development.

Anyway, replying to Philipp now...

--
Thanks,
//richard
