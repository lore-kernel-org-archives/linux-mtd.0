Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTvPP-0007b1-GJ
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 17:19:47 +0000
From: Jeff Moyer <jmoyer@redhat.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824161837.GA28975@localhost>
Date: Mon, 24 Aug 2015 13:19:24 -0400
In-Reply-To: <20150824161837.GA28975@localhost> (Brian Norris's message of
 "Mon, 24 Aug 2015 09:18:37 -0700")
Message-ID: <x49si78bo4j.fsf@segfault.boston.devel.redhat.com>
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

Brian Norris <computersforpeace@gmail.com> writes:

> On Mon, Aug 24, 2015 at 10:13:25AM +0300, Artem Bityutskiy wrote:
>> Now, some user-space fails when direct I/O is not supported.
>
> I think the whole argument rested on what it means when "some user space
> fails"; apparently that "user space" is just a test suite (which
> can/should be fixed).

Even if it wasn't a test suite it should still fail.  Either the fs
supports O_DIRECT or it doesn't.  Right now, the only way an application
can figure this out is to try an open and see if it fails.  Don't break
that.

Cheers,
Jeff
