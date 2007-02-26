Received: from nf-out-0910.google.com ([64.233.182.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HLoEI-00050c-7P
	for linux-mtd@lists.infradead.org; Mon, 26 Feb 2007 17:22:01 -0500
Received: by nf-out-0910.google.com with SMTP id a4so1942950nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Feb 2007 14:21:56 -0800 (PST)
Message-ID: <625fc13d0702261421w32be087el4f0a23efef3fa4ad@mail.gmail.com>
Date: Mon, 26 Feb 2007 16:21:55 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
In-Reply-To: <1172528274.3560.5.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <B1EDF20A6EAAD74EA65E46F774F17845E9329B@orsmsx413.amr.corp.intel.com>
	<1172528274.3560.5.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, "Johnson,
	Charles F" <charles.f.johnson@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/26/07, David Woodhouse <dwmw2@infradead.org> wrote:
> > Any support yet in MTD for ONFI 1.0 ??  (I couldn't find anything in
> > the 2.6.20rc6 kernel I was browsing.)
>
> I've not heard of ONFI. What's that?

I assume this:

http://www.onfi.org/

But that looks more like a hardware interface than software.  Which
means MTD has nothing to do with it.

josh
