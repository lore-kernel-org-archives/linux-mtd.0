Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvFso-0002q0-8E
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 11:53:50 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J1J002H505LUS80@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 11:53:45 -0400 (EDT)
Date: Tue, 27 Jun 2006 11:53:45 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] MTD performance issues on XIP configuration.
In-reply-to: <1151422807.17609.176.camel@hades.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.64.0606271151170.28771@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
	<1151415660.17609.132.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.56.0606271510390.31772@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271127300.28771@localhost.localdomain>
	<1151422807.17609.176.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org, davide.cascone@st.com,
	Alexey Korolev <akorolev@pentafluge.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jun 2006, David Woodhouse wrote:

> On Tue, 2006-06-27 at 11:30 -0400, Nicolas Pitre wrote:
> > What is this patch doing?
> > 
> > Why are you completely pulling out the adaptative delay logic?
> 
> Since Alexey is now using an email account I provided for him, instead
> of Intel's horribly broken mail setup, you ought to be able to find the
> _first_ mail in this thread, in which he did have a vaguely coherent
> explanation for dropping it.

The first mail in _this_ thread contains a completely (and AFAICS 
correct) patch which is completely different from the resent one, adding 
to my confusion.


Nicolas
