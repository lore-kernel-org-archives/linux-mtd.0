Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTcGi-0000ao-Ns
 for linux-mtd@lists.infradead.org; Sat, 20 Apr 2013 18:12:13 +0000
Received: by mail-vb0-f47.google.com with SMTP id x13so4648554vbb.20
 for <linux-mtd@lists.infradead.org>; Sat, 20 Apr 2013 11:12:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5171794F.8000501@am.sony.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
 <5171794F.8000501@am.sony.com>
Date: Sat, 20 Apr 2013 11:12:08 -0700
Message-ID: <CAN8TOE8iA5qzC=CT_h8TVDN1SWxhmEW-WJ_uRh-8j=FmfMQfhQ@mail.gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Brian Norris <computersforpeace@gmail.com>
To: Tim Bird <tim.bird@am.sony.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, Mike Frysinger <vapier@gentoo.org>,
 dedekind1@gmail.com,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 19, 2013 at 10:05 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> On 04/19/2013 05:31 AM, Artem Bityutskiy wrote:
>> We recently merged fastmap, which is a big chunk of code, and it looks
>> like no one really needs it. There was a problem report, and Richard
>> promised to look, but did not. I do not blame him, he is a busy guy. But
>> this shows that this feature is not really needed, while adds
>> maintenance burden.
>
> Whoa there!  Just because it doesn't look like people are using fastmap
> right now, don't think it won't get used in the future.   Really,
> the people interested in fastmap are AFAIK mostly TV vendors, who are
> just now migrating to 3.0 or 3.4 kernels.  I can assure you that fastmap
> will get more attention when the major CE companies move to more
> recent kernels (probably in about 1 to 2 years).

I'll second Tim's point here. We will likely use fastmap here
(Broadcom) soon. We're currently migrating to a 3.8 kernel, and
smaller mount/boot times are always a bonus for us. Don't jump ship on
this feature too soon!

Brian
