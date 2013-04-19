Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTAqp-0005JU-3l
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 12:55:39 +0000
Message-ID: <51713EC3.6070808@parrot.com>
Date: Fri, 19 Apr 2013 14:55:31 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
 <201304190853.54402.vapier@gentoo.org>
In-Reply-To: <201304190853.54402.vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
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

Mike Frysinger a écrit :
> On Friday 19 April 2013 08:31:13 Artem Bityutskiy wrote:
>> On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
>>> the reason we're talking about not allowing write support at the
>>> *block* layer
>>> is because it's questionable how many people actually want this, the
>>> performance isn't good (compared to native flash filesystems), and
>>> because the
>>> write/wear characteristics are unknown.
>> My opinion that unless people demonstrate that they need this, e.g. in a
>> product, etc, we should not merge this stuff.
>>
>> We recently merged fastmap, which is a big chunk of code, and it looks
>> like no one really needs it. There was a problem report, and Richard
>> promised to look, but did not. I do not blame him, he is a busy guy. But
>> this shoes that this feature is not really needed, while adds
>> maintenance burden.
>>
>> To put it differently, I do recommend to merge more UBI-related code
>> without a solid user-base.
> 
> also to be clear, i plan on using UBI block in read-only mode, so i'd like to 
> see an ubiblock driver merged
>
Why can't you use gluebi + mtdblock ?

Too much overhead ?


Matthieu
