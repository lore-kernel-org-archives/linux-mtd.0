Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVb53-0000u8-SH
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 07:29:26 +0000
Message-ID: <1426058414.1567.2.camel@sauron.fi.intel.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Mar 2015 09:20:14 +0200
In-Reply-To: <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
> > WDYT about this?
> > If it sounds reasonable is there any suggestion where to place such a code?
> 
> Customers often use DYI uninterruptible power supplies using capacitors.
> But managing a power cut is the least problem you have with MLC NAND.

Why is it the least problem, what is the hardest one? I thought this one
is the hardest.

Artem.
