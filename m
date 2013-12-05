Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoUi6-0003Or-5u
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 08:55:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v4 0/4] optimize and clean-up of OMAP NAND and ELM driver
Date: Thu, 5 Dec 2013 08:54:34 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA51F9E@DBDE04.ent.ti.com>
References: <1385374141-10934-1-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA510F4@DBDE04.ent.ti.com>
 <20131205083124.GB4636@norris.computersforpeace.net>
In-Reply-To: <20131205083124.GB4636@norris.computersforpeace.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>I'm sorry to delay this long, but this patch series is still rather
>impenetrable for a third-party reader, and so I really can't give my sign-=
off.
>
>For one, you don't give very good patch titles; 3 of the 4 have "optimize"=
 in
>the title, when in fact that "optimize" does not mean anything about
>optimization, but rather, "unification", "consolidation", "cleanup", or
>something else entirely, depending on which part of the patch you're talki=
ng
>about... which brings me to the next point:
>
I think with all sorts of patches, I feel I have completely re-written the
omap nand driver. After this series and one more, I think there is hardly
any line in omap2.c which is not touched. So, I'm run-out of good titles :-=
)

Anyways, I tried to club the patches more based on functional interfaces li=
ke:
 - All chip->ecc.correct() changes clubbed together in [PATCH 1/4]
 - All chip->ecc.calculate() changes clubbed together in [PATCH 2/4]
 - All chip->ecc.hwctl() changes clubbed together in [PATCH 3/4]
 - All ELM driver cleanup in [PATCH 4/4]


>Patches 1 and 4 are doing much more than one thing. Your commit messages
>-- rather than describing succintly a single change being made -- are a
>description of a list of things that you did, some of which are quite
>independent.
>
Ok I'll first try to break each patch in smaller chunks..
But this would bloat the number of patches, so I would break this series
into multiple series, hope that's fine ?
 - Patch series for chip->ecc.correct()
 - Patch series for chip->ecc.calculate()
 - Patch series for chip->ecc.hwctl()
 - Patch series for ELM=20


>If you need clarification on how you can best rework/resubmit this work,
>please ask. I don't want this series to drag on to version 12+, so let's
>focus on how to get this right now.
>
Agreed, thanks for feedback.
I'll resubmit these patches breaking them into independent versions.
Hopefully then it would be easy to review.

with regards, pekon
