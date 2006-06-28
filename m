Subject: Re: [RFC] arm : ALIGNMENT_TRAP and MTD
From: David Woodhouse <dwmw2@infradead.org>
To: "Hyok S. Choi" <hyok.choi@samsung.com>
In-Reply-To: <200606281404.06926.hyok.choi@samsung.com>
References: <200606231635.40655.hyok.choi@samsung.com>
	<1151090570.25491.294.camel@localhost.localdomain>
	<1151415031.17609.130.camel@hades.cambridge.redhat.com>
	<200606281404.06926.hyok.choi@samsung.com>
Content-Type: text/plain
Date: Wed, 28 Jun 2006 10:05:26 +0100
Message-Id: <1151485526.6394.318.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-28 at 14:04 +0900, Hyok S. Choi wrote:
> 
> > No, it isn't. ARM was just one of the first CPUs where we really _can't_
> > fix up alignment faults. FR-V is another. It's often done in the MMU, so
> > there's a strong correlation with uCLinux architectures -- and now we've
> > merged uCLinux, it's a problem we should really address properly.
> 
> I agree on this. I'm doing the uClinux merging for ARM architecture.
> 
> How about to make an option for enabling accessing through the get_unaligned() in MTD?
> Then ARM uClinux and FR-V could select/deselect the option and will have no problem.

I don't like that. I'd rather see you add a probability argument to
get_unaligned() instead, as I described in my other email.

-- 
dwmw2
