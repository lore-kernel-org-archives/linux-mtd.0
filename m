Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NuKBH-0008Ba-IP
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 06:35:12 +0000
Received: by bwz10 with SMTP id 10so8417429bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Mar 2010 23:35:05 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
	<8739zqpxxw.fsf@tac.ki.iif.hu> <4BA9A1BB.4000105@lougher.demon.co.uk>
Date: Wed, 24 Mar 2010 07:35:01 +0100
In-Reply-To: <4BA9A1BB.4000105@lougher.demon.co.uk> (Phillip Lougher's message
	of "Wed, 24 Mar 2010 05:23:07 +0000")
Message-ID: <87y6hii5wq.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Phillip Lougher <phillip.lougher@gmail.com>, linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Ferenc Wagner <wferi@niif.hu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Phillip" == Phillip Lougher <phillip@lougher.demon.co.uk> writes:

Hi,

 Phillip> BTW as a comparison, I have added MTD support to Squashfs
 Phillip> twice in the past, *with* bad block support.  The latest has a
 Phillip> diff patch of ~500 lines, with far less complexity and code
 Phillip> changes necessary.

Could we merge that then please?

Again, what kind of size reduction can we expect from getting rid of the
block layer?

-- 
Bye, Peter Korsgaard
