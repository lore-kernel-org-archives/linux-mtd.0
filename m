Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt5qV-0004hI-1h
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 18:55:31 +0000
Date: Mon, 5 May 2008 20:55:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: Compact Flash Questions
Message-ID: <20080505185516.GB18494@logfs.org>
References: <004701c8aec5$c1aed530$6401a8c0@techwriter>
	<20080505115622.37dd45d4@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080505115622.37dd45d4@zod.rchland.ibm.com>
Cc: Yigal Sadgat <YSadgat1@gcte.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 May 2008 11:56:22 -0500, Josh Boyer wrote:
> On Mon, 5 May 2008 08:36:15 -0700
> "Yigal Sadgat" <YSadgat1@gcte.com> wrote:
> 
> > Is this the right place to discuss CF low-level questions like Kernel 
> > drivers?
> 
> Sorry, no.  Compact Flash presents itself as an IDE device, and does
> not allow access to the raw flash contained within.  MTD is used for
> accessing raw flash.
> 
> You might try posting your questions on the linux kernel mailing list.

linux-kernel@vger.kernel.org and possibly linux-ide@vger.kernel.org on
Cc:.  Ignoring any "error was corrected" information is bad advice
indeed, as such data should get rewritten immediately.  And if the
controller is not smart enough to do it automatically, enough errors
will accumulate over time to become uncorrectable.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface.
-- Doug MacIlroy
