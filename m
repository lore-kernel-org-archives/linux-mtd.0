Received: from [213.86.99.236] (helo=[172.16.18.64])
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B9L5I-0004Es-8O
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2004 10:35:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <200404020849.i328nX468401@maple.icpdas.com>
References: <200404020849.i328nX468401@maple.icpdas.com>
Content-Type: text/plain
Message-Id: <1080898530.1213.49.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 02 Apr 2004 10:35:31 +0100
Content-Transfer-Encoding: 7bit
Subject: Administrivia [Re: VIRUS IN YOUR MAIL]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have just reported this mail abuse to the postmaster responsible, and
to the upstream abuse contact. 

This wasn't a subscriber, but just a reminder to the rest of you -- if
you have a virus checker which can be configured to send 'bounces' to
the apparent sender of a mail to which it objects, ensure that
misfeature is turned _OFF_. 

These things are all faking the sender now, and by sending a mail like
that you're abusing an innocent third party and making yourself part of
the _problem_ rather than part of the solution.

This one was particularly broken and dangerous because it sent its
'bounce' with a non-empty reverse-path, in violation of RFC2821 and
common sense -- making it likely to cause mail loops, and meaning that
it got past the filter which prevents bounces from getting through to
the list. 

-- 
dwmw2
