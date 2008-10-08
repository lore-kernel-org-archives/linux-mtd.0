Received: from wx-out-0506.google.com ([66.249.82.237])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnYOy-0005nC-Kr
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 12:44:28 +0000
Received: by wx-out-0506.google.com with SMTP id s15so856554wxc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 05:44:28 -0700 (PDT)
Date: Wed, 8 Oct 2008 08:43:09 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Mitch Davis <mjd-linux-mtd@afork.com>
Subject: Re: mtd-utils: fec.c uses bcopy()
Message-ID: <20081008124309.GC3447@yoda.jdub.homelinux.org>
References: <8956d4ca0810071727i63554837k923a0091b3ef9bd0@mail.gmail.com>
	<8bd0f97a0810071802t52bc60fs6a230e30d7ed1c8f@mail.gmail.com>
	<8956d4ca0810071936p21240f4dn89e161c6ef07847c@mail.gmail.com>
	<8bd0f97a0810071938s3366f340redc61e87e6b020b8@mail.gmail.com>
	<8956d4ca0810072156w4fcdf1barb2d740e10d97c380@mail.gmail.com>
	<8bd0f97a0810072207h6848895fpea038316aa583fa6@mail.gmail.com>
	<8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8956d4ca0810072306t64d28c8apa888ede8c7ccbc33@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 08, 2008 at 05:06:07PM +1100, Mitch Davis wrote:
> - I've sent my diff twice already.  Can you have a look at it and
>comment please? :-)

Why do you use '\0' for the memcpy operand instead of just
plain 0 or 0x0?

josh
