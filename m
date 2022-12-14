Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BEEC4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTp+uoy8kX16XNcHP0qcMXOvZnuECZd1uTg/J/q/QtQ=; b=bnNkIGjmuGPW5g
	iTbTRp3KBkfyyR8TDQUtjvXhvO2MafqAHKnkUQr4y1sRc+ZeCf0szfdcz+/pbYYbXsOG5Igi/mk/Z
	rDEEiiSx+/s4WDihwojM8+Wu5nPFVvRItPaLCEq/lYNJldCTyEua9ifFmYvqaDd2tbs0cZSOuk9Db
	g6tBGHU7WH5R0VTn/fZYgnTcTyUwnL5iQUQct6wftqgr/k3hecwntztKTjETdkQ2gvRy7+iAqLxMw
	bOCw/B7iFGGFFflRcGVwVic66zlb/sFIgRofgq3QB4/k6bIwLQOGRsNIZVTi/ePMpNsGB5WePvrNo
	su6JWTOvqr57NbvLTvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5WWi-001de8-QA; Wed, 14 Dec 2022 18:30:44 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5WWf-001dbi-Qw
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 18:30:43 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BEISlXT001166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 13:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1671042536; bh=yBGs7uN391IpXsrDxRmFEUWTGiaryut5x17IYCOizWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HX6AQcpAe2+cnC9hTYUfjgWkeHvv1LC4w/UQdsttxATAAzgnydZDPh4r2DWcplfoJ
	 1vqfTJhD0abDlckLtoPygUetxakA9e9fRup+4tlH05DU68oXBxET8mmwotIvCYfECK
	 5HKu/wcqn8EMkAfuyRTI/bTHXL0PNK49CEUvPdQcr84OeW3+kU7SNVZA4+qSirbgTJ
	 3NhaGD5fFBRmef7EqggKdRJ9UhouLLoXZkFyO2r38pU9KYN0rZMddpmYclbj9loR82
	 34hoQmvSNu0DID1RNOJGFVguRqDJF66nyblzlr2E5grx3vdYOtphrf56UdcYP5B82p
	 HiaEQY2wnNKaQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 615B615C40A2; Wed, 14 Dec 2022 13:28:47 -0500 (EST)
Date: Wed, 14 Dec 2022 13:28:47 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Eric Dumazet <edumazet@google.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
        Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
        Stanislav Fomichev <sdf@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Richard Weinberger <richard@nod.at>, x86@kernel.org,
        John Fastabend <john.fastabend@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>, ilay.bahat1@gmail.com,
        Ingo Molnar <mingo@redhat.com>, David Rientjes <rientjes@google.com>,
        Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Petr Mladek <pmladek@suse.com>, david.keisarschm@mail.huji.ac.il,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
        KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>, Borislav Petkov <bp@alien8.de>,
        Hannes Reinecke <hare@suse.de>, Andy Lutomirski <luto@kernel.org>,
        Jiri Pirko <jiri@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        bpf@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Hao Luo <haoluo@google.com>, linux-scsi@vger.kernel.org,
        "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pekka Enberg <penberg@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
        Jiri Olsa <jolsa@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5oV3zVhc2C2sUaF@mit.edu>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
 <20221214162117.GC1062210@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214162117.GC1062210@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_103042_043944_5303250A 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 14, 2022 at 05:21:17PM +0100, Stanislaw Gruszka wrote:
> On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> > On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> > <stanislaw.gruszka@linux.intel.com> wrote:
> > >
> > > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > > Please CC me on future revisions.
> > > >
> > > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > > There's no need to rename anything. So nack on this patch 1/5.
> > >
> > > It is not obvious (for casual developers like me) that p in prandom
> > > stands for predictable. Some renaming would be useful IMHO.

I disagree.  pseudo-random has *always* menat "predictable".  And the
'p' in prandom was originally "pseudo-random".  In userspace,
random(3) is also pseudo-random, and is ***utterly*** predictable.  So
the original use of prandom() was a bit more of an explicit nod to the
fact that prandom is something which is inherently predictable.

So I don't think it's needed to rename it, whether it's to
"predictable_rng_prandom_u32", or "no_you_idiot_dont_you_dare_use_it_for_cryptographi_purposes_prandom_u32".

I think we need to assume a certain base level of competence,
especially for someone who is messing with security psensitive kernel
code.  If a developer doesn't know that a prng is predictable, that's
probably the *least* of the sort of mistakes that they might make.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
