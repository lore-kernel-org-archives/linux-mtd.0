Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KpwMU-0008CZ-5O
	for linux-mtd@lists.infradead.org; Wed, 15 Oct 2008 02:43:46 +0000
Received: by gxk3 with SMTP id 3so6228434gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Oct 2008 19:43:44 -0700 (PDT)
Message-ID: <9c9fda240810141943j694ad673v145a08e33e1b536c@mail.gmail.com>
Date: Wed, 15 Oct 2008 11:43:44 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [RFC] [PATCH] [MTD] [OneNAND] Add write-while-program operation
In-Reply-To: <48F4A345.9090307@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48A43E19.7090706@nokia.com>
	<9c9fda240808151825u2693ab3h3d7524e90a6d24af@mail.gmail.com>
	<48F4A345.9090307@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

>
> We have decided that we would like to use write-while-program. Do you
> have any objections to including this in the OneNAND driver?
>

Could you merge this one to ops style?
I think no problem to merge existing write_ops_operation instead of
new function.

Thank you,
Kyungmin Park
