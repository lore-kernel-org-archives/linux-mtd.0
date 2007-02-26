Received: from nf-out-0910.google.com ([64.233.182.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HLpLT-0005qJ-0o
	for linux-mtd@lists.infradead.org; Mon, 26 Feb 2007 18:33:29 -0500
Received: by nf-out-0910.google.com with SMTP id a4so1961526nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Feb 2007 15:33:24 -0800 (PST)
Message-ID: <625fc13d0702261533u67a81fd7s22ece07b292913fb@mail.gmail.com>
Date: Mon, 26 Feb 2007 17:33:24 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F17845E93644@orsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0702261421w32be087el4f0a23efef3fa4ad@mail.gmail.com>
	<B1EDF20A6EAAD74EA65E46F774F17845E93644@orsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/26/07, Johnson, Charles F <charles.f.johnson@intel.com> wrote:
> Of the ONFI 1.0 spec, section 5, page 39 describes the command set.  I
> assume you'd need a MTD driver to implement this command set ?

Yes, MTD would need to use those opcodes to talk to an ONFI compliant
chip.  But that is
still more of a HW detail.  It's really no different than supporting
any other chip.  And from
what I can tell, most of those opcodes are already used in MTD.  So
basically, someone
would have to try and use MTD on an OFNI compliant chip and see what's lacking.

josh
