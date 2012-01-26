Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqSUl-0004ob-CK
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 16:48:19 +0000
In-Reply-To: <alpine.DEB.2.00.1201260936440.11174@utopia.booyaka.com>
References: <4F206213.9070704@flatfrog.com>
 <alpine.DEB.2.00.1201251351500.5324@utopia.booyaka.com>
 <4F2127B8.9000005@flatfrog.com> <4F213ED8.2020500@flatfrog.com>
 <alpine.DEB.2.00.1201260801410.11174@utopia.booyaka.com>
 <OF645D734B.78418504-ONC1257991.005A101B-C1257991.005A7809@transmode.se>
 <alpine.DEB.2.00.1201260934190.11174@utopia.booyaka.com>
 <alpine.DEB.2.00.1201260936440.11174@utopia.booyaka.com>
Subject: Re: CONFIG_PREEMPT and JFFS2 oops
To: Paul Walmsley <paul@pwsan.com>
Message-ID: <OF4651C12F.58F763E5-ONC1257991.005C0D05-C1257991.005C4F23@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 17:48:15 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Purdie <rpurdie@openedhand.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Orjan Friberg <of@flatfrog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Walmsley <paul@pwsan.com> wrote on 2012/01/26 17:38:46:
>
> On Thu, 26 Jan 2012, Paul Walmsley wrote:
>
> > On Thu, 26 Jan 2012, Joakim Tjernlund wrote:
> >
> > > I think I found one bug by looking at the patch. You need 2 buffers, one
> > > that holds the latest compressed data and one working buffer.
> >
> > Thanks, I think you're right.  Here's an updated patch.
>
> ... which has another minor bug: it leaks memory if the first allocation
> fails.  Here's a version with that fixed.

Still leeks:
+		 		 		 		 best_slen = tdl;
+		 		 		 		 best_buf = tmp_buf;
+		 		 		 		 best = this;

You just throw away best_buf here, don't you?
