Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrEsy-0007YZ-0I
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 00:46:40 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id F25BB2063F
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2015 00:46:18 +0000 (UTC)
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 944A22089F
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2015 00:46:17 +0000 (UTC)
Received: by ykek133 with SMTP id k133so55426706yke.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 17:46:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151027225000.GA64073@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
 <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
 <20151027225000.GA64073@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Oct 2015 19:45:57 -0500
Message-ID: <CAL_JsqKz63fqfDAwLv8u0dJL1eBxKd-41k7LgU96ku4Ke=383A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding
 specification
To: Brian Norris <computersforpeace@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 27, 2015 at 5:50 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, Oct 26, 2015 at 11:35:24PM -0500, Rob Herring wrote:
>> On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > Hi DT maintainers,
>> >
>> > It's a bit hypocritical of me, since I've been a slow reviewer as well,
>> > but... can we get some review on this one? Usually, I'm comfortable
>> > taking driver DT bindings without your review, but this one is a bit
>> > more generic and is more far-reaching than the average driver.
>>
>> Sorry, missed this one. This would be a good one to send to
>> devicetree-spec to BTW.
>
> I'm not very familiar with that list. With the intention of getting into
> an ePAPR (or similar) spec? Or just for additional review? If the
> former, would you suggest codifying both the old and the new, or just
> the new?

I would say it is for anything not driver specific. It was created to
separate out the driver binding firehose from the common bindings and
get more non-Linux participation on those. Perhaps it was poorly
named. I want to improve the split in docs so the appropriate list is
used.

Sending to both devicetree and devicetree-spec is fine.

Rob
