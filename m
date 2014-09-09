Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRUnG-0000Aa-90
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 23:25:50 +0000
Received: by mail-ob0-f170.google.com with SMTP id wo20so171786obc.29
 for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2014 16:25:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410173401.10764.145.camel@sauron.fi.intel.com>
References: <CAE2F3rC0Pm+xoJeBmU3Qoq25QoQ2ME1n+SHJHq9R3OA+uDPYPA@mail.gmail.com>
 <1410173401.10764.145.camel@sauron.fi.intel.com>
Date: Tue, 9 Sep 2014 16:25:28 -0700
Message-ID: <CAE2F3rAZp1w4mJTAjAwLo7TT=6YQ=ANiJEngB8WRM73occSV=g@mail.gmail.com>
Subject: Re: ubifs_dump_node must bounds check ubifs_ch->len
From: Daniel Mentz <danielmentz@google.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 8, 2014 at 3:50 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2014-08-28 at 15:37 -0700, Daniel Mentz wrote:
>> I believe that ubifs_dump_node() must bounds check ch->len in the
>> UBIFS_DATA_NODE case. It currently does not which resulted in a crash
>> on a system. See below.
> Will I feel lucky asking you whether you was going to send a patch? :-)

Thanks for your comments. Yes I'm working on a patch, but I'm not sure
when it's going to be ready.
