Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvSDL-0002rA-I5
	for linux-mtd@lists.infradead.org; Wed, 28 Jun 2006 01:03:55 -0400
Received: from ep_mmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J1K003PS0Q6X1@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 28 Jun 2006 14:03:42 +0900 (KST)
Received: from hyoklinux ([168.219.193.142])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0J1K00JML0Q5PC@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 28 Jun 2006 14:03:42 +0900 (KST)
Date: Wed, 28 Jun 2006 14:04:04 +0900
From: "Hyok S. Choi" <hyok.choi@samsung.com>
Subject: Re: [RFC] arm : ALIGNMENT_TRAP and MTD
In-reply-to: <1151415031.17609.130.camel@hades.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
Message-id: <200606281404.06926.hyok.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <200606231635.40655.hyok.choi@samsung.com>
	<1151090570.25491.294.camel@localhost.localdomain>
	<1151415031.17609.130.camel@hades.cambridge.redhat.com>
Cc: tglx@linutronix.de, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 27 June 2006 22:30, David Woodhouse wrote:
> On Fri, 2006-06-23 at 21:22 +0200, Thomas Gleixner wrote:
> > 
> > Is there a damn good reason, why the NOMMMU stuff cannot have this
> > active ? If it enables code which is not feasible on NOMMU there are
> > ways to solve such problems quite elegant.
> > 
> > It's not a MTD problem, it's an ARM specific requirement.
> 
> No, it isn't. ARM was just one of the first CPUs where we really _can't_
> fix up alignment faults. FR-V is another. It's often done in the MMU, so
> there's a strong correlation with uCLinux architectures -- and now we've
> merged uCLinux, it's a problem we should really address properly.

I agree on this. I'm doing the uClinux merging for ARM architecture.

How about to make an option for enabling accessing through the get_unaligned() in MTD?
Then ARM uClinux and FR-V could select/deselect the option and will have no problem.

Hyok

-- 
Hyok
ARM Linux 2.6 MPU/noMMU Project http://opensrc.sec.samsung.com/
