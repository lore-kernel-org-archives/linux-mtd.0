Received: from [81.2.110.250] (helo=lxorguk.ukuu.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Js3pz-0002gS-He
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 22:34:44 +0000
Date: Fri, 2 May 2008 23:26:16 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Trent Piepho <xyzzy@speakeasy.org>
Subject: Re: [PATCH] jffs2: Correct language use
Message-ID: <20080502232616.4eed5b5d@core>
In-Reply-To: <Pine.LNX.4.64.0805021233070.1128@t2.domain.actdsltmp>
References: <20080502143240.163e0819@core>
	<Pine.LNX.4.64.0805021233070.1128@t2.domain.actdsltmp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 May 2008 12:51:54 -0700 (PDT)
Trent Piepho <xyzzy@speakeasy.org> wrote:

> On Fri, 2 May 2008, Alan Cox wrote:
> > The verb form of journal is "to journalise" not "to journal". Verified
> > with the OED and querying the British Computer Society. The s/z is
> > debatable but as the US prefers the s and the BCS prefers the s (and
> > Dwmw2 is in Cambridge which favours 's' over the Oxford 'z' ;)) we'll use
> > the s form.
> 
> Google hits:
> journalising filesystem	641
> journalizing filesystem	2,090
> journaling filesystem	104,000
> journalling filesystem	63,600

Google isn't a good guide as a lot of it is Linux material but a lot of
people seem to really dislike journalising so I withdraw the patch. It's
not *that* important !

Alan
