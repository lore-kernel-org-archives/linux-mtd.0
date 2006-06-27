Subject: Re: [RFC] arm : ALIGNMENT_TRAP and MTD
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1151090570.25491.294.camel@localhost.localdomain>
References: <200606231635.40655.hyok.choi@samsung.com>
	<1151090570.25491.294.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 14:30:31 +0100
Message-Id: <1151415031.17609.130.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, "Hyok S. Choi" <hyok.choi@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-23 at 21:22 +0200, Thomas Gleixner wrote:
> 
> Is there a damn good reason, why the NOMMMU stuff cannot have this
> active ? If it enables code which is not feasible on NOMMU there are
> ways to solve such problems quite elegant.
> 
> It's not a MTD problem, it's an ARM specific requirement.

No, it isn't. ARM was just one of the first CPUs where we really _can't_
fix up alignment faults. FR-V is another. It's often done in the MMU, so
there's a strong correlation with uCLinux architectures -- and now we've
merged uCLinux, it's a problem we should really address properly.

-- 
dwmw2
