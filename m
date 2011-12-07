Received: from mail-ww0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYM0i-00065t-3c
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 18:14:29 +0000
Received: by wgbdt12 with SMTP id dt12so2251853wgb.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 10:14:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323205335.2710.2.camel@koala>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323205335.2710.2.camel@koala>
Date: Wed, 7 Dec 2011 10:14:25 -0800
Message-ID: <CAN8TOE8T4iK0QBBOKZhtZV_6WZ5BDtqxC2zrxdMXAJSoBmaLcQ@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 01/13] nand-data: update TC58DVM72A1TG00 BBM info
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 6, 2011 at 1:02 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-12-06 at 12:07 +0000, Angus CLARK wrote:
>> Update Toshiba TC58DVM72A1TG00 bad block marker information to "1st page (6th
>> byte in OOB = non FFh)", as described in datasheet, and confirmed with Toshiba
>> engineers.
>>
>> Signed-off-by: Angus Clark <angus.clark@st.com>
>
> Thanks, I'll let Brian comment on this first.

I'll get to all of these eventually!

Regarding this patch:

I believe I misread my data sheet on this one. Thanks for reviewing.

Not sure if an Ack or Signed-off-by is in order...

Acked-by: Brian Norris <computersforpeace@gmail.com>
