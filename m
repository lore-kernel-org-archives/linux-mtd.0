Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9Bv7-0000gc-FJ
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 15:24:12 +0000
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
 [209.85.220.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6821A21949
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 15:23:48 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r64so16609768qkc.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 08:23:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87k1zt82gq.fsf@linux.vnet.ibm.com>
References: <20170905202339.20732-1-wak@google.com>
 <20170921095930.4b473f91@bbrezillon>
 <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
 <8760cbv090.fsf@concordia.ellerman.id.au> <20171016175517.264e710a@bbrezillon>
 <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA@mail.gmail.com>
 <87k1zt82gq.fsf@linux.vnet.ibm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Oct 2017 10:23:26 -0500
Message-ID: <CAL_JsqKr5eh4_OQAaz49XUTSRABCSeU4aeyWMpmv6pmaCyLtSg@mail.gmail.com>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michael Ellerman <mpe@ellerman.id.au>, William Kennington <wak@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 18, 2017 at 12:11 AM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> Rob Herring <robh+dt@kernel.org> writes:
>> I'd prefer they be documented in the kernel especially if they are
>> used by the kernel. Of course, there's IBM bindings covered by various
>> ?PAPR specs which wouldn't make sense to duplicate, but I'm guessing
>> what's documented in skiboot are not covered by those specs.
>
> Correct.
>
> I don't have an objection to docs being in both places, as long as we
> could keep both in sync. Would suitable comments in the RST doc files
> pointing to the skiboot repo as the canonical copy work?

I'm okay if the kernel just references the skiboot doc and when we
review that, we can review the link. If it's something intended to be
common (among devices), then I'd like it to be documented within the
main binding docs (i.e. the kernel ones).

Of course, I will feel differently if everyone wanted to do this or
the bindings conflict with upstream bindings.

> I'd like to be able to just diff a subtree of kernel and skiboot to see
> if the docs have diverged.
>
> We may also need to think of a way to ensure that any of that moving
> back/forth of edits is done in a way that makes licensing sense too
> (skiboot is Apache 2.0)

Yeah, that's not the only licensing issue. Any volunteers to clean up
ambiguous licensing.

Rob
