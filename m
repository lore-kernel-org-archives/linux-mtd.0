Received: from py-out-1112.google.com ([64.233.166.180])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GLSSR-0004gt-Q1
	for linux-mtd@lists.infradead.org; Thu, 07 Sep 2006 23:34:56 +0100
Received: by py-out-1112.google.com with SMTP id c31so415612pyd
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Sep 2006 15:33:47 -0700 (PDT)
Message-ID: <cc9bf44d0609071533r10bc5c5cl940088ead9669c4f@mail.gmail.com>
Date: Fri, 8 Sep 2006 08:03:47 +0930
From: "Paul Schulz" <pschulz01@gmail.com>
To: "proclus@gnu-darwin.org" <proclus@gnu-darwin.org>
Subject: Re: [Sfd] FOSS, Science, and Public activism
In-Reply-To: <20060701220824.1EC396B0FDD@gnu-darwin.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20060701220824.1EC396B0FDD@gnu-darwin.org>
Cc: linux-mtd@lists.infradead.org
Reply-To: paul@mawsonlakes.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

On 7/2/06, proclus@gnu-darwin.org <proclus@gnu-darwin.org> wrote:
> It is important to alert the whole FOSS community that Darwin
> cannot be classified as a free or open source operation system
> as of the Darwin-8 revision, because AppleACPIplatform-39 which
> is required to boot the system is proprietary.  It is notable that
> only the current version of Darwin from Apple is a non-free OS.
> GNU-Darwin has a free version, an earlier revision that includes
> the source code.  It is FOSS, and we call upon Apple to maintain
> Darwin as such, as it has been in the past.  We hope that the
> current situation with the kernel and ACPI driver will soon be
> remedied so that Darwin will continue as a FOSS OS.

On a 'smaller' related note.. the ArmCore modules that are made by
Compulab (compulab.co.il) use a proprietory bootloader (ARMMon) for
their Intel Xscale,
system on a chip.

Rather than make use of the mtd drivers for Linux (for whatever reason), they
ship their own binary flash modules for Linux. This is used by both
the bootloader
and the modified linux kernel. This makes is (nearly) impossible to look into
various hardware  related issues on this platform eg.
  - reducing boot time of the Linux kernel
  - evaluating other flash drivers
  - using alternative OS's (L4/pistachio) and
  - running safety critical code directly 'on the metal'.

A nice clean FOSS based counter-example are the GunStix Waysmall systems
(same architecture) built by http://www.gumstix.com.

Regards,
Paul Schulz
