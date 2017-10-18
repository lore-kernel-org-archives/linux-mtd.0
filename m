Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4geM-0002jY-1N
 for linux-mtd@lists.infradead.org; Wed, 18 Oct 2017 05:12:15 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9I5BYcM043645
 for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2017 01:11:52 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dnya9axty-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2017 01:11:52 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 18 Oct 2017 01:11:50 -0400
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, William Kennington <wak@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree\@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
In-Reply-To: <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA@mail.gmail.com>
References: <20170905202339.20732-1-wak@google.com>
 <20170921095930.4b473f91@bbrezillon>
 <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
 <8760cbv090.fsf@concordia.ellerman.id.au>
 <20171016175517.264e710a@bbrezillon>
 <CAL_JsqLBkU9habdOhoQ8ZiM=x87eLmuLrS6ujx32UOv8LHc=EA@mail.gmail.com>
Date: Wed, 18 Oct 2017 16:11:33 +1100
MIME-Version: 1.0
Content-Type: text/plain
Message-Id: <87k1zt82gq.fsf@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rob Herring <robh+dt@kernel.org> writes:
> I'd prefer they be documented in the kernel especially if they are
> used by the kernel. Of course, there's IBM bindings covered by various
> ?PAPR specs which wouldn't make sense to duplicate, but I'm guessing
> what's documented in skiboot are not covered by those specs.

Correct.

I don't have an objection to docs being in both places, as long as we
could keep both in sync. Would suitable comments in the RST doc files
pointing to the skiboot repo as the canonical copy work?

I'd like to be able to just diff a subtree of kernel and skiboot to see
if the docs have diverged.

We may also need to think of a way to ensure that any of that moving
back/forth of edits is done in a way that makes licensing sense too
(skiboot is Apache 2.0)

-- 
Stewart Smith
OPAL Architect, IBM.
