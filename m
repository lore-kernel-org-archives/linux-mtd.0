Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUF3o-0007GQ-8a
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 14:18:48 +0000
From: Jeff Moyer <jmoyer@redhat.com>
To: Chris Mason <clm@fb.com>
Cc: Dave Chinner <david@fromorbit.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824161837.GA28975@localhost>
 <x49si78bo4j.fsf@segfault.boston.devel.redhat.com>
 <20150824234611.GV3902@dastard>
 <x49wpwjbh7p.fsf@segfault.boston.devel.redhat.com>
 <20150825141348.GF7176@ret.masoncoding.com>
Date: Tue, 25 Aug 2015 10:18:25 -0400
In-Reply-To: <20150825141348.GF7176@ret.masoncoding.com> (Chris Mason's
 message of "Tue, 25 Aug 2015 10:13:48 -0400")
Message-ID: <x49si77bgem.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chris Mason <clm@fb.com> writes:

>> I do think we should at least document what file systems appear to be
>> doing.  Here's a man page patch for open (generated with extra context
>> for easier reading).  Let me know what you think.
>
> We shouldn't be ignoring it, but instead call it similar to O_DSYNC plus
> removing the pages from cache.

Ah, right.  I'll fix that up, thanks.

-Jeff
