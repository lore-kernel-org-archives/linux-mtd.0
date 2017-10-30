Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e95kk-0005fs-Ed
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 08:49:04 +0000
Date: Mon, 30 Oct 2017 09:48:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Rob Herring
 <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyril Bur
 <cyrilbur@gmail.com>, William Kennington <wak@google.com>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Message-ID: <20171030094829.63730a19@bbrezillon>
In-Reply-To: <87k1zt82gq.fsf@linux.vnet.ibm.com>
References: <20170905202339.20732-1-wak@google.com>
 <20170921095930.4b473f91@bbrezillon>
 <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
 <8760cbv090.fsf@concordia.ellerman.id.au>
 <20171016175517.264e710a@bbrezillon>
 <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA@mail.gmail.com>
 <87k1zt82gq.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Oct 2017 16:11:33 +1100
Stewart Smith <stewart@linux.vnet.ibm.com> wrote:

> Rob Herring <robh+dt@kernel.org> writes:
> > I'd prefer they be documented in the kernel especially if they are
> > used by the kernel. Of course, there's IBM bindings covered by various
> > ?PAPR specs which wouldn't make sense to duplicate, but I'm guessing
> > what's documented in skiboot are not covered by those specs.  
> 
> Correct.
> 
> I don't have an objection to docs being in both places, as long as we
> could keep both in sync. Would suitable comments in the RST doc files
> pointing to the skiboot repo as the canonical copy work?

Rob, any opinion on that?

> 
> I'd like to be able to just diff a subtree of kernel and skiboot to see
> if the docs have diverged.
> 
> We may also need to think of a way to ensure that any of that moving
> back/forth of edits is done in a way that makes licensing sense too
> (skiboot is Apache 2.0)
> 
