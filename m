Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbnTE-0006cJ-Eh
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:46:57 +0000
Message-ID: <1368431347.5360.16.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Date: Mon, 13 May 2013 10:49:07 +0300
In-Reply-To: <CAFLxGvxDHQREp9HjWgpbN0XCh6k42qDMk2JKiVU9r7jHU4De9w@mail.gmail.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
 <CAFLxGvxDHQREp9HjWgpbN0XCh6k42qDMk2JKiVU9r7jHU4De9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-04-20 at 09:50 +0200, richard -rw- weinberger wrote:
> You mean "ubi fastmap memory leak"? No need to worry, it is on my radar.
> But as the issue is not a show-stopper I have to take care first of
> problems with
> higher priority.

I actually meant this one:
http://lists.infradead.org/pipermail/linux-mtd/2012-December/045184.html


-- 
Best Regards,
Artem Bityutskiy
