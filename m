Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHE3q-0000jO-Qt
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 17:09:19 +0000
Received: by mail-pa0-x236.google.com with SMTP id uo6so244806851pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 09:08:57 -0800 (PST)
Date: Thu, 7 Jan 2016 09:08:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2] mtd: spi-nor: wait until lock/unlock operations are
 ready
Message-ID: <20160107170854.GD109450@google.com>
References: <1451336091-8210-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160107012036.GU109450@google.com>
 <CAAEAJfBCRD4QmkyUpH3iqXVd4wbXT=8EbOhnCBoAEk1d8HWtgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfBCRD4QmkyUpH3iqXVd4wbXT=8EbOhnCBoAEk1d8HWtgQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 07, 2016 at 09:42:54AM -0300, Ezequiel Garcia wrote:
> On 6 January 2016 at 22:20, Brian Norris <computersforpeace@gmail.com> wrote:
> > Edited the above sentence, since you're not doing this "only for these
> > manufacturers"; you're doing it for all that support lock/unlock.
> 
> Just to make sure we are on the same page here, this commit only
> changes stm_lock, stm_unlock. So the change currently affects devices that
> match JEDEC_MFR(info) == SNOR_MFR_MICRON.

Yes, that's currently correct. There were attempts to make this work for
Winbond too, but those were mostly reverted recently due to regressions.
I plan to re-extend that support again soon. So depending on when we're
talking about, that statement changes.

Brian
