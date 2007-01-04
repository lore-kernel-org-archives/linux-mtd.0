Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2T6E-0002cP-VL
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 08:57:47 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id l04DvRa3016876
	for <linux-mtd@lists.infradead.org>; Thu, 4 Jan 2007 08:57:27 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	l04DvRm2509394
	for <linux-mtd@lists.infradead.org>; Thu, 4 Jan 2007 06:57:27 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l04DvQEE024332
	for <linux-mtd@lists.infradead.org>; Thu, 4 Jan 2007 06:57:27 -0700
Subject: Re: OneNAND: read-while-load
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Adrian Hunter <hunter.programmer@gmail.com>
In-Reply-To: <740e30f50701040414v15faa160i83a52e94068f6c0b@mail.gmail.com>
References: <740e30f50701040055r4d8d8472m299d697b51bd6120@mail.gmail.com>
	<625fc13d0701040335y41d8f811w5cb24646725f2e4c@mail.gmail.com>
	<740e30f50701040414v15faa160i83a52e94068f6c0b@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 04 Jan 2007 07:57:47 -0600
Message-Id: <1167919067.3836.43.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-01-04 at 14:14 +0200, Adrian Hunter wrote:
> On 1/4/07, Josh Boyer <jwboyer@gmail.com> wrote:
> > On 1/4/07, Adrian Hunter <hunter.programmer@gmail.com> wrote:
> > > Hi
> > >
> > > Here is a patch that implements read-while-load for OneNAND.  My
> > > testing shows that it gives a measurable performance improvement for
> > > large reads.
> > >
> > > Sorry the patch is in an attachment, but I have email problems.
> >
> > You're using a gmail account... what possible email problems could you have?
> >
> > josh
> >
> 
> It word-wraps.  Maybe it is the browser: firefox 2.0
> 
> I do use plain text and view original, but it goes like this:

I see nothing corrupted about the patch.  Whitespace is preserved and I
don't see any word wraps.  Both in my gmail account, and this account
(evolution as the mailer).

At any rate, if you do have issues maybe David can give you an account
on infradead.

josh
