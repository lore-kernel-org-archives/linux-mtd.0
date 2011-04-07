Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7uDE-0001jr-60
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 18:45:48 +0000
Received: by pxi7 with SMTP id 7so1345753pxi.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 11:45:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 7 Apr 2011 11:45:45 -0700
Message-ID: <BANLkTik9BcPTkgb_AwtmG6TPV1uwSxPP6A@mail.gmail.com>
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Russ Dill <russ.dill@gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 7, 2011 at 8:04 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> the speed of the program is improved by:
> - checking if a block needs to be erased before actually erasing it
> - only writing blocks that are not modified
>

I would caution against treating all 0xff blocks as being erased. A
partially erased block will often return mostly 0xff, but some of the
bits are random. If they return 1, you'll think all is well when it is
not. This is why jffs2 has clean-markers. Secondarily, a partially
erased block that randomly returns a few bits that match you data to
be written would also be bad. In fact, no matter what stage power was
lost during an erase cycle, no matter how marginal any percentage of
the bits, your tool will smile and nod if it is writing all zeros.
