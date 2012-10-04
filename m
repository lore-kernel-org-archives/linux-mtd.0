Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJctF-0002VO-Rn
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 04:18:26 +0000
Received: by mail-lb0-f177.google.com with SMTP id gi11so58981lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2012 21:18:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20121003201447.18ad7d2e@skate>
References: <1349191749-5247-1-git-send-email-richard@nod.at>
 <20121003201447.18ad7d2e@skate>
Date: Wed, 3 Oct 2012 21:18:18 -0700
Message-ID: <CAN8TOE-BsjD_hhD+diL6dKd=+mTa-vwB7P86UQMBacefk6gspw@mail.gmail.com>
Subject: Re: [PATCH] mtd-www: Add fastmap doc
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I made a quick read of your review.

On Wed, Oct 3, 2012 at 11:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue,  2 Oct 2012 17:29:09 +0200, Richard Weinberger wrote:
>> +<h4><a name="L_fastmap_compat">Backwards compatibility</a></h4>
>> +<p>The fastmap on-disk data structure makes use of delete compatible volumes,
>> +therefore fastmap enabled images are fully backwards compatible with UBI
>
> backwards -> backward (but I'm not 100%, I'm not a native speaker)

I am a native speaker, and I'm not really sure. There's not any great,
reliable source I can find, but it looks like either is acceptable:

http://itknowledgeexchange.techtarget.com/writing-for-business/backward-compatible-or-backwards-compatible/

>> +<p>A on-disk fastmap contains all information needed to attach the whole image,
>> +namely all erase counter values, a list of all PEBs and their state, a list of
>> +all volumes and their current EBA, ...
>> +To avoid too much writes of the fastmap it contains also a list of PEBs which
>
> it also contains

I would also suggest:

s/too much/too many/
s/fastmap/fastmap,/

Brian
