Received: from [145.253.187.130] (helo=proxy.baslerweb.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9joM-00024z-TN
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 12:27:26 +0100
From: Thomas Koeller <thomas.koeller@baslerweb.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 15 Oct 2003 13:30:02 +0200
References: <1065598642.12197.6.camel@famine>
	<200310151211.29172.thomas.koeller@baslerweb.com>
	<1066215157.14783.933.camel@hades.cambridge.redhat.com>
In-Reply-To: <1066215157.14783.933.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310151330.02902.thomas.koeller@baslerweb.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: [ECOS] Stress testing JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

thanks for your quick response.

> All correct. But you miss the observation that we also keep a
> raw_node_ref around for _obsolete_ nodes, which perhaps we could avoid.
> In fact, we do this because the raw_node_ref is in a singly-linked list,
> and it's going to be very inefficient to remove obsoleted nodes from
> that list when they become obsolete.

I do not think this path leads anywhere I want to go. The flash size
was chosen to meet the expected storage requirements, which means that
at some point the flash will be filled with valid data and consequently
there will be few obsoleted nodes. I expect this to be true for most
systems.

> Omitting the 'totlen' field should be relatively simple if you're not
> freeing obsolete refs. Observe that in 99% of cases, it's true that
>
> 	ref->totlen == ref_offset(ref->next_phys) - ref_offset(ref)
>
> Make it 100% and make me believe it, and you can remove totlen from the
> structure.
>

I will consider that.

tk
--------------------------------------------------

Thomas Koeller, Software Development

Basler Vision Technologies
An der Strusbek 60-62
22926 Ahrensburg
Germany

Tel +49 (4102) 463-162
Fax +49 (4102) 463-239

mailto:thomas.koeller@baslerweb.com
http://www.baslerweb.com

==============================
